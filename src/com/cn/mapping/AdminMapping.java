package com.cn.mapping;

import org.apache.ibatis.annotations.Param;

import com.cn.bean.Admin;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface AdminMapping {

	Integer check(@Param("name")String name,@Param("pass") String pass);

	String getHeadByid(@Param("id")Integer id);


}
