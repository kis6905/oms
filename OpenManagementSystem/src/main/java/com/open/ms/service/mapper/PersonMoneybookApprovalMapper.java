package com.open.ms.service.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.service.vo.Approval;

/**
 * @author iskwon
 */
public interface PersonMoneybookApprovalMapper {
	
	List<Approval> getSentApprovalList(Map<String, Object> map);
	int getSentApprovalListTotalCnt(Map<String, Object> map);
	
	List<Approval> getReceivedApprovalList(Map<String, Object> map);
	int getReceivedApprovalListTotalCnt(Map<String, Object> map);
	
	int insertPersonMoneybookApproval(Approval approval);
	int updateProcessingPersonMoneybookApproval(Map<String, Object> map);
	int deletePersonMoneybookApproval(Approval approval);
	
}
