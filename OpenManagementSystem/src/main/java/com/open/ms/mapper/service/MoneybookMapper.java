package com.open.ms.mapper.service;

import java.util.List;
import java.util.Map;

import com.open.ms.vo.service.Moneybook;

/**
 * @author iskwon
 */
public interface MoneybookMapper {
	
	List<Moneybook> getMoneybookList(Map<String, Object> map);
	Map<String, Object> getMoneybookListTotalCntAndPrice(Map<String, Object> map);
	int insertMoneybook(Moneybook moneybook);
	int updateMoneybook(Moneybook moneybook);
	int deleteMoneybook(Moneybook moneybook);
	
}
