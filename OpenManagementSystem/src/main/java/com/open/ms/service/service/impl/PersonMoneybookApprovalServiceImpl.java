package com.open.ms.service.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.service.mapper.PersonMoneybookApprovalMapper;
import com.open.ms.service.service.PersonMoneybookApprovalService;
import com.open.ms.service.vo.PersonMoneybookApproval;

/**
 * @author iskwon
 */
@Service(value = "personMoneybookApprovalServiceImpl")
public class PersonMoneybookApprovalServiceImpl implements PersonMoneybookApprovalService {

	@Autowired
	private PersonMoneybookApprovalMapper personMoneybookApprovalMapper;
	
	/**
	 * 내가 올린 지출결의 결재 목록 리턴
	 */
	@Override
	public List<PersonMoneybookApproval> getSentApprovalList(String sentMemberId, long offset, long limit, String sort, String order) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("sentMemberId", sentMemberId);
		map.put("start", offset + 1);
		map.put("end", offset + limit);
		map.put("sort", sort);
		map.put("order", order);
		return personMoneybookApprovalMapper.getRequestedApprovalList(map);
	}

	/**
	 * 내가 받은 지출결의 결재 목록 리턴
	 */
	@Override
	public List<PersonMoneybookApproval> getReceivedApprovalList(String receivedMemberId, long offset, long limit, String sort, String order) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("receivedMemberId", receivedMemberId);
		map.put("start", offset + 1);
		map.put("end", offset + limit);
		map.put("sort", sort);
		map.put("order", order);
		return personMoneybookApprovalMapper.getReceivedApprovalList(map);
	}

	/**
	 * 내가 올린 지출결의 결재 목록 Count 리턴
	 */
	@Override
	public int getSentApprovalListTotalCnt(String sentMemberId) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("sentMemberId", sentMemberId);
		return personMoneybookApprovalMapper.getSentApprovalListTotalCnt(map);
	}

	/**
	 * 내가 받은 지출결의 결재 목록 Count 리턴
	 */
	@Override
	public int getReceivedApprovalListTotalCnt(String receivedMemberId) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("receivedMemberId", receivedMemberId);
		return personMoneybookApprovalMapper.getReceivedApprovalListTotalCnt(map);
	}
	
	/**
	 * 지출결의 등록
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean insertPersonMoneybookApproval(PersonMoneybookApproval personMoneybookApproval) throws Exception {
		return personMoneybookApprovalMapper.insertPersonMoneybookApproval(personMoneybookApproval) > 0;
	}

	/**
	 * 지출결의 수정
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean updatePersonMoneybookApproval(PersonMoneybookApproval personMoneybookApproval) throws Exception {
		return personMoneybookApprovalMapper.updatePersonMoneybookApproval(personMoneybookApproval) > 0;
	}

	/**
	 * 지출결의 삭제
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean deletePersonMoneybookApproval(PersonMoneybookApproval personMoneybookApproval) throws Exception {
		return personMoneybookApprovalMapper.deletePersonMoneybookApproval(personMoneybookApproval) > 0;
	}

}
