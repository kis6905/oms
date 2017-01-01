package com.open.ms.service.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.service.vo.PersonMoneybook;

/**
 * @author iskwon
 */
public interface PersonMoneybookMapper {
	
	List<PersonMoneybook> getPersonMoneybookList(Map<String, Object> map);
	Map<String, Object> getPersonMoneybookListTotalCntAndPrice(Map<String, Object> map);
	PersonMoneybook getPersonMoneybookOfSeq(Integer seq);
	
	int insertPersonMoneybook(PersonMoneybook moneybook);
	int updatePersonMoneybook(PersonMoneybook moneybook);
	int deletePersonMoneybook(PersonMoneybook moneybook);
	
}
