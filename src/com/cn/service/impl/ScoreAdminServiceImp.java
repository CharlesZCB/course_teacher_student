package com.cn.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.ScoreAdmin;
import com.cn.mapping.ScoreAdminMapping;
import com.cn.service.ScoreAdminService;
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
public class ScoreAdminServiceImp implements ScoreAdminService {

	@Autowired
	ScoreAdminMapping scoreAdminMapping;
	@Override
	public void insertOne(String year, String xueqi, Date date2) {
		scoreAdminMapping.insertOne(year,xueqi,date2);
	}
	@Override
	public ScoreAdmin getRec() {
		// TODO Auto-generated method stub
		return scoreAdminMapping.getRec();
	}
	@Override
	public Date getTime(int i) {
		// TODO Auto-generated method stub
		return scoreAdminMapping.getTime(i);
	}
	@Override
	public List<ScoreAdmin> getAll() {
		// TODO Auto-generated method stub
		return scoreAdminMapping.getAll();
	}
	@Override
	public Integer SureNoDouble(String year, String xueqi) {
		// TODO Auto-generated method stub
		return scoreAdminMapping.SureNoDouble(year,xueqi);
	}
	

}
