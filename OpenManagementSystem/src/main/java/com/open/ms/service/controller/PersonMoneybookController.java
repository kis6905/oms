package com.open.ms.service.controller;

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

import com.open.ms.common.Codes;
import com.open.ms.common.Constants;
import com.open.ms.common.Utility;
import com.open.ms.common.service.MemberService;
import com.open.ms.common.vo.Member;
import com.open.ms.service.service.ApprovalService;
import com.open.ms.service.service.PersonMoneybookService;
import com.open.ms.service.vo.MoneybookApproval;
import com.open.ms.service.vo.PersonMoneybook;

/**
 * @author iskwon
 */
@Controller
@RequestMapping(value = "/service/person/moneybook/**")
public class PersonMoneybookController {

	private static final Logger logger = LoggerFactory.getLogger(PersonMoneybookController.class);
	
	@Autowired
	private PersonMoneybookService personMoneybookServiceImpl;
	
	@Autowired
	private MemberService memberServiceImpl;
	
	@Autowired
	private ApprovalService personApprovalServiceImpl;
	
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
		return "/service/person_moneybook";
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
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = member.getMemberId();
			
		logger.info("-> [body = {}]", body);
		logger.info("-> [memberId = {}]", memberId);
		
		JSONParser jsonParser = new JSONParser();
		
		try {
			JSONObject requestJson = (JSONObject) jsonParser.parse(body);
			
			String sentMemberId = (String) requestJson.get("sentMemberId");
			sentMemberId = sentMemberId == null || sentMemberId.isEmpty() ? memberId : sentMemberId;
			String startDate = (String) requestJson.get("startDate");
			String endDate = (String) requestJson.get("endDate");
			long offset = (long) requestJson.get("offset");
			long limit = (long) requestJson.get("limit");
			String sort = (String) requestJson.get("sort");
			String order = (String) requestJson.get("order");
			
			JSONArray rows = new JSONArray();
			
			List<PersonMoneybook> personMoneybookList = personMoneybookServiceImpl.getPersonMoneybookList(sentMemberId, startDate, endDate, offset, limit, sort, order);
			for (PersonMoneybook vo : personMoneybookList)
				rows.add(vo.toJSONObject());
			
			Map<String, Object> totalMap = personMoneybookServiceImpl.getPersonMoneybookListTotalCntAndPrice(sentMemberId, startDate, endDate);
			
			jsonResult.put("rows", rows);
			jsonResult.put("total", totalMap.get("totalCnt"));
			jsonResult.put("totalPrice", totalMap.get("totalPrice"));
			
			logger.info("~~ [totalCnt = {}], [totalPrice = {}], [rows = {}]", new Object[] { totalMap.get("totalCnt"), totalMap.get("totalPrice"), rows.size() });
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
		}
		
		logger.info("<- []");
		return jsonResult.toString();
	}
	
	/**
	 * 등록
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String postInsert(
			@RequestParam(value = "usedDate", required = true, defaultValue = "") String usedDate,
			@RequestParam(value = "summary", required = true, defaultValue = "") String summary,
			@RequestParam(value = "price", required = true, defaultValue = "") String price,
			@RequestParam(value = "note", required = true, defaultValue = "") String note,
			@RequestParam(value = "receipt", required = false) String receipt,
			HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) session.getAttribute("MEMBER");
		String memberId = member.getMemberId();
			
		logger.info("-> [usedDate = {}], [summary = {}], [price = {}], [note = {}], [receipt = {}]", new Object[] { usedDate, summary, price, note, receipt != null ? receipt.length() : 0 });
		logger.info("-> [memberId = {}]", memberId);
		
		try {
			if (usedDate.isEmpty() || summary.isEmpty() || price.isEmpty() || note.isEmpty() || memberId.isEmpty()) {
				jsonResult.put("result", Constants.RESULT_NOT_OK);
			}
			else {
				PersonMoneybook personMoneybook = new PersonMoneybook();
				personMoneybook.setUsedDate(usedDate);
				personMoneybook.setSummary(summary);
				personMoneybook.setPrice(Integer.parseInt(price));
				personMoneybook.setNote(note);
				personMoneybook.setMemberId(member.getMemberId());
				
				String realPath = null;
				if (receipt != null && !receipt.isEmpty()) {
					realPath = session.getServletContext().getRealPath("");
					String receiptPath = "/resources/images/receipt/" + memberId + "_receipt_" + Utility.getCurrentDateToString("yyyyMMddHHmmss") + ".png";
					personMoneybook.setReceiptPath(receiptPath);
				}
				
				boolean result = personMoneybookServiceImpl.insertPersonMoneybook(personMoneybook, receipt, realPath);
				jsonResult.put("result", result ? Constants.RESULT_OK : Constants.RESULT_NOT_OK);
			}
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			jsonResult.put("result", Constants.COMMON_SERVER_ERROR);
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	/**
	 * 수정
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String postUpdate(
			@RequestParam(value = "seq", required = true, defaultValue = "") String seq,
			@RequestParam(value = "usedDate", required = true, defaultValue = "") String usedDate,
			@RequestParam(value = "summary", required = true, defaultValue = "") String summary,
			@RequestParam(value = "price", required = true, defaultValue = "") String price,
			@RequestParam(value = "note", required = true, defaultValue = "") String note,
			@RequestParam(value = "receipt", required = false) String receipt,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) session.getAttribute("MEMBER");
		String memberId = member.getMemberId();
		
		logger.info("-> [seq = {}], [usedDate = {}], [summary = {}], [price = {}], [note = {}], [receipt = {}]", new Object[] { seq, usedDate, summary, price, note, receipt != null ? receipt.length() : 0 });
		logger.info("-> [memberId = {}]", memberId);
		
		try {
			if (seq.isEmpty() || usedDate.isEmpty() || summary.isEmpty() || price.isEmpty() || memberId.isEmpty()) {
				jsonResult.put("result", Constants.RESULT_NOT_OK);
			}
			else {
				PersonMoneybook personMoneybook = new PersonMoneybook();
				personMoneybook.setSeq(Integer.parseInt(seq));
				personMoneybook.setUsedDate(usedDate);
				personMoneybook.setSummary(summary);
				personMoneybook.setPrice(Integer.parseInt(price));
				personMoneybook.setNote(note);
				personMoneybook.setMemberId(member.getMemberId());
				
				String realPath = null;
				if (receipt != null && !receipt.isEmpty()) {
					realPath = session.getServletContext().getRealPath("");
					String receiptPath = "/resources/images/receipt/" + memberId + "_receipt_" + Utility.getCurrentDateToString("yyyyMMddHHmmss") + ".png";
					personMoneybook.setReceiptPath(receiptPath);
				}
				
				boolean result = personMoneybookServiceImpl.updatePersonMoneybook(personMoneybook, receipt, realPath);
				jsonResult.put("result", result ? Constants.RESULT_OK : Constants.RESULT_NOT_OK);
			}
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			jsonResult.put("result", Constants.COMMON_SERVER_ERROR);
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	/**
	 * 삭제
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public String postDelete(
			@RequestParam(value = "seq", required = true, defaultValue = "") String seq,
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		HttpSession session = request.getSession(false);
		
		Member member = (Member) session.getAttribute("MEMBER");
		String memberId = member.getMemberId();
		
		logger.info("-> [seq = {}]", seq);
		logger.info("-> [memberId = {}]", memberId);
		
		try {
			if (seq.isEmpty() || memberId.isEmpty()) {
				jsonResult.put("result", Constants.RESULT_NOT_OK);
			}
			else {
				PersonMoneybook personMoneybook = new PersonMoneybook();
				personMoneybook.setSeq(Integer.parseInt(seq));
				personMoneybook.setMemberId(member.getMemberId());
				
				boolean result = personMoneybookServiceImpl.deletePersonMoneybook(personMoneybook, session.getServletContext().getRealPath(""));
				jsonResult.put("result", result ? Constants.RESULT_OK : Constants.RESULT_NOT_OK);
			}
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			jsonResult.put("result", Constants.COMMON_SERVER_ERROR);
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	/**
	 * 결재 권한이 있는 사용자 목록
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/signrole/list", method = RequestMethod.POST)
	@ResponseBody
	public String postSignRoleList() {
		
		JSONObject jsonResult = new JSONObject();
		
		try {
			JSONArray approvalRoleMemberJsonArr = new JSONArray();
			
			List<Member> approvalRoleMemberList = memberServiceImpl.getHadApprovalRoleMemberList();
			for (Member member : approvalRoleMemberList)
				approvalRoleMemberJsonArr.add(member.toJSONObject());
			
			jsonResult.put("result", Constants.RESULT_OK);
			jsonResult.put("approvalRoleMemberList", approvalRoleMemberJsonArr);
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			jsonResult.put("result", Constants.COMMON_SERVER_ERROR);
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	/**
	 * 지출결의 결재 올리기
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/approval/request", method = RequestMethod.POST)
	@ResponseBody
	public String postApprovalRequest(
			@RequestParam(value = "startDate", required = true, defaultValue = "") String startDate,
			@RequestParam(value = "endDate", required = true, defaultValue = "") String endDate,
			@RequestParam(value = "requestMemberSign", required = true, defaultValue = "") String requestMemberSign,
			@RequestParam(value = "signTitle", required = true, defaultValue = "") String signTitle,
			@RequestParam(value = "projectName", required = true, defaultValue = "") String projectName,
			@RequestParam(value = "targetMemberId", required = true, defaultValue = "") String targetMemberId,
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = member.getMemberId();
		
		logger.info("-> [startDate = {}], [endDate = {}], [requestMemberSign = {}], [signTitle = {}], [targetMemberId = {}]", new Object[] { startDate, endDate, requestMemberSign.length(), signTitle, targetMemberId });
		logger.info("-> [memberId = {}]", memberId);
		
		try {
			if (startDate.isEmpty() || endDate.isEmpty() || requestMemberSign.isEmpty() || signTitle.isEmpty() || targetMemberId.isEmpty() || projectName.isEmpty()) {
				jsonResult.put("result", Constants.RESULT_NOT_OK);
			}
			else {
				MoneybookApproval personMoneybookApproval = new MoneybookApproval();
				personMoneybookApproval.setSentMemberId(memberId);
				personMoneybookApproval.setReceivedMemberId(targetMemberId);
				personMoneybookApproval.setTitle(signTitle);
				personMoneybookApproval.setProjectName(projectName);
				personMoneybookApproval.setStartDate(startDate);
				personMoneybookApproval.setEndDate(endDate);
				personMoneybookApproval.setSentMemberSign(requestMemberSign);
				personMoneybookApproval.setStatusCodeGroup(Codes.APPROVAL_STATUS_CODE_GROUP);
				personMoneybookApproval.setStatusCode(Codes.APPROVAL_STATUS_CODE_STAND_BY);
				
				boolean result = personApprovalServiceImpl.insertMoneybookApproval(personMoneybookApproval);
				jsonResult.put("result", result ? Constants.RESULT_OK : Constants.RESULT_NOT_OK);
			}
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			jsonResult.put("result", Constants.COMMON_SERVER_ERROR);
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
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
				MoneybookApproval approval = (MoneybookApproval) personApprovalServiceImpl.getApproval(seq);
				Member sessionMember = (Member) session.getAttribute("MEMBER");
				
				// Admin이 아닌데 다운 받으려는 지출결의의 sentMemberId와 Session의 memberId가 다르면 잘못된 접근이다.
				if (sessionMember.getGradeCode() != Codes.GRACD_CODE_ADMIN && !approval.getSentMemberId().equals(sessionMember.getMemberId())) {
					response.setStatus(HttpServletResponse.SC_FORBIDDEN);
					responseStatusCode = HttpServletResponse.SC_FORBIDDEN;
				}
				else {
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
					
					// Excel 내에서 personMoneybookList size가 21 미만인 경우 빈 라인을 더해 21줄을 맞추려 했으나 실패...
					// personMoneybookList size 가 21 미만인 경우 21 - personMoneybookList.size() 만큼의 emptyLineList를 내려주자
					List<Object> emptyLineList = new ArrayList<Object>();
					for (int inx = 0; inx < 21 - totalCnt; inx++)
						emptyLineList.add(inx);
					modelMap.addAttribute("emptyLineList", emptyLineList);
					
					ServletContext context = session.getServletContext();
				    modelMap.addAttribute("templateFileName", context.getRealPath("/") + "resources/excel/" + "person_moneybook_template.xls");
				    modelMap.addAttribute("destFileName", approval.getTitle() + "_" + sentMemberName + "_" + Utility.getCurrentDateToString("yyMMddHHmm") + ".xls");
				    modelMap.addAttribute("nickname", sentMemberName);
				    modelMap.addAttribute("projectName", approval.getProjectName() == null ? "" : approval.getProjectName());
				    
				    logger.info("<- []");
				    return "personMoneybookExcelDownView";
				}
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
