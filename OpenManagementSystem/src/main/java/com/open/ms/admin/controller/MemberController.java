package com.open.ms.admin.controller;

import java.util.ArrayList;
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
import com.open.ms.common.service.MemberService;
import com.open.ms.common.service.RoleService;
import com.open.ms.common.vo.Member;
import com.open.ms.common.vo.Role;

/**
 * @author iskwon
 */
@Controller
@RequestMapping(value = "/admin/member/**")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberServiceImpl;
	@Autowired
	private RoleService roleServiceImpl;
	
	/**
	 * 페이지 리턴
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getPage() {
		
		logger.info("-> []");
		
		logger.info("<- []");
		return "/admin/member";
	}
	
	/**
	 * 목록 조회
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public String postList(
			@RequestBody String body,
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		logger.info("-> [body = {}]", body);
		
		JSONParser jsonParser = new JSONParser();
		
		try {
			JSONObject requestJson = (JSONObject) jsonParser.parse(body);
			
			long offset = (long) requestJson.get("offset");
			long limit = (long) requestJson.get("limit");
			String sort = (String) requestJson.get("sort");
			String order = (String) requestJson.get("order");
			
			JSONArray rows = new JSONArray();
			
			List<Member> memberList = memberServiceImpl.getMemberList(offset, limit, sort, order);
			for (Member vo : memberList)
				rows.add(vo.toJSONObject());
			
			int totalCnt = memberServiceImpl.getMemberListTotalCnt();
			
			jsonResult.put("rows", rows);
			jsonResult.put("total", totalCnt);
			
			logger.info("~~ [totalCnt = {}], [rows = {}]", new Object[] { totalCnt, rows.toString() });
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
			@RequestParam(value = "memberId", required = true, defaultValue = "") String memberId,
			@RequestParam(value = "password", required = true, defaultValue = "") String password,
			@RequestParam(value = "memberName", required = true, defaultValue = "") String memberName,
			@RequestParam(value = "gradeCode", required = true, defaultValue = "") String gradeCode,
			@RequestParam(value = "corpCardLimit", required = true, defaultValue = "") String corpCardLimit,
			@RequestParam(value = "roles[]", required = false) String[] roles,
			HttpServletRequest request) {
		
		logger.info("-> [memberId = {}], [password = {}], [memberName = {}], [gradeCode = {}], [corpCardLimit = {}]",
				new Object[] { memberId, password, memberName, gradeCode, corpCardLimit });
		logger.info("-> [roles = {}]", roles == null ? null : roles.length);
		
		JSONObject jsonResult = new JSONObject();
		int result = Constants.NOT_OK;
		
		try {
			if (memberId.isEmpty() || password.isEmpty() || memberName.isEmpty() || gradeCode.isEmpty() || corpCardLimit.isEmpty()) {
				result = Constants.NOT_OK;
			}
			else {
				Member member = new Member();
				member.setMemberId(memberId);
				member.setPassword(password);
				member.setMemberName(memberName);
				member.setGradeCodeGroup(Codes.GRADE_CODE_GROUP);
				member.setGradeCode(Integer.parseInt(gradeCode));
				member.setCorpCardLimit(Integer.parseInt(corpCardLimit));
				
				List<Role> roleList = new ArrayList<Role>();
				if (roles != null) {
					for (String roleId : roles) {
						Role role = new Role();
						role.setRoleId(Integer.parseInt(roleId));
						roleList.add(role);
					}
				}
				member.setRoleList(roleList);
				
				result = memberServiceImpl.insertMember(member) ? Constants.OK : Constants.NOT_OK;
			}
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
			@RequestParam(value = "memberId", required = true, defaultValue = "") String memberId,
			@RequestParam(value = "password", required = false, defaultValue = "") String password,
			@RequestParam(value = "memberName", required = true, defaultValue = "") String memberName,
			@RequestParam(value = "gradeCode", required = true, defaultValue = "") String gradeCode,
			@RequestParam(value = "corpCardLimit", required = true, defaultValue = "") String corpCardLimit,
			@RequestParam(value = "roles[]", required = false) String[] roles,
			HttpServletRequest request) {
		
		logger.info("-> [memberId = {}], [password = {}], [memberName = {}], [gradeCode = {}], [corpCardLimit = {}]",
				new Object[] { memberId, password, memberName, gradeCode, corpCardLimit });
		logger.info("-> [roles = {}]", roles == null ? null : roles.length);
		
		JSONObject jsonResult = new JSONObject();
		int result = Constants.NOT_OK;
		
		try {
			if (memberId.isEmpty() || memberName.isEmpty() || gradeCode.isEmpty() || corpCardLimit.isEmpty()) {
				result = Constants.NOT_OK;
			}
			else {
				Member member = new Member();
				member.setMemberId(memberId);
				member.setPassword(password.isEmpty() ? null : password); // password를 입력하지 않은 경우 변경하지 않는다.
				member.setMemberName(memberName);
				member.setGradeCodeGroup(Codes.GRADE_CODE_GROUP);
				member.setGradeCode(Integer.parseInt(gradeCode));
				member.setCorpCardLimit(Integer.parseInt(corpCardLimit));
				
				List<Role> roleList = new ArrayList<Role>();
				if (roles != null) {
					for (String roleId : roles) {
						Role role = new Role();
						role.setRoleId(Integer.parseInt(roleId));
						roleList.add(role);
					}
				}
				member.setRoleList(roleList);
				
				result = memberServiceImpl.updateMember(member) ? Constants.OK : Constants.NOT_OK;
			}
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			result = Constants.COMMON_SERVER_ERROR;
		}
		
		jsonResult.put("result", result);
		
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
			@RequestParam(value = "memberId", required = true, defaultValue = "") String memberId,
			HttpServletRequest request) {
		
		logger.info("-> [memberId = {}]", memberId);
		
		JSONObject jsonResult = new JSONObject();
		int result = Constants.NOT_OK;
		
		try {
			if (memberId.isEmpty()) {
				result = Constants.NOT_OK;
			}
			else {
				Member member = new Member();
				member.setMemberId(memberId);
				
				result = memberServiceImpl.deleteMember(member) ? Constants.OK : Constants.NOT_OK;
			}
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
			result = Constants.COMMON_SERVER_ERROR;
		}
		
		jsonResult.put("result", result);
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	/**
	 * Role 목록 조회
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/role/list", method = RequestMethod.POST)
	@ResponseBody
	public String postRoleList() {
		
		logger.info("-> []");
		
		JSONObject jsonResult = new JSONObject();
		
		try {
			JSONArray jsonRoleList = new JSONArray();
			List<Role> roleList = roleServiceImpl.getRoleList();
			for (Role vo : roleList)
				jsonRoleList.add(vo.toJSONObject());
			
			jsonResult.put("roleList", jsonRoleList);
			
			logger.info("~~ [roleList = {}]", jsonResult.toString());
		} catch (Exception e) {
			logger.error("~~ [An error occurred]", e);
		}
		
		logger.info("<- []");
		return jsonResult.toString();
	}
	
	/**
	 * ID 중복 확인
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/check/id", method = RequestMethod.POST)
	@ResponseBody
	public String postCheckId(@RequestParam(value = "memberId") String memberId) {
		
		logger.info("-> [memberId = {}]", memberId);
		
		JSONObject resultJson = new JSONObject();
		
		int result = Constants.NOT_OK;
		try {
			result = memberServiceImpl.checkId(memberId) ? Constants.OK : Constants.NOT_OK;
		} catch (Exception e) {
			logger.error("~~ [An error occurred!]", e);
			result = Constants.COMMON_SERVER_ERROR;
		}
		
		resultJson.put("result", result);
		
		logger.info("<- [resultJson = {}]", resultJson.toString());
		return resultJson.toString();
	}
	
}
