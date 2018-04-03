package com.cn.service.impl;

import java.util.List;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Classroom;
import com.cn.bean.Teacher;
import com.cn.mapping.ClassroomMapping;
import com.cn.service.ClassRoomService;
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
public class ClassroomServiceImp implements ClassRoomService{
@Autowired
ClassroomMapping classroomMapping;
	
	@Override
	public List<Classroom> getAll() {
		// 
		return classroomMapping.getAll();
	}

	@Override
	public void delete(int id) {
		classroomMapping.deletes(id);
		
	}

	@Override
	public List<String> getAllTeacher() {
		// TODO Auto-generated method stub
		return classroomMapping.getallTeachername();
	}

	@Override
	public void insertclass(String jibie, String classname, String daoyuan, int num,String tcode) {
		classroomMapping.insertclass(jibie,classname,daoyuan,num,tcode);
		
	}

	@Override
	public String getJibieById(int id) {
		
		return classroomMapping.getTeBYId(id);
	}

	@Override
	public String getClassNameById(int id) {
		// TODO Auto-generated method stub
		return classroomMapping.getClassRoomById(id);
	}

	@Override
	public void UpdateRoomByDaoyuan(String daoyuan,int cnum,String tname) {
		classroomMapping.UpdateByDaoyuan(daoyuan,cnum,tname);
		
	}

	@Override
	public int getClassCodeById(int id) {
		return classroomMapping.getCode(id);
	}

	@Override
	public List getCNum() {
		return classroomMapping.getSNum();
	}

	@Override
	public void insertNumBybanhao(int parseInt,int i) {
		classroomMapping.insertNum(parseInt,i);
		
	}

	@Override
	public List getAllbanhao() {
		
		return classroomMapping.getAllBanhao();
	}

	@Override
	public Classroom getClassDetailById(int id) {
		// TODO Auto-generated method stub
		return classroomMapping.getClassById(id);
	}

	@Override
	public String getNameByBanhao(int ban1) {
		
		return classroomMapping.getClassNameByBanhao(ban1);
	}

	@Override
	public String getJibieByBanhao(int ban2) {
		// TODO Auto-generated method stub
		return classroomMapping.getJibieByBanhao(ban2);
	}

	@Override
	public List<Classroom> getJibieNoDistinct() {
		// TODO Auto-generated method stub
		return classroomMapping.getJibieNoDistinct();
	}

	@Override
	public List<String> getNameJibie(String jibie) {
		// TODO Auto-generated method stub
		return classroomMapping.getNameByjibie(jibie);
	}

	@Override
	public List<Integer> getBanhaoByNameJibie(String banming, String jibie) {
		// TODO Auto-generated method stub
		return classroomMapping.getBanhaoByNameJibie(banming,jibie);
	}

	@Override
	public Classroom getRoomById(Integer integer) {
		// TODO Auto-generated method stub
		return classroomMapping.getClassRoomsById(integer);
	}

	@Override
	public List<Classroom> getClassByTcode(String tcode) {
		// TODO Auto-generated method stub
		return classroomMapping.getClassByTcode(tcode);
	}

	@Override
	public Classroom getClassBybcode(Integer integer) {
		// TODO Auto-generated method stub
		return classroomMapping.getClassBYCode(integer);
	}

	@Override
	public int getbanhaoByCid(int classid) {
		// TODO Auto-generated method stub
		return classroomMapping.getBanhaoById(classid);
	}

	@Override
	public int getSnumBybanhao(String banhao) {
		// TODO Auto-generated method stub
		return classroomMapping.getSnumByBanhao(banhao);
	}

	@Override
	public void updateStuNumBybanhao(int snum, String banhao) {
		// TODO Auto-generated method stub
		classroomMapping.updateSnumBybanhao(snum,banhao);
	}

	@Override
	public List<Integer> getBanhaoByTcode(String tcode) {
		// TODO Auto-generated method stub
		return classroomMapping.getBahaoByTcode(tcode);
	}

	@Override
	public void updateTname(String tname, String tcode) {
		// TODO Auto-generated method stub
		classroomMapping.UpdateTnameByTcode(tname,tcode);
	}

	@Override
	public List<Classroom> getAllByJibie(String jibie) {
		// TODO Auto-generated method stub
		return classroomMapping.getAllByJibie(jibie);
	}

	@Override
	public int getIdBycode(int bid) {
		// TODO Auto-generated method stub
		return classroomMapping.getIdBycode(bid);
	}

	







	

	

}
