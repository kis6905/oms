package com.open.ms.service.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.service.vo.Approval;

/**
 * @author iskwon
 */
public interface PersonMoneybookApprovalMapper {
	
	List<Approval> getApprovalList(Map<String, Object> map);
	int getApprovalListTotalCnt(Map<String, Object> map);
	
	Approval getApprovalOfSeq(String seq);
	
	int insertPersonMoneybookApproval(Approval approval);
	int updateProcessingPersonMoneybookApproval(Map<String, Object> map);
	int deletePersonMoneybookApproval(Approval approval);
}
