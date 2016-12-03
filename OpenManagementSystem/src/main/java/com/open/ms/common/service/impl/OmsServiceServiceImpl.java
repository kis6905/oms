package com.open.ms.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return omsServiceMapper.getOmsServiceList(member);
	}

	/**
	 * Service 리턴
	 */
	@Override
	public OmsService getOmsService(Integer serviceId) {
		return omsServiceMapper.getOmsServiceOfServiceId(serviceId);
	}
	
}
