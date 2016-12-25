package com.open.ms.service.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.open.ms.service.vo.Approval;

/**
 * @author iskwon
 */
@Service
public interface ApprovalService {
	
	List<Approval> getSentApprovalList(String sentMemberId, String startDate, String endDate, String statusCode, long offset, long limit, String sort, String order) throws Exception;
	List<Approval> getReceivedApprovalList(String receivedMemberId, String startDate, String endDate, String statusCode, long offset, long limit, String sort, String order) throws Exception;
	int getSentApprovalListTotalCnt(String requestMemberId, String startDate, String endDate, String statusCode) throws Exception;
	int getReceivedApprovalListTotalCnt(String targetMemberId, String startDate, String endDate, String statusCode) throws Exception;
	boolean insertPersonMoneybookApproval(Approval personMoneybookApproval) throws Exception;
	boolean updateProcessingPersonMoneybookApproval(Approval personMoneybookApproval, String[] seqs) throws Exception;
	boolean deletePersonMoneybookApproval(Approval personMoneybookApproval) throws Exception;
	
}
