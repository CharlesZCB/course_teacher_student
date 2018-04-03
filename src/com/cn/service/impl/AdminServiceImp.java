package com.cn.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Admin;
import com.cn.mapping.AdminMapping;
import com.cn.service.AdminService;
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
public class AdminServiceImp implements AdminService {

	@Autowired 
	AdminMapping adminMapping;
	@Override
	public Integer Check(String name, String pass) {
	    return adminMapping.check(name,pass);
	}
	@Override
	public String getHeadByid(Integer id) {
		// TODO Auto-generated method stub
		return adminMapping.getHeadByid(id);
	}

}
