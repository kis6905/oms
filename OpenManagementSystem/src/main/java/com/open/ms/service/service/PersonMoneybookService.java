package com.open.ms.service.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.open.ms.service.vo.PersonMoneybook;

/**
 * @author iskwon
 */
@Service
public interface PersonMoneybookService {
	
	List<PersonMoneybook> getPersonMoneybookList(String memberId, String startDate, String endDate, long offset, long limit, String sort, String order) throws Exception;
	Map<String, Object> getPersonMoneybookListTotalCntAndPrice(String memberId, String startDate, String endDate) throws Exception;
	boolean insertPersonMoneybook(PersonMoneybook personMoneybook) throws Exception;
	boolean updatePersonMoneybook(PersonMoneybook personMoneybook) throws Exception;
	boolean deletePersonMoneybook(PersonMoneybook personMoneybook) throws Exception;
	
}
