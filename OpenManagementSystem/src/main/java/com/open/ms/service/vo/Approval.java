package com.open.ms.service.vo;

import com.open.ms.common.vo.CommonVo;

/**
 * 결재 VO
 * 결재 별 VO들의 공통 클래스이다.
 * 
 * @author iskwon
 */
public class Approval extends CommonVo {
	
	private Integer no = null;
	private Integer seq = null;
	private String sentMemberId = null;
	private String sentMemberName = null;
	private String receivedMemberId = null;
	private String receivedMemberName = null;
	private String title = null;
	private String sentMemberSign = null;
	private String receivedMemberSign = null;
	private Integer statusCodeGroup = null;
	private Integer statusCode = null;
	private String completedDate = null;
	private String projectName = null;
	
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

	public String getSentMemberName() {
		return sentMemberName;
	}

	public void setSentMemberName(String sentMemberName) {
		this.sentMemberName = sentMemberName;
	}

	public String getReceivedMemberId() {
		return receivedMemberId;
	}

	public void setReceivedMemberId(String receivedMemberId) {
		this.receivedMemberId = receivedMemberId;
	}

	public String getReceivedMemberName() {
		return receivedMemberName;
	}

	public void setReceivedMemberName(String receivedMemberName) {
		this.receivedMemberName = receivedMemberName;
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

	public void setReceivedMemberSign(String receivedMemberSign) {
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

	public String getCompletedDate() {
		return completedDate;
	}

	public void setCompletedDate(String completedDate) {
		this.completedDate = completedDate;
	}
	
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Override
	public String toString() {
		return "Approval [no=" + no + ", seq=" + seq + ", sentMemberId=" + sentMemberId + ", sentMemberName="
				+ sentMemberName + ", receivedMemberId=" + receivedMemberId + ", receivedMemberName="
				+ receivedMemberName + ", title=" + title + ", sentMemberSign=" + sentMemberSign
				+ ", receivedMemberSign=" + receivedMemberSign + ", statusCodeGroup=" + statusCodeGroup
				+ ", statusCode=" + statusCode + ", completedDate=" + completedDate + ", projectName=" + projectName
				+ "]";
	}
	
}
