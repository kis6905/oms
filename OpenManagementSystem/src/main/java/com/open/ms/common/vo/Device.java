package com.open.ms.common.vo;

import org.json.simple.JSONObject;

public class Device extends CommonVo {
	
	private Integer seq = null;
	private String memberId = null;
	private String deviceModelName = null;
	
	public Integer getSeq() {
		return seq;
	}
	
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getDeviceModelName() {
		return deviceModelName;
	}
	
	public void setDeviceModelName(String deviceModelName) {
		this.deviceModelName = deviceModelName;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject toJSONObject() {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("seq", seq);
		jsonObject.put("memberId", memberId);
		jsonObject.put("deviceModelName", deviceModelName);
		jsonObject.put("registeredDate", getRegisteredDate());
		jsonObject.put("modifiedDate", getModifiedDate());
		return jsonObject;
	}

	@Override
	public String toString() {
		return "Device [seq=" + seq + ", memberId=" + memberId + ", deviceModelName=" + deviceModelName + "]";
	}
	
}
