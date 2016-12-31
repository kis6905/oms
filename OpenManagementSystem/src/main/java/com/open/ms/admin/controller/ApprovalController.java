package com.open.ms.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.ms.common.Utility;
import com.open.ms.service.service.ApprovalService;
import com.open.ms.service.service.PersonMoneybookService;
import com.open.ms.service.vo.Approval;
import com.open.ms.service.vo.PersonMoneybook;
import com.open.ms.service.vo.PersonMoneybookApproval;

/**
 * @author iskwon
 */
@Controller
@RequestMapping(value = "/admin/approval/**")
public class ApprovalController {
	
	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	
	@Autowired
	private ApprovalService approvalServiceImpl;
	@Autowired
	private PersonMoneybookService personMoneybookServiceImpl;
	
	/**
	 * 페이지 리턴
	 * 
	 * TODO 각 서비스에 권한을 주는 방식으로 변경함에 따라,
	 * 		기존에 사용하던 한개의 URL로 Page를 판단해 주는 방식(MainController)은 사용할 수 없다.
	 * 		때문에 당장은 Page Title을 jsp에 하드코딩 했는데, 이를 동적으로 주는 방법을 생각해보자.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getPage() {
		
		logger.info("-> []");
		
		logger.info("<- []");
		return "/admin/approval";
	}
	
	/**
	 * 리스트 조회
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public String postList(
			@RequestBody String body,
			HttpServletRequest request) {
		
		logger.info("-> [body = {}]", body);
		
		JSONObject jsonResult = new JSONObject();
		JSONParser jsonParser = new JSONParser();
		
		try {
			JSONObject requestJson = (JSONObject) jsonParser.parse(body);
			
			String startDate = (String) requestJson.get("startDate");
			String endDate = (String) requestJson.get("endDate");
			String statusCode = (String) requestJson.get("statusCode");
			long offset = (long) requestJson.get("offset");
			long limit = (long) requestJson.get("limit");
			String sort = (String) requestJson.get("sort");
			String order = (String) requestJson.get("order");
			
			JSONArray rows = new JSONArray();
			
			List<Approval> approvalList = approvalServiceImpl.getApprovalList(null, null, startDate, endDate, statusCode, offset, limit, sort, order);
			for (Approval vo : approvalList)
				rows.add(vo.toJSONObject());
			
			int totalCnt = approvalServiceImpl.getApprovalListTotalCnt(null, null, startDate, endDate, statusCode);
			
			jsonResult.put("rows", rows);
			jsonResult.put("total", totalCnt);
			
			logger.info("~~ [totalCnt = {}], [rows = {}]", new Object[] { totalCnt, rows.size() });
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
		}
		
		logger.info("<- []");
		return jsonResult.toString();
	}
	
	/**
	 * 사용 내역을 Excel 파일로 저장
	 */
	@RequestMapping(value = "/excel", method = RequestMethod.POST)
	public String postExcel(
			@RequestParam(value = "seq", required = true, defaultValue = "") String seq,
			@RequestParam(value = "sort", required = true, defaultValue = "") String sort,
			@RequestParam(value = "order", required = true, defaultValue = "") String order,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap modelMap) throws IOException {
		
		int responseStatusCode = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
		
		HttpSession session = request.getSession(false);
		
		logger.info("-> [seq = {}], [sort = {}], [order = {}]",  new Object[] { seq, sort, order });
		
		if (seq.isEmpty() || sort.isEmpty() || order.isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			responseStatusCode = HttpServletResponse.SC_BAD_REQUEST;
		}
		else {
			try {
				PersonMoneybookApproval approval = (PersonMoneybookApproval) approvalServiceImpl.getApproval(seq);
				modelMap.addAttribute("approval", approval);
				modelMap.addAttribute("registeredDate", approval.getRegisteredDate().substring(0, 11));
				
				String startDate = approval.getStartDate();
				String endDate = approval.getEndDate();
				String sentMemberId = approval.getSentMemberId();
				String sentMemberName = approval.getSentMemberName();
				
				// 정렬은 무조건 usedDate, ASC로 하드코딩해서 조회하자.
				List<PersonMoneybook> personMoneybookList = personMoneybookServiceImpl.getPersonMoneybookList(sentMemberId, startDate, endDate, 0, Integer.MAX_VALUE, "usedDate", "ASC");
				Map<String, Object> totalMap = personMoneybookServiceImpl.getPersonMoneybookListTotalCntAndPrice(sentMemberId, startDate, endDate);
				
				int totalCnt = (int) totalMap.get("totalCnt");
				int totalPrice = (int) totalMap.get("totalPrice");
				
				modelMap.addAttribute("personMoneybookList", personMoneybookList);
				modelMap.addAttribute("totalCnt", totalCnt);
				modelMap.addAttribute("totalPrice", totalPrice);
				modelMap.addAttribute("hangulTotalPrice", Utility.convertNumberToHangul(Integer.toString(totalPrice)));
				
				// Excel 내에서 personMoneybookList size가 25 미만인 경우 빈 라인을 더해 25줄을 맞추려 했으나 실패...
				// personMoneybookList size 가 25 미만인 경우 25 - personMoneybookList.size() 만큼의 emptyLineList를 내려주자
				List<Object> emptyLineList = new ArrayList<Object>();
				for (int inx = 0; inx < 25 - totalCnt; inx++)
					emptyLineList.add(inx);
				modelMap.addAttribute("emptyLineList", emptyLineList);
				
				ServletContext context = session.getServletContext();
			    modelMap.addAttribute("templateFileName", context.getRealPath("/") + "resources/excel/" + "person_moneybook_template.xls");
			    modelMap.addAttribute("destFileName", approval.getTitle() + "_" + sentMemberName + "_" + Utility.getCurrentDateToString("yyMMddHHmm") + ".xls");
			    modelMap.addAttribute("nickname", sentMemberName);
			    
			    logger.info("<- []");
			    return "personMoneybookExcelDownView";
			} catch (Exception e) {
				logger.error("~~ [An error occurred]", e);
				responseStatusCode = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
			}
		}

		modelMap.put("errorCode", responseStatusCode);
		logger.info("<- [responseStatusCode = {}]", responseStatusCode);
		return "error/error";
	}
	
}
