package com.open.ms.service.vo;

import org.json.simple.JSONObject;

import com.open.ms.common.vo.CommonVo;

/**
 * @author iskwon
 */
public class PersonMoneybook extends CommonVo {
	
	private Integer no = null;
	private Integer seq = null;
	private String memberId = null;
	private String usedDate = null;
	private String usedPlace = null;
	private Integer price = null;
	private String summary = null; 	// 적요
	private String note = null;		// 비고
	private String receiptPath = null;
	
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getUsedDate() {
		return usedDate;
	}

	public void setUsedDate(String usedDate) {
		this.usedDate = usedDate;
	}

	public String getUsedPlace() {
		return usedPlace;
	}

	public void setUsedPlace(String usedPlace) {
		this.usedPlace = usedPlace;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getReceiptPath() {
		return receiptPath;
	}

	public void setReceiptPath(String receiptPath) {
		this.receiptPath = receiptPath;
	}

	@SuppressWarnings("unchecked")
	@Override
	public JSONObject toJSONObject() {
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("no", no);
		jsonResult.put("seq", seq);
		jsonResult.put("memberId", memberId);
		jsonResult.put("usedDate", usedDate);
		jsonResult.put("summary", summary);
		jsonResult.put("usedPlace", usedPlace);
		jsonResult.put("price", price);
		jsonResult.put("note", note);
		jsonResult.put("receiptPath", receiptPath);
		jsonResult.put("registeredDate", getRegisteredDate());
		jsonResult.put("modifiedDate", getModifiedDate());
		return jsonResult;
	}

	@Override
	public String toString() {
		return "PersonMoneybook [no=" + no + ", seq=" + seq + ", memberId=" + memberId + ", usedDate=" + usedDate
				+ ", usedPlace=" + usedPlace + ", price=" + price + ", summary=" + summary + ", note=" + note
				+ ", receiptPath=" + receiptPath + "]";
	}
	
}
