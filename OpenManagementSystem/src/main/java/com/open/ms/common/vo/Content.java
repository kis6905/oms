package com.open.ms.common.vo;

import org.json.simple.JSONObject;

public class Content {
	
	private String title = null;
	private String pageId = null;
	private boolean complete = false;
	
	public Content(String title, String pageId, boolean complete) {
		this.title = title;
		this.pageId = pageId;
		this.complete = complete;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}
	
	public boolean isComplete() {
		return complete;
	}

	public void setComplete(boolean complete) {
		this.complete = complete;
	}
	
	@SuppressWarnings("unchecked")
	public JSONObject toJSONObject() {
		JSONObject resultJson = new JSONObject();
		resultJson.put("title", title);
		resultJson.put("pageId", pageId);
		resultJson.put("complete", complete);
		return resultJson;
	}

	@Override
	public String toString() {
		return "Content [title=" + title + ", pageId=" + pageId + ", complete=" + complete + "]";
	}

}
