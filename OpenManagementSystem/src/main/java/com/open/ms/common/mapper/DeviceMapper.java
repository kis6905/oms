package com.open.ms.common.mapper;

import java.util.List;

import com.open.ms.common.vo.Device;

/**
 * @author iskwon
 */
public interface DeviceMapper {
	
	List<Device> getDeviceListOfMember(String memberId);
	
	Integer insertDevice(Device device);
	int updateDevice(Device device);
	int deleteDevice(Device device);
	
}
