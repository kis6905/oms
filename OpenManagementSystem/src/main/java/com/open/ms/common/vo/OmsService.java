package com.open.ms.common.vo;

import org.json.simple.JSONObject;

public class OmsService extends CommonVo {
	
	private Integer serviceId	= null;
	private Integer roleId	= null;
	private String title		= null;
	private String description	= null;
	private String sliderImage	= null;
	private String iconImage	= null;
	private String pageName		= null;
	private String pageUrl		= null;

	public OmsService() {
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSliderImage() {
		return sliderImage;
	}

	public void setSliderImage(String sliderImage) {
		this.sliderImage = sliderImage;
	}
	
	public String getIconImage() {
		return iconImage;
	}

	public void setIconImage(String iconImage) {
		this.iconImage = iconImage;
	}
	
	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getPageUrl() {
		return pageUrl;
	}

	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject toJSONObject() {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("serviceId", serviceId);
		jsonObject.put("roleId", roleId);
		jsonObject.put("title", title);
		jsonObject.put("description", description);
		jsonObject.put("sliderImage", sliderImage);
		jsonObject.put("iconImage", iconImage);
		jsonObject.put("pageName", pageName);
		jsonObject.put("pageUrl", pageUrl);
		jsonObject.put("registeredDate", getRegisteredDate());
		jsonObject.put("modifiedDate", getModifiedDate());
		return jsonObject;
	}

	@Override
	public String toString() {
		return "Service [serviceId=" + serviceId
				+ ", roleId=" + roleId
				+ ", title=" + title
				+ ", description=" + description
				+ ", sliderImage=" + sliderImage
				+ ", iconImage=" + iconImage
				+ ", pageName=" + pageName
				+ ", pageUrl=" + pageUrl
				+ ", registeredDate=" + getRegisteredDate()
				+ ", modifiedDate=" + getModifiedDate()
				+ "]";
	}
}
