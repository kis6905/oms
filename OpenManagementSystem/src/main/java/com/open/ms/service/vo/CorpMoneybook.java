package com.open.ms.service.vo;

import org.json.simple.JSONObject;

import com.open.ms.common.vo.CommonVo;

public class CorpMoneybook extends CommonVo {
	
	private Integer no = null;
	private Integer seq = null;
	private String memberId = null;
	private String usedDate = null;
	private String category = null;
	private String customer = null;
	private String usedPlace = null;
	private Integer price = null;
	private String note = null;
	
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
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@SuppressWarnings("unchecked")
	@Override
	public JSONObject toJSONObject() {
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("no", no);
		jsonResult.put("seq", seq);
		jsonResult.put("memberId", memberId);
		jsonResult.put("usedDate", usedDate);
		jsonResult.put("category", category);
		jsonResult.put("customer", customer);
		jsonResult.put("usedPlace", usedPlace);
		jsonResult.put("price", price);
		jsonResult.put("note", note);
		jsonResult.put("registeredDate", getRegisteredDate());
		jsonResult.put("modifiedDate", getModifiedDate());
		return jsonResult;
	}

	@Override
	public String toString() {
		return "CorpMoneybook [no=" + no + ", seq=" + seq + ", memberId=" + memberId + ", usedDate=" + usedDate
				+ ", category=" + category + ", customer=" + customer + ", usedPlace=" + usedPlace + ", price=" + price
				+ ", note=" + note + "]";
	}

}
