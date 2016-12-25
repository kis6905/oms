package com.open.ms.common.vo;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * @author iskwon
 */
public class Member extends CommonVo {
	
	private Integer no				= null;
	private String memberId			= null;
	private String password			= null;
	private Integer passwordFailCnt	= null;
	private String memberName		= null;
	private Integer gradeCodeGroup	= null;
	private Integer gradeCode		= null;
	private Integer corpCardLimit	= null;
	private String lastLoginDate	= null;
	private List<Role> roleList 	= null;
	
	public Member() {
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Integer getPasswordFailCnt() {
		return passwordFailCnt;
	}

	public void setPasswordFailCnt(Integer passwordFailCnt) {
		this.passwordFailCnt = passwordFailCnt;
	}
	
	public Integer getGradeCodeGroup() {
		return gradeCodeGroup;
	}

	public void setGradeCodeGroup(Integer gradeCodeGroup) {
		this.gradeCodeGroup = gradeCodeGroup;
	}

	public Integer getGradeCode() {
		return gradeCode;
	}

	public void setGradeCode(Integer gradeCode) {
		this.gradeCode = gradeCode;
	}
	
	public Integer getCorpCardLimit() {
		return corpCardLimit;
	}

	public void setCorpCardLimit(Integer corpCardLimit) {
		this.corpCardLimit = corpCardLimit;
	}

	public String getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	
	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject toJSONObject() {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("no", no);
		jsonObject.put("memberId", memberId);
//		jsonObject.put("password", password); // 보안상 넣지 않음
		jsonObject.put("memberName", memberName);
		jsonObject.put("gradeCodeGroup", gradeCodeGroup);
		jsonObject.put("gradeCode", gradeCode);
		jsonObject.put("corpCardLimit", corpCardLimit);
		jsonObject.put("registeredDate", getRegisteredDate());
		jsonObject.put("modifiedDate", getModifiedDate());
		jsonObject.put("lastLoginDate", lastLoginDate);
		
		JSONArray jsonRoleList = new JSONArray();
		if (roleList != null) {
			for (Role role : roleList)
				jsonRoleList.add(role.toJSONObject());
		}
		jsonObject.put("roleList", jsonRoleList);
		
		return jsonObject;
	}
	
	@Override
	public String toString() {
		return "Member [no=" + no
				+ ", memberId=" + memberId
//				+ ", password=" + password // 보안상 출력 안함
				+ ", memberName=" + memberName
				+ ", passwordFailCnt=" + passwordFailCnt
				+ ", gradeCodeGroup=" + gradeCodeGroup
				+ ", gradeCode=" + gradeCode
				+ ", corpCardLimit=" + corpCardLimit
				+ ", registeredDate=" + getRegisteredDate()
				+ ", modifiedDate=" + getModifiedDate()
				+ ", lastLoginDate=" + lastLoginDate
				+ "]";
	}
}
