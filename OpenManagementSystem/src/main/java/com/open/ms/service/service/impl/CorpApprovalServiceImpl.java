package com.open.ms.service.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.service.mapper.CorpMoneybookApprovalMapper;
import com.open.ms.service.service.ApprovalService;
import com.open.ms.service.vo.Approval;

@Service(value = "corpApprovalServiceImpl")
public class CorpApprovalServiceImpl implements ApprovalService {

	private static final Logger logger = LoggerFactory.getLogger(CorpApprovalServiceImpl.class);
	
	@Autowired
	private CorpMoneybookApprovalMapper corpMoneybookApprovalMapper;
	
	/**
	 * 내가 받은 or 내가 올린 or 모든 결재 목록 리턴<br>
	 * 내가 받은 목록 -> sentMemberId = null       / receivedMemberId = myMemberId<br>
	 * 내가 올린 목록 -> sentMemberId = myMemberId / receivedMemberId == null<br>
	 * 모든 목록     -> sentMemberId = null       / receivedMemberId == null
	 */
	@Override
	public List<Approval> getApprovalList(String sentMemberId, String receivedMemberId, String startDate, String endDate, String statusCode, long offset, long limit, String sort, String order) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("sentMemberId", sentMemberId);
		map.put("receivedMemberId", receivedMemberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("statusCode", statusCode.isEmpty() ? null : statusCode);
		map.put("start", offset + 1);
		map.put("end", offset + limit);
		map.put("sort", sort);
		map.put("order", order);
		return corpMoneybookApprovalMapper.getApprovalList(map);
	}
	
	/**
	 * 내가 받은 or 내가 올린 or 모든 결재 목록 Count 리턴<br>
	 * 내가 받은 목록 -> sentMemberId = null       / receivedMemberId = myMemberId<br>
	 * 내가 올린 목록 -> sentMemberId = myMemberId / receivedMemberId == null<br>
	 * 모든 목록     -> sentMemberId = null       / receivedMemberId == null
	 */
	@Override
	public int getApprovalListTotalCnt(String sentMemberId, String receivedMemberId, String startDate, String endDate, String statusCode) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("sentMemberId", sentMemberId);
		map.put("receivedMemberId", receivedMemberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("statusCode", statusCode.isEmpty() ? null : statusCode);
		return corpMoneybookApprovalMapper.getApprovalListTotalCnt(map);
	}
	
	/**
	 * 결재 정보 리턴
	 */
	@Override
	public Approval getApproval(String seq) throws Exception {
		return corpMoneybookApprovalMapper.getApprovalOfSeq(seq);
	}
	
	/**
	 * 법카 결재 등록
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean insertMoneybookApproval(Approval moneybookApproval) throws Exception {
		return corpMoneybookApprovalMapper.insertMoneybookApproval(moneybookApproval) > 0;
	}

	/**
	 * 법카 결재 처리
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean updateProcessingMoneybookApproval(Approval moneybookApproval, String[] seqs) throws Exception {
		if (moneybookApproval.getSentMemberId() == null && moneybookApproval.getReceivedMemberId() == null) {
			logger.info("~~ [sendMemberId == null AND receivedMemberId == null !!]");
			return false;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("vo", moneybookApproval);
		map.put("seqs", seqs);
		return corpMoneybookApprovalMapper.updateProcessingMoneybookApproval(map) > 0;
	}

	/**
	 * 법카 결재 삭제
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean deleteMoneybookApproval(Approval moneybookApproval) throws Exception {
		return corpMoneybookApprovalMapper.deleteMoneybookApproval(moneybookApproval) > 0;
	}

}
