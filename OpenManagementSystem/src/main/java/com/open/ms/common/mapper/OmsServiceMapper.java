package com.open.ms.common.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.common.vo.OmsService;

/**
 * @author iskwon
 */
public interface OmsServiceMapper {
	
	List<OmsService> getOmsServiceList(Map<String, Object> map);
	OmsService getOmsServiceOfServiceId(Integer serviceId);
	
}
