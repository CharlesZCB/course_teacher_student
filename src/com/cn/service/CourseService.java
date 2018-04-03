package com.cn.service;

import java.util.List;

import com.cn.bean.Course;
import com.cn.bean.Teacher;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface CourseService {

	List<Course> getAll();

	void delete(int id);

	void addOne(String cname,int ctim,int csco,int ccode,
			String cintroduce,String xueqi,String jibie,String year);

	Course getCourseById(int ids);

	String getCoursenameById(Integer integer);

	int getCtimeByCid(int cid);

	List<Integer> getCourseIdByYear(String year,String xueqi);

	List<Course> getAllByJibie(String jibie);

	List<Integer> getAllByNianXueqiJibie(String string, String string2, String jibie);

	List<Course> getAllDistinct();

	List<String> getDistinctYear();

	List<Course> getAllByYearAndXueqi(String nian, String xueqi);

	int getCidBycode(int ccode);

	String getJibieBYcid(int cid);
	

}
