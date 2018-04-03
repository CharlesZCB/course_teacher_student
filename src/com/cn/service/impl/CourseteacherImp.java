package com.cn.service.impl;

import java.util.List;

import javax.swing.text.Position.Bias;

import org.springframework.aop.IntroductionInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Courseteacher;
import com.cn.mapping.CourseteacherMapping;
import com.cn.service.CourseteacherService;
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
public class CourseteacherImp implements CourseteacherService{

	@Autowired
	CourseteacherMapping courseteacherMapping;
	@Override
	public List<Integer> getTeacherById(int ids) {
		return courseteacherMapping.getTeachersList(ids);
	}
	@Override
	public void insertOne(int tc, int cid,int bid,int ctime, String tname,
			String cname,String week,String jie,String banming) {
		courseteacherMapping.insertOne(tc,cid,bid,ctime,tname,cname,week,jie,banming);
	}

	@Override
	public List<Courseteacher> getAll() {
		// TODO Auto-generated method stub
		return courseteacherMapping.getAll();
	}
	@Override
	public Courseteacher IsTeacherExut(int ban1, int cid) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getTeacherIdIs(ban1,cid);
	}
	
	@Override
	public List<Integer> getAllteacherId() {
		// TODO Auto-generated method stub
		return courseteacherMapping.getAllTeacherId();
	}
	@Override
	public List<Integer> getCourseIdByTId(int id) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getCourseIdById(id);
	}
	@Override
	public List<Integer> getbanjiIdByTId(int id) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getroomIdById(id);
	}
	@Override
	public List<Integer> getBanjisByTidCid(int tid, int cid) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getBanjisByTidCid(tid,cid);
	}
	@Override
	public List<Integer> getCidByBanhao(int banhao) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getCidByBanhao(banhao);
	}
	@Override
	public List<Integer> getTidByBanhao(int banhao) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getTidByBanhao(banhao);
	}
	@Override
	public String getCourseNameByTidCid(Integer integer, Integer integer2) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getCourseNameByTidCid(integer,integer2);
	}
	@Override
	public List<Courseteacher> getAllBybanhao(int banhao) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getAllBybanhao(banhao);
	}
	@Override
	public void deleteteacourseByTid(int id) {
		// TODO Auto-generated method stub
		courseteacherMapping.deleteteacourseBytid(id);
	}
	@Override
	public void deletecourseByCid(int id) {
		courseteacherMapping.deleteCourseByCid(id);
		
	}
	@Override
	public Integer getIdByWeekAndJieTc(String week, String jie, int tc) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getIdByWeekjieTc(week,jie,tc);
	}
	@Override
	public List<Courseteacher> getAllByTid(int tid) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getAllByTid(tid);
	}
	@Override
	public List<Courseteacher> getAllBybanhao1(int banhao) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getAllBybanhao1(banhao);
	}
	@Override
	public Integer getIdByWeekAndJie(String week, String jie,int ban1) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getIdByWeekAndJie(week,jie,ban1);
	}
	@Override
	public List<Courseteacher> getAllByTidCid(int tid, Integer integer) {
		return courseteacherMapping.getAllByTidAndCid(tid,integer);
	}
	@Override
	public  List<Integer> getIdByTidCid(int tid, int cident) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getIdByTidCId(tid,cident);
	}
	@Override
	public Courseteacher getAllById(Integer integer) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getAllById(integer);
	}
	@Override
	public List<Courseteacher> getAllBcodeCid(Integer integer, int banhao) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getAllByBcodeCid(integer,banhao);
	}
	@Override
	public List<Integer> getTidByCid(int cid) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getTidByCid(cid);
	}
	@Override
	public List<Courseteacher> getAllDistincBycid(int id) {
		// TODO Auto-generated method stub
		return courseteacherMapping.getAllDistinctBycid(id);
	}
	@Override
	public void UpdateTeacher(int id, String tname) {
		// TODO Auto-generated method stub
		courseteacherMapping.Update(id,tname);
	}

	

}
