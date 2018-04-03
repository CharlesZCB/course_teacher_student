package com.cn.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
public interface CourseMapping {

	List<Course> getAll();

	void delete(int id);

	void Addone(@Param("cname")String cname,@Param("ctim")int ctim,@Param("csco")int csco,
			@Param("ccode")int ccode,@Param("cintroduce")String cintroduce,
			@Param("xueqi")String xueqi,@Param("jibie")String jibie,@Param("year")String year);

	Course getCourseById(@Param("ids")int ids);

	String getNameById(@Param("integer")Integer integer);

	int getCtimeByCid(@Param("cid")int cid);

	List<Integer> getCidByyear(@Param("year")String year,@Param("xueqi")String xueqi);

	List<Course> getAllByJibie(@Param("jibie")String jibie);

	List<Integer> getAllByYearXueqiJibie(@Param("string")String string,
			@Param("string2") String string2,@Param("jibie") String jibie);

	List<Course> getAllNodistinc();

	List<String> getDistinctYear();

	List<Course> getAllByYearAndXueqi(@Param("nian")String nian,@Param("xueqi") String xueqi);

	int getCidByCode(@Param("ccode")int ccode);

	String getJIbieBycid(@Param("cid")int cid);


}
