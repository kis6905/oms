package com.open.ms.service.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.service.mapper.MoneybookMapper;
import com.open.ms.service.service.MoneybookService;
import com.open.ms.service.vo.Moneybook;

@Service(value = "moneybookServiceImpl")
public class MoneybookServiceImpl implements MoneybookService {

	@Autowired
	private MoneybookMapper moneybookMapper;
	
	@Override
	public List<Moneybook> getMoneybookList(
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
		return moneybookMapper.getMoneybookList(map);
	}
	
	@Override
	public Map<String, Object> getMoneybookListTotalCntAndPrice(String memberId, String startDate, String endDate) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return moneybookMapper.getMoneybookListTotalCntAndPrice(map);
	}
	
	@Override
	public boolean insertMoneybook(Moneybook moneybook) throws Exception {
		return moneybookMapper.insertMoneybook(moneybook) > 0;
	}

	@Override
	public boolean updateMoneybook(Moneybook moneybook) throws Exception {
		return moneybookMapper.updateMoneybook(moneybook) > 0;
	}

	@Override
	public boolean deleteMoneybook(Moneybook moneybook) throws Exception {
		return moneybookMapper.deleteMoneybook(moneybook) > 0;
	}
	
}
