package com.cn.service;

import java.util.Date;
import java.util.List;

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
public interface TeacherService {

	List<Teacher> getList();

	void insertone(String tname, String email, Date births, String headads, String headname,String workcall,
			String s_county, String s_province, String s_city,String password,
			String telphone, String tcode,String tsex,String ident);

	void delete(int id);

	void Updates(int id, String tname, String telphone, String email, Date births, String workcall);

	Teacher getTeacherById(Integer integer);

	Integer getIdByNameAndPass(String tcode, String tpass);

	String getNameBycode(String tcode, String tpass);

	String getSexByid(int id);

	String getProvince(int id);

	String getCountyById(int id);

	String getCity(int id);

	Date getBirthById(int id);

	String getEmailById(int id);

	String getTelphoneById(int id);

	String getWorkcallById(int id);

	String getheadById(int id);

	String getpasswordByid(int id);

	String getCodeById(int id);

	String getNameById(int id);

	String getNameBycodes(String tcode);

	Integer getIdBycode(String daoyuan);

	void UpdatePassById(int id, String newpass);

	List<Teacher> getTeacherByCondition(String content);

	Integer getIdBycodeIdent(String ident, String scode);

	

}
