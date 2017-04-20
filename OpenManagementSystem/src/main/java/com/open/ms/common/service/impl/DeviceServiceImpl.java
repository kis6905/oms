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
		
		String memberId = device.getMemberId();
		
		List<Device> deivceList = deviceMapper.getDeviceListOfMember(memberId);
		
		Device sameDevice = null;
		if (deivceList != null) {
			sameDevice = deivceList.stream().filter(device1 -> {
				return device1.getDeviceModelName().equals(device.getDeviceModelName());
			})
			.findFirst()
			.orElse(null);
		}
		
		Integer deviceSeq = 0;
		
		// 같은 기종의 단말이 등록되어 있으면 등록하지 않는다.
		// TODO 같은 기종이지만 다른 단말일 때 구분은 어떻게 할지?
		if (sameDevice == null)
			deviceSeq = deviceMapper.insertDevice(device);
		
		// 처음으로 등록하는 단말이면 대표 단말로 설정
		boolean isFirstDevice = false;
		if (deivceList == null || deivceList.isEmpty())
			isFirstDevice = true;
		
		if (isFirstDevice && deviceSeq > 0) {
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
