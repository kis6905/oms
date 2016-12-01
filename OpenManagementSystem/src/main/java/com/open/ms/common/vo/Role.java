package com.open.ms.common.vo;

import org.json.simple.JSONObject;

public class Role extends CommonVo {
	
	private Integer roleId 		= null;
	private String roleName 	= null;
	
	public Integer getRoleId() {
		return roleId;
	}
	
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	
	public String getRoleName() {
		return roleName;
	}
	
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject toJSONObject() {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("roleId", roleId);
		jsonObject.put("roleName", roleName);
		jsonObject.put("registeredDate", getRegisteredDate());
		jsonObject.put("modifiedDate", getModifiedDate());
		return jsonObject;
	}

	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + "]";
	}
	
}
