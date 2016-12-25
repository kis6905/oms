package com.open.ms.service.controller;

import java.util.List;
import java.util.Map;

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
import com.open.ms.common.service.MemberService;
import com.open.ms.common.vo.Member;
import com.open.ms.service.service.PersonMoneybookService;
import com.open.ms.service.service.ApprovalService;
import com.open.ms.service.vo.PersonMoneybook;
import com.open.ms.service.vo.PersonMoneybookApproval;

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
			
			String startDate = (String) requestJson.get("startDate");
			String endDate = (String) requestJson.get("endDate");
			long offset = (long) requestJson.get("offset");
			long limit = (long) requestJson.get("limit");
			String sort = (String) requestJson.get("sort");
			String order = (String) requestJson.get("order");
			
			JSONArray rows = new JSONArray();
			
			List<PersonMoneybook> personMoneybookList = personMoneybookServiceImpl.getPersonMoneybookList(memberId, startDate, endDate, offset, limit, sort, order);
			for (PersonMoneybook vo : personMoneybookList)
				rows.add(vo.toJSONObject());
			
			Map<String, Object> totalMap = personMoneybookServiceImpl.getPersonMoneybookListTotalCntAndPrice(memberId, startDate, endDate);
			
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
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = member.getMemberId();
			
		logger.info("-> [usedDate = {}], [summary = {}], [price = {}], [note = {}]", new Object[] { usedDate, summary, price, note });
		logger.info("-> [memberId = {}]", memberId);
		
		try {
			if (usedDate.isEmpty() || summary.isEmpty() || price.isEmpty() || note.isEmpty() || memberId.isEmpty()) {
				jsonResult.put("result", Constants.NOT_OK);
			}
			else {
				PersonMoneybook personMoneybook = new PersonMoneybook();
				personMoneybook.setUsedDate(usedDate);
				personMoneybook.setSummary(summary);
				personMoneybook.setPrice(Integer.parseInt(price));
				personMoneybook.setNote(note);
				personMoneybook.setMemberId(member.getMemberId());
				
				boolean result = personMoneybookServiceImpl.insertPersonMoneybook(personMoneybook);
				jsonResult.put("result", result ? Constants.OK : Constants.NOT_OK);
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
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = member.getMemberId();
			
		logger.info("-> [seq = {}], [usedDate = {}], [summary = {}], [price = {}], [note = {}]", new Object[] { seq, usedDate, summary, price, note });
		logger.info("-> [memberId = {}]", memberId);
		
		try {
			if (seq.isEmpty() || usedDate.isEmpty() || summary.isEmpty() || price.isEmpty() || memberId.isEmpty()) {
				jsonResult.put("result", Constants.NOT_OK);
			}
			else {
				PersonMoneybook personMoneybook = new PersonMoneybook();
				personMoneybook.setSeq(Integer.parseInt(seq));
				personMoneybook.setUsedDate(usedDate);
				personMoneybook.setSummary(summary);
				personMoneybook.setPrice(Integer.parseInt(price));
				personMoneybook.setNote(note);
				personMoneybook.setMemberId(member.getMemberId());
				
				boolean result = personMoneybookServiceImpl.updatePersonMoneybook(personMoneybook);
				jsonResult.put("result", result ? Constants.OK : Constants.NOT_OK);
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
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = member.getMemberId();
		
		logger.info("-> [seq = {}]", seq);
		logger.info("-> [memberId = {}]", memberId);
		
		try {
			if (seq.isEmpty() || memberId.isEmpty()) {
				jsonResult.put("result", Constants.NOT_OK);
			}
			else {
				PersonMoneybook personMoneybook = new PersonMoneybook();
				personMoneybook.setSeq(Integer.parseInt(seq));
				personMoneybook.setMemberId(member.getMemberId());
				
				boolean result = personMoneybookServiceImpl.deletePersonMoneybook(personMoneybook);
				jsonResult.put("result", result ? Constants.OK : Constants.NOT_OK);
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
			
			List<Member> approvalRoleMemberList = memberServiceImpl.getSignRoleMemberList();
			for (Member member : approvalRoleMemberList)
				approvalRoleMemberJsonArr.add(member.toJSONObject());
			
			jsonResult.put("result", Constants.OK);
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
			@RequestParam(value = "targetMemberId", required = true, defaultValue = "") String targetMemberId,
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = member.getMemberId();
		
		logger.info("-> [startDate = {}], [endDate = {}], [requestMemberSign = {}], [signTitle = {}], [targetMemberId = {}]", new Object[] { startDate, endDate, requestMemberSign.length(), signTitle, targetMemberId });
		logger.info("-> [memberId = {}]", memberId);
		
		try {
			if (startDate.isEmpty() || endDate.isEmpty() || requestMemberSign.isEmpty() || signTitle.isEmpty() || targetMemberId.isEmpty()) {
				jsonResult.put("result", Constants.NOT_OK);
			}
			else {
				PersonMoneybookApproval personMoneybookApproval = new PersonMoneybookApproval();
				personMoneybookApproval.setSentMemberId(memberId);
				personMoneybookApproval.setReceivedMemberId(targetMemberId);
				personMoneybookApproval.setTitle(signTitle);
				personMoneybookApproval.setStartDate(startDate);
				personMoneybookApproval.setEndDate(endDate);
				personMoneybookApproval.setSentMemberSign(requestMemberSign);
				personMoneybookApproval.setStatusCodeGroup(Codes.SIGN_STATUS_CODE_GROUP);
				personMoneybookApproval.setStatusCode(Codes.SIGN_STATUS_CODE_STAND_BY);
				
				boolean result = approvalServiceImpl.insertPersonMoneybookApproval(personMoneybookApproval);
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
