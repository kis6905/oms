package com.open.ms.service.vo;

import org.json.simple.JSONObject;

import com.open.ms.common.vo.CommonVo;

/**
 * @author iskwon
 */
public class PersonMoneybookApproval extends CommonVo {
	
	private Integer no = null;
	private Integer seq = null;
	private String sentMemberId = null;
	private String receivedMemberId = null;
	private String title = null;
	private String sentMemberSign = null;
	private String receivedMemberSign = null;
	private Integer statusCodeGroup = null;
	private Integer statusCode = null;
	private String startDate = null;
	private String endDate = null;
	private String completedDate = null;

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getSentMemberId() {
		return sentMemberId;
	}

	public void setSentMemberId(String sentMemberId) {
		this.sentMemberId = sentMemberId;
	}

	public String getReceivedMemberId() {
		return receivedMemberId;
	}

	public void setReceivedMemberId(String receivedMemberId) {
		this.receivedMemberId = receivedMemberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSentMemberSign() {
		return sentMemberSign;
	}

	public void setSentMemberSign(String sentMemberSign) {
		this.sentMemberSign = sentMemberSign;
	}

	public String getReceivedMemberSign() {
		return receivedMemberSign;
	}

	public void setReceviedMemberSign(String receivedMemberSign) {
		this.receivedMemberSign = receivedMemberSign;
	}

	public Integer getStatusCodeGroup() {
		return statusCodeGroup;
	}

	public void setStatusCodeGroup(Integer statusCodeGroup) {
		this.statusCodeGroup = statusCodeGroup;
	}

	public Integer getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(Integer statusCode) {
		this.statusCode = statusCode;
	}

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

	public String getCompletedDate() {
		return completedDate;
	}

	public void setCompletedDate(String completedDate) {
		this.completedDate = completedDate;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject toJSONObject() {
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("no", no);
		jsonResult.put("seq", seq);
		jsonResult.put("sentMemberId", sentMemberId);
		jsonResult.put("receivedMemberId", receivedMemberId);
		jsonResult.put("title", title);
		jsonResult.put("sentMemberSign", sentMemberSign);
		jsonResult.put("receivedMemberSign", receivedMemberSign);
		jsonResult.put("statusCodeGroup", statusCodeGroup);
		jsonResult.put("statusCode", statusCode);
		jsonResult.put("startDate", startDate);
		jsonResult.put("endDate", endDate);
		jsonResult.put("completedDate", completedDate);
		jsonResult.put("registeredDate", getRegisteredDate());
		jsonResult.put("modifiedDate", getModifiedDate());
		return jsonResult;
	}

	@Override
	public String toString() {
		return "PersonMoneybookSign [no=" + no + ", seq=" + seq + ", sentMemberId=" + sentMemberId
				+ ", receivedMemberId=" + receivedMemberId + ", title=" + title + ", sentMemberSign=" + sentMemberSign
				+ ", receivedMemberSign=" + receivedMemberSign + ", statusCodeGroup=" + statusCodeGroup + ", statusCode="
				+ statusCode + ", startDate=" + startDate + ", endDate=" + endDate + ", completedDate=" + completedDate
				+ "]";
	}
	
}
