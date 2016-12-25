package com.open.ms.service.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.open.ms.service.vo.PersonMoneybookApproval;

/**
 * @author iskwon
 */
@Service
public interface PersonMoneybookApprovalService {
	
	List<PersonMoneybookApproval> getSentApprovalList(String requestMemberId, long offset, long limit, String sort, String order) throws Exception;
	List<PersonMoneybookApproval> getReceivedApprovalList(String targetMemberId, long offset, long limit, String sort, String order) throws Exception;
	int getSentApprovalListTotalCnt(String requestMemberId) throws Exception;
	int getReceivedApprovalListTotalCnt(String targetMemberId) throws Exception;
	boolean insertPersonMoneybookApproval(PersonMoneybookApproval personMoneybookApproval) throws Exception;
	boolean updatePersonMoneybookApproval(PersonMoneybookApproval personMoneybookApproval) throws Exception;
	boolean deletePersonMoneybookApproval(PersonMoneybookApproval personMoneybookApproval) throws Exception;
	
}
