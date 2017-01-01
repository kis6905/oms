package com.open.ms.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.ms.common.Constants;
import com.open.ms.common.vo.Member;
import com.open.ms.mypage.service.MyInfoService;

/**
 * @author iskwon
 */
@Controller
@RequestMapping(value = "/mypage/myinfo/**")
public class MyInfoController {

	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	
	@Autowired
	private MyInfoService myInfoServiceImpl;
	
	/**
	 * 페이지 리턴
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getPage() {
		
		logger.info("-> []");
		
		logger.info("<- []");
		return "/mypage/myinfo";
	}
	
	/**
	 * 조회
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	@ResponseBody
	public String postDetail(HttpServletRequest request) {
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		
		logger.info("-> [member = {}]", member.toString());
		
		JSONObject jsonResult = new JSONObject();
		int result = Constants.RESULT_NOT_OK;
		
		try {
			result = Constants.RESULT_OK;
			jsonResult.put("member", member.toJSONObject());
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			result = Constants.COMMON_SERVER_ERROR;
		}
		
		jsonResult.put("result", result);
		
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
			@RequestParam(value = "password", required = false, defaultValue = "") String password,
			@RequestParam(value = "memberName", required = true, defaultValue = "") String memberName,
			@RequestParam(value = "corpCardLimit", required = true, defaultValue = "") String corpCardLimit,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
		// memberId는 보안상 Session에 있는 값을 가져온다.
		Member sessionMember = (Member) session.getAttribute("MEMBER");
		String memberId = sessionMember.getMemberId();
		
		logger.info("-> [memberId = {}], [password = {}], [memberName = {}], [corpCardLimit = {}]",
				new Object[] { memberId, password, memberName, corpCardLimit });
		
		JSONObject jsonResult = new JSONObject();
		int result = Constants.RESULT_NOT_OK;
		
		try {
			if (memberId.isEmpty() || memberName.isEmpty() || corpCardLimit.isEmpty()) {
				result = Constants.RESULT_NOT_OK;
			}
			else {
				Member member = new Member();
				member.setMemberId(memberId);
				member.setPassword(password.isEmpty() ? null : password); // password를 입력하지 않은 경우 변경하지 않는다.
				member.setMemberName(memberName);
				member.setCorpCardLimit(Integer.parseInt(corpCardLimit));
				
				result = myInfoServiceImpl.updateMyInfo(member) ? Constants.RESULT_OK : Constants.RESULT_NOT_OK;
				
				// update가 성공이면 session에 있는 member 객체도 바꿔준다.
				if (result == Constants.RESULT_OK) {
					sessionMember.setMemberName(memberName);
					sessionMember.setCorpCardLimit(Integer.parseInt(corpCardLimit));
					session.setAttribute("MEMBER", sessionMember);
				}
			}
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			result = Constants.COMMON_SERVER_ERROR;
		}
		
		jsonResult.put("result", result);
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
}
