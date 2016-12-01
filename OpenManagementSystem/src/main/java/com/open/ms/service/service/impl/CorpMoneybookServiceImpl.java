package com.open.ms.service.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.service.mapper.CorpMoneybookMapper;
import com.open.ms.service.service.CorpMoneybookService;
import com.open.ms.service.vo.CorpMoneybook;

@Service(value = "corpMoneybookServiceImpl")
public class CorpMoneybookServiceImpl implements CorpMoneybookService {

	@Autowired
	private CorpMoneybookMapper corpMoneybookMapper;
	
	@Override
	public List<CorpMoneybook> getCorpMoneybookList(
			String memberId, String startDate, String endDate,
			long offset, long limit, String sort, String order)  throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("start", offset + 1);
		map.put("end", offset + limit);
		map.put("sort", sort);
		map.put("order", order);
		return corpMoneybookMapper.getCorpMoneybookList(map);
	}
	
	@Override
	public Map<String, Object> getCorpMoneybookListTotalCntAndPrice(String memberId, String startDate, String endDate) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return corpMoneybookMapper.getCorpMoneybookListTotalCntAndPrice(map);
	}
	
	@Override
	public boolean insertCorpMoneybook(CorpMoneybook corpMoneybook) throws Exception {
		return corpMoneybookMapper.insertCorpMoneybook(corpMoneybook) > 0;
	}

	@Override
	public boolean updateCorpMoneybook(CorpMoneybook corpMoneybook) throws Exception {
		return corpMoneybookMapper.updateCorpMoneybook(corpMoneybook) > 0;
	}

	@Override
	public boolean deleteCorpMoneybook(CorpMoneybook corpMoneybook) throws Exception {
		return corpMoneybookMapper.deleteCorpMoneybook(corpMoneybook) > 0;
	}
	
}
