package com.open.ms.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.common.Codes;
import com.open.ms.common.mapper.OmsServiceMapper;
import com.open.ms.common.service.OmsServiceService;
import com.open.ms.common.vo.Member;
import com.open.ms.common.vo.OmsService;

/**
 * @author iskwon
 */
@Service(value = "omsServiceServiceImpl")
public class OmsServiceServiceImpl implements OmsServiceService {

	@Autowired
	private OmsServiceMapper omsServiceMapper;
	
	/**
	 * Service 목록 리턴
	 */
	@Override
	public List<OmsService> getOmsServiceList(Member member) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", member.getMemberId());
		map.put("useYNCode", Codes.SERVICE_USE_YN_CODE_Y);
		return omsServiceMapper.getOmsServiceList(map);
	}

	/**
	 * Service 리턴
	 */
	@Override
	public OmsService getOmsService(Integer serviceId) {
		return omsServiceMapper.getOmsServiceOfServiceId(serviceId);
	}
	
}
