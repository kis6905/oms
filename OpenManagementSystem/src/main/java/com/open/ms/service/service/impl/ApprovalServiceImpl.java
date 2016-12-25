package com.open.ms.service.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.service.mapper.PersonMoneybookApprovalMapper;
import com.open.ms.service.service.ApprovalService;
import com.open.ms.service.vo.Approval;

/**
 * 현재는 지출결의 결재 기능만 있지만, 확장성을 고려하여 이름을 ApprovalService라고 지었다.
 * 결재 종류가 추가될 경우 테이블을 추가할 생각으로, Mapper는 결재 종류별로 이름을 지었다.
 * 결재 종류가 추가될 경우 테이블을 추가 조회해 결과를 합쳐야 한다.
 * 
 * @author iskwon
 */
@Service(value = "approvalServiceImpl")
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private PersonMoneybookApprovalMapper personMoneybookApprovalMapper;
	
	/**
	 * 내가 올린 결재 목록 리턴
	 * 
	 * @param startDate 테이블의 registeredDate이다. 테이블의 startDate와는 무관하다.
	 * @param endDate 테이블의 registeredDate이다. 테이블의 endDate와는 무관하다.
	 */
	@Override
	public List<Approval> getSentApprovalList(String sentMemberId, String startDate, String endDate, String statusCode, long offset, long limit, String sort, String order) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("sentMemberId", sentMemberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("statusCode", statusCode.isEmpty() ? null : statusCode);
		map.put("start", offset + 1);
		map.put("end", offset + limit);
		map.put("sort", sort);
		map.put("order", order);
		return personMoneybookApprovalMapper.getReceivedApprovalList(map);
	}

	/**
	 * 내가 받은 결재 목록 리턴
	 * 
	 * @param startDate 테이블의 registeredDate이다. 테이블의 startDate와는 무관하다.
	 * @param endtDate 테이블의 registeredDate이다. 테이블의 endDate와는 무관하다.
	 */
	@Override
	public List<Approval> getReceivedApprovalList(String receivedMemberId, String startDate, String endDate, String statusCode, long offset, long limit, String sort, String order) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("receivedMemberId", receivedMemberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("statusCode", statusCode.isEmpty() ? null : statusCode);
		map.put("start", offset + 1);
		map.put("end", offset + limit);
		map.put("sort", sort);
		map.put("order", order);
		return personMoneybookApprovalMapper.getReceivedApprovalList(map);
	}

	/**
	 * 내가 올린 결재 목록 Count 리턴
	 * 
	 * @param startDate 테이블의 registeredDate이다. 테이블의 startDate와는 무관하다.
	 * @param endtDate 테이블의 registeredDate이다. 테이블의 endDate와는 무관하다.
	 */
	@Override
	public int getSentApprovalListTotalCnt(String sentMemberId, String startDate, String endDate, String statusCode) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("sentMemberId", sentMemberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("statusCode", statusCode.isEmpty() ? null : statusCode);
		return personMoneybookApprovalMapper.getSentApprovalListTotalCnt(map);
	}

	/**
	 * 내가 받은 결재 목록 Count 리턴
	 * 
	 * @param startDate 테이블의 registeredDate이다. 테이블의 startDate와는 무관하다.
	 * @param endtDate 테이블의 registeredDate이다. 테이블의 endDate와는 무관하다.
	 */
	@Override
	public int getReceivedApprovalListTotalCnt(String receivedMemberId, String startDate, String endDate, String statusCode) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("receivedMemberId", receivedMemberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("statusCode", statusCode.isEmpty() ? null : statusCode);
		return personMoneybookApprovalMapper.getReceivedApprovalListTotalCnt(map);
	}
	
	/**
	 * 지출결의 등록
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean insertPersonMoneybookApproval(Approval personMoneybookApproval) throws Exception {
		return personMoneybookApprovalMapper.insertPersonMoneybookApproval(personMoneybookApproval) > 0;
	}

	/**
	 * 지출결의 결재처리
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean updateProcessingPersonMoneybookApproval(Approval personMoneybookApproval, String[] seqs) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("vo", personMoneybookApproval);
		map.put("seqs", seqs);
		return personMoneybookApprovalMapper.updateProcessingPersonMoneybookApproval(map) > 0;
	}

	/**
	 * 지출결의 삭제
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean deletePersonMoneybookApproval(Approval personMoneybookApproval) throws Exception {
		return personMoneybookApprovalMapper.deletePersonMoneybookApproval(personMoneybookApproval) > 0;
	}

}
