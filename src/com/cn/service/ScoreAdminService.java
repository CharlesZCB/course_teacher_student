package com.cn.service;

import java.util.Date;
import java.util.List;

import com.cn.bean.ScoreAdmin;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface ScoreAdminService {

	void insertOne(String year, String xueqi, Date date2);

	ScoreAdmin getRec();

	Date getTime(int i);

	List<ScoreAdmin> getAll();

	Integer SureNoDouble(String year, String xueqi);

	


}
