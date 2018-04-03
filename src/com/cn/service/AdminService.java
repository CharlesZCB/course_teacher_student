package com.cn.service;

/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface AdminService {

	Integer Check(String name, String pass);

	String getHeadByid(Integer id);


}
