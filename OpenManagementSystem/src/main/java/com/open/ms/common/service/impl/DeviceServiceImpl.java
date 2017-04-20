package com.open.ms.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.common.mapper.DeviceMapper;
import com.open.ms.common.mapper.MemberMapper;
import com.open.ms.common.service.DeviceService;
import com.open.ms.common.vo.Device;

/**
 * @author iskwon
 */
@Service(value = "deviceServiceImpl")
public class DeviceServiceImpl implements DeviceService {

	@Autowired
	private DeviceMapper deviceMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public List<Device> getDeivceListOfMember(String memberId) throws Exception {
		return deviceMapper.getDeviceListOfMember(memberId);
	}

	@Override
	public boolean insertDevice(Device device, String fcmToken) throws Exception {
		
		Integer deviceSeq = deviceMapper.insertDevice(device);
		
		String memberId = device.getMemberId();
		
		// 처음으로 등록하는 단말이면 대표 단말로 설정
		List<Device> deivceList = deviceMapper.getDeviceListOfMember(memberId);
		
		boolean isFirstDevice = false;
		if (deivceList == null || deivceList.isEmpty())
			isFirstDevice = true;
		
		if (isFirstDevice) {
			if (fcmToken == null || fcmToken.isEmpty())
				fcmToken = null;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("deviceSeq", deviceSeq);
			map.put("memberId", memberId);
			map.put("fcmToken", fcmToken);
			memberMapper.updateDeviceSeqAndFcmToken(map);
		}
		
		// seq는 1부터 시작한다. 따라서 0보다 작을 시 인서트가 안 된것이다.
		return deviceSeq == null || deviceSeq > 0;
	}

	@Override
	public boolean deleteDevice(Device device) throws Exception {
		return deviceMapper.deleteDevice(device) > 0;
	}
	
}
