package com.open.ms.service.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.ms.common.Codes;
import com.open.ms.common.Constants;
import com.open.ms.common.vo.Member;
import com.open.ms.service.service.ApprovalService;
import com.open.ms.service.vo.Approval;
import com.open.ms.service.vo.PersonMoneybookApproval;

/**
 * @author iskwon
 */
@Controller
@RequestMapping(value = "/service/sent/approval/**")
public class SentApprovalController {
	
	private static final Logger logger = LoggerFactory.getLogger(SentApprovalController.class);
	
	@Autowired
	private ApprovalService approvalServiceImpl;
	
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
		return "/service/sent_approval";
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
			
			String startDate = (String) requestJson.get("startDate");
			String endDate = (String) requestJson.get("endDate");
			String statusCode = (String) requestJson.get("statusCode");
			long offset = (long) requestJson.get("offset");
			long limit = (long) requestJson.get("limit");
			String sort = (String) requestJson.get("sort");
			String order = (String) requestJson.get("order");
			
			JSONArray rows = new JSONArray();
			
			List<Approval> approvalList = approvalServiceImpl.getApprovalList(memberId, null, startDate, endDate, statusCode, offset, limit, sort, order);
			for (Approval vo : approvalList)
				rows.add(vo.toJSONObject());
			
			int totalCnt = approvalServiceImpl.getApprovalListTotalCnt(memberId, null, startDate, endDate, statusCode);
			
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
	 * 결재 철회
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/processing", method = RequestMethod.POST)
	@ResponseBody
	public String postProcessing(
			@RequestParam(value = "seqs[]", required = false) String[] seqs,
			@RequestParam(value = "statusCode", required = true, defaultValue = "") String statusCode,
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = member.getMemberId();
		
		logger.info("-> [seqsSize = {}], [statusCode = {}]", new Object[] { seqs.length, statusCode });
		logger.info("-> [memberId = {}]", memberId);
		
		try {
			if (seqs.length == 0 || statusCode.isEmpty() || memberId.isEmpty()) {
				jsonResult.put("result", Constants.NOT_OK);
			}
			// 변경할 상태 코드가 철회가 아니면 잘못된 요청이다.
			else if (Integer.parseInt(statusCode) != Codes.APPROVAL_STATUS_CODE_CANCEL) {
				jsonResult.put("result", Constants.NOT_OK);
			}
			else {
				PersonMoneybookApproval personMoneybookApproval = new PersonMoneybookApproval();
				personMoneybookApproval.setSentMemberId(memberId);
				personMoneybookApproval.setStatusCode(Integer.parseInt(statusCode));
				
				boolean result = approvalServiceImpl.updateProcessingPersonMoneybookApproval(personMoneybookApproval, seqs);
				jsonResult.put("result", result ? Constants.OK : Constants.NOT_OK);
			}
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			jsonResult.put("result", Constants.COMMON_SERVER_ERROR);
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
}
