package com.cn.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Admin;
import com.cn.mapping.AdminMapping;
import com.cn.mapping.IPAddMapping;
import com.cn.service.AdminService;
import com.cn.service.IPAddService;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
@Service
public class IPAddServiceImp implements IPAddService {

	@Autowired 
	IPAddMapping ipAddMapping;

	@Override
	public Integer getIdByaddress(String address) {
		return ipAddMapping.getIdByAdd(address);
	}

	@Override
	public void insertone(String address) {
		ipAddMapping.insertone(address);
	}

	@Override
	public int getMaxId() {
		// 取到的MaxId就是总数
		return ipAddMapping.getMaxId();
	}
	
}
