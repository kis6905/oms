package com.open.ms.service.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.service.vo.PersonMoneybookApproval;

/**
 * @author iskwon
 */
public interface PersonMoneybookApprovalMapper {
	
	List<PersonMoneybookApproval> getRequestedApprovalList(Map<String, Object> map);
	List<PersonMoneybookApproval> getReceivedApprovalList(Map<String, Object> map);
	int getSentApprovalListTotalCnt(Map<String, Object> map);
	int getReceivedApprovalListTotalCnt(Map<String, Object> map);
	int insertPersonMoneybookApproval(PersonMoneybookApproval personMoneybookApproval);
	int updatePersonMoneybookApproval(PersonMoneybookApproval personMoneybookApproval);
	int deletePersonMoneybookApproval(PersonMoneybookApproval personMoneybookApproval);
	
}
