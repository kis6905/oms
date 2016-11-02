package com.open.ms.service.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.service.vo.Moneybook;

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
