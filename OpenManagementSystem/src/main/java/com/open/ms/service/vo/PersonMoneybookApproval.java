package com.open.ms.service.vo;

import org.json.simple.JSONObject;

/**
 * 지출결의 결재 VO
 * 
 * @author iskwon
 */
public class PersonMoneybookApproval extends Approval {
	
	private String startDate = null;
	private String endDate = null;

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject toJSONObject() {
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("no", getNo());
		jsonResult.put("seq", getSeq());
		jsonResult.put("sentMemberId", getSentMemberId());
		jsonResult.put("receivedMemberId", getReceivedMemberId());
		jsonResult.put("sentMemberName", getSentMemberName());
		jsonResult.put("receivedMemberName", getReceivedMemberName());
		jsonResult.put("title", getTitle());
//		jsonResult.put("sentMemberSign", getSentMemberSign());
//		jsonResult.put("receivedMemberSign", getReceivedMemberSign());
		jsonResult.put("statusCodeGroup", getStatusCodeGroup());
		jsonResult.put("statusCode", getStatusCode());
		jsonResult.put("startDate", startDate);
		jsonResult.put("endDate", endDate);
		jsonResult.put("completedDate", getCompletedDate());
		jsonResult.put("registeredDate", getRegisteredDate());
		return jsonResult;
	}

	@Override
	public String toString() {
		return "PersonMoneybookApproval [no=" + getNo()
				+ ", seq=" + getSeq()
				+ ", sentMemberId=" + getSentMemberId()
				+ ", receivedMemberId=" + getReceivedMemberId()
				+ ", title=" + getTitle()
//				+ ", sentMemberSign=" + sentMemberSign
//				+ ", receivedMemberSign=" + receivedMemberSign
				+ ", statusCodeGroup=" + getStatusCodeGroup()
				+ ", statusCode=" + getStatusCode()
				+ ", startDate=" + startDate
				+ ", endDate=" + endDate
				+ ", completedDate=" + getCompletedDate()
				+ ", registeredDate=" + getRegisteredDate()
				+ ", modifiedDate=" + getModifiedDate()
				+ "]";
	}
	
}
