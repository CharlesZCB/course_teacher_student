package com.cn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Course;
import com.cn.bean.Teacher;
import com.cn.mapping.CourseMapping;
import com.cn.service.CourseService;
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
public class CourseServiceImp implements CourseService{

	@Autowired
	CourseMapping courseMapping;
	@Override
	public List<Course> getAll() {
		return courseMapping.getAll();
	}
	@Override
	public void delete(int id) {
		courseMapping.delete(id);
		
	}
	@Override
	public void addOne(String cname,int ctim,int csco,int ccode,String cintroduce,
			String xueqi,String jibie,String year) {
		courseMapping.Addone(cname,ctim,csco,ccode,cintroduce,xueqi,jibie,year);
	}
	@Override
	public Course getCourseById(int ids) {
		return courseMapping.getCourseById(ids);
	}
	@Override
	public String getCoursenameById(Integer integer) {
		// TODO Auto-generated method stub
		return courseMapping.getNameById(integer);
	}
	@Override
	public int getCtimeByCid(int cid) {
		// TODO Auto-generated method stub
		return courseMapping.getCtimeByCid(cid);
	}
	@Override
	public List<Integer> getCourseIdByYear(String year,String xueqi) {
		// TODO Auto-generated method stub
		return courseMapping.getCidByyear(year,xueqi);
	}
	@Override
	public List<Course> getAllByJibie(String jibie) {
		// TODO Auto-generated method stub
		return courseMapping.getAllByJibie(jibie);
	}
	@Override
	public List<Integer> getAllByNianXueqiJibie(String string, String string2, String jibie) {
		// TODO Auto-generated method stub
		return courseMapping.getAllByYearXueqiJibie(string,string2,jibie);
	}
	@Override
	public List<Course> getAllDistinct() {
		// TODO Auto-generated method stub
		return courseMapping.getAllNodistinc();
	}
	@Override
	public List<String> getDistinctYear() {
		// TODO Auto-generated method stub
		return courseMapping.getDistinctYear();
	}
	@Override
	public List<Course> getAllByYearAndXueqi(String nian, String xueqi) {
		// TODO Auto-generated method stub
		return courseMapping.getAllByYearAndXueqi(nian,xueqi);
	}
	@Override
	public int getCidBycode(int ccode) {
		// TODO Auto-generated method stub
		return courseMapping.getCidByCode(ccode);
	}
	@Override
	public String getJibieBYcid(int cid) {
		// TODO Auto-generated method stub
		return courseMapping.getJIbieBycid(cid);
	}
	

}
