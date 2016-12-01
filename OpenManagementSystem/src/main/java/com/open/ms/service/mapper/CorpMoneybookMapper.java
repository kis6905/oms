package com.open.ms.service.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.service.vo.CorpMoneybook;

/**
 * @author iskwon
 */
public interface CorpMoneybookMapper {
	
	List<CorpMoneybook> getCorpMoneybookList(Map<String, Object> map);
	Map<String, Object> getCorpMoneybookListTotalCntAndPrice(Map<String, Object> map);
	int insertCorpMoneybook(CorpMoneybook moneybook);
	int updateCorpMoneybook(CorpMoneybook moneybook);
	int deleteCorpMoneybook(CorpMoneybook moneybook);
	
}
