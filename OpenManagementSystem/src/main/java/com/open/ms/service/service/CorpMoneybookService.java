package com.open.ms.service.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.open.ms.service.vo.CorpMoneybook;

@Service
public interface CorpMoneybookService {
	
	List<CorpMoneybook> getCorpMoneybookList(String memberId, String startDate, String endDate, long offset, long limit, String sort, String order) throws Exception;
	Map<String, Object> getCorpMoneybookListTotalCntAndPrice(String memberId, String startDate, String endDate) throws Exception;
	boolean insertCorpMoneybook(CorpMoneybook corpMoneybook) throws Exception;
	boolean updateCorpMoneybook(CorpMoneybook corpMoneybook) throws Exception;
	boolean deleteCorpMoneybook(CorpMoneybook corpMoneybook) throws Exception;
	
}
