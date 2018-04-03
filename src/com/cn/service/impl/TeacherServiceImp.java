package com.cn.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Teacher;
import com.cn.mapping.TeacherMapping;
import com.cn.service.TeacherService;
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
public class TeacherServiceImp implements TeacherService {
@Autowired
TeacherMapping teacherMapping;
	
	@Override
	public List<Teacher> getList() {
		// TODO Auto-generated method stub
		return teacherMapping.List();
		
	}

	@Override
	public void insertone(String tname, String email, Date births, String headads, String headname,String  workcall,
			String s_county, String s_province, String s_city,String password,
			String telphone,String tcode,String tsex,String ident) {
		 teacherMapping.addOne(tname,email,births,headads,headname,workcall,s_county,s_province,s_city,
				 password,telphone,tcode,tsex,ident);
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		teacherMapping.delete(id);
	}

	@Override
	public void Updates(int id, String tname, String telphone, String email, Date births, String workcall) {
		teacherMapping.Updates(id,tname,telphone,email,births,workcall);
		
	}

	@Override
	public Teacher getTeacherById(Integer integer) {
		return teacherMapping.getTeacherById(integer);
	}

	@Override
	public Integer getIdByNameAndPass(String tcode, String tpass) {
		return teacherMapping.getIdByNameAndPass(tcode,tpass);
	}

	@Override
	public String getNameBycode(String tcode,String password) {
		// TODO Auto-generated method stub
		return teacherMapping.getNameBycode(tcode,password);
	}

	@Override
	public String getSexByid(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getSexById(id);
	}

	@Override
	public String getProvince(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getProvince(id);
	}

	@Override
	public String getCountyById(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getCountyById(id);
	}

	@Override
	public String getCity(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getCity(id);
	}

	@Override
	public java.util.Date getBirthById(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getBirthById(id);
	}

	@Override
	public String getEmailById(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getEmailById(id);
	}

	@Override
	public String getTelphoneById(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getPhoneById(id);
	}

	@Override
	public String getWorkcallById(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getWorkcallById(id);
	}

	@Override
	public String getheadById(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getHeadById(id);
	}

	@Override
	public String getpasswordByid(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getPassswordById(id);
	}

	@Override
	public String getCodeById(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getCodeById(id);
	}

	@Override
	public String getNameById(int id) {
		// TODO Auto-generated method stub
		return teacherMapping.getnameById(id);
	}

	@Override
	public String getNameBycodes(String tcode) {
		// TODO Auto-generated method stub
		return teacherMapping.getNameBycodes(tcode);
	}

	@Override
	public Integer getIdBycode(String daoyuan) {
		// TODO Auto-generated method stub
		return teacherMapping.getIdBycode(daoyuan);
	}

	@Override
	public void UpdatePassById(int id, String newpass) {
		// TODO Auto-generated method stub
		teacherMapping.UpdatePassById(id,newpass);
	}

	@Override
	public List<Teacher> getTeacherByCondition(String content) {
		// TODO Auto-generated method stub
		return teacherMapping.getTeacherByCondition(content);
	}

	@Override
	public Integer getIdBycodeIdent(String ident, String scode) {
		// TODO Auto-generated method stub
		return teacherMapping.getIdByidentCode(ident,scode);
	}

	
	

}
