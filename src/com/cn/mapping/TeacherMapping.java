package com.cn.mapping;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

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
public interface TeacherMapping {

	List<Teacher> List();

	void addOne(@Param("tname")String tname,
			@Param("email")String email, 
			@Param("birth")Date births, 
			@Param("headads")String headads, 
			@Param("headname")String headname,
			@Param("workcall")String workcall,
			@Param("county")String s_county, 
			@Param("province")String s_province, 
			@Param("city")String s_city,
			@Param("password")String passsword,
			@Param("telphone")String telphone,
			@Param("tcode")String tcode,
			@Param("tsex")String tsex,
			@Param("ident")String ident);

	void delete(int id);

	void Updates(@Param("id")int id,@Param("tname") String tname,@Param("telphone") String telphone,@Param("email") String email,
			@Param("birth")Date births, @Param("workcall")String workcall);

	Teacher getTeacherById(@Param("integer")Integer integer);

	Integer getIdByNameAndPass(@Param("tcode")String tcode,@Param("tpass") String tpass);

	String getNameBycode(@Param("tcode")String tcode,@Param("password")String password);

	String getSexById(@Param("id")int id);

	String getProvince(@Param("id")int id);

	String getCountyById(@Param("id")int id);

	String getCity(@Param("id")int id);

	java.util.Date getBirthById(@Param("id")int id);

	String getEmailById(@Param("id")int id);

	String getPhoneById(@Param("id")int id);

	String getWorkcallById(@Param("id")int id);

	String getHeadById(@Param("id")int id);

	String getPassswordById(@Param("id")int id);

	String getCodeById(@Param("id")int id);

	String getnameById(@Param("id")int id);

	String getNameBycodes(@Param("tcode")String tcode);

	Integer getIdBycode(@Param("daoyuan")String daoyuan);

	void UpdatePassById(@Param("id")int id, @Param("newpass")String newpass);

	List<Teacher> getTeacherByCondition(@Param("content")String content);

	Integer getIdByidentCode(@Param("ident")String ident,@Param("scode")String scode);


	



}
