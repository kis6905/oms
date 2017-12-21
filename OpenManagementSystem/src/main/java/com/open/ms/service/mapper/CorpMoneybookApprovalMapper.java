package com.open.ms.service.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.service.vo.Approval;

/**
 * @author iskwon
 */
public interface CorpMoneybookApprovalMapper {
	
	List<Approval> getApprovalList(Map<String, Object> map);
	int getApprovalListTotalCnt(Map<String, Object> map);
	
	Approval getApprovalOfSeq(String seq);
	
	int insertMoneybookApproval(Approval approval);
	int updateProcessingMoneybookApproval(Map<String, Object> map);
	int deleteMoneybookApproval(Approval approval);
}
