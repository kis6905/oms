package com.open.ms.common.service;

import java.util.List;

import com.open.ms.common.vo.Device;

/**
 * @author iskwon
 */
public interface DeviceService {
	
	List<Device> getDeivceListOfMember(String memberId) throws Exception;
	
	boolean insertDevice(Device device, String fcmToken) throws Exception;
	boolean deleteDevice(Device device) throws Exception;
	
}
