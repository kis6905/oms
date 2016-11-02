package com.open.ms.service.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.open.ms.service.vo.Moneybook;

@Service
public interface MoneybookService {
	
	List<Moneybook> getMoneybookList(String memberId, String startDate, String endDate, long offset, long limit, String sort, String order) throws Exception;
	Map<String, Object> getMoneybookListTotalCntAndPrice(String memberId, String startDate, String endDate) throws Exception;
	boolean insertMoneybook(Moneybook moneybook) throws Exception;
	boolean updateMoneybook(Moneybook moneybook) throws Exception;
	boolean deleteMoneybook(Moneybook moneybook) throws Exception;
	
}
