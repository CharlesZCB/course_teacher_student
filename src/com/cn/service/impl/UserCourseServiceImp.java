package com.cn.service.impl;


import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Usercourse;
import com.cn.mapping.UsercourseMapping;
import com.cn.service.UsercourseService;
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
public class UserCourseServiceImp implements UsercourseService {

	@Autowired
	UsercourseMapping userCourseMapping;
	
	@Override
	public void insertScore(int cid, String uid, int score,String uname,
			String cname,int ctime,int bid,String nian,String xueqi) {
		// TODO Auto-generated method stubin
		userCourseMapping.insertScore(cid,uid,score,uname,cname,ctime,bid,nian,xueqi);
	}

	@Override
	public List<Integer> getCidByScode(String scode) {
		// TODO Auto-generated method stub
		return userCourseMapping.getCidByScode(scode);
	}

	@Override
	public List<Usercourse> getAllByscode(String scode) {
		// TODO Auto-generated method stub
		return userCourseMapping.getAllByScode(scode);
	}

	@Override
	public List<Usercourse> getAll() {
		// TODO Auto-generated method stub
		return userCourseMapping.getAll();
	}

	@Override
	public List<LinkedHashMap> GetScoresByBid(int classid) {
		return userCourseMapping.GetScoresByBid(classid);
	}

	@Override
	public List<LinkedHashMap> GetScoresByBidAndXueqi(int classid, String string, String string2) {
		// TODO Auto-generated method stub
		return userCourseMapping.GetScoresByBidAndXueqi(classid,string,string2);
	}

	@Override
	public List<Usercourse> getAllByuidAndXueqi(String scode, String nian, String xuedu) {
		// TODO Auto-generated method stub
		return userCourseMapping.getAllByuidAndXueqi(scode,nian,xuedu);
	}

	@Override
	public List<Integer> getIdByXueqiAndNian(String xueqi, String nian,int bid,int cid) {
		// TODO Auto-generated method stub
		return userCourseMapping.getIdByXueqiAndNian(xueqi,nian,bid,cid);
	}

	@Override
	public String getCnameByCidBid(int id, int bid) {
		// TODO Auto-generated method stub
		return userCourseMapping.getCnameByCidBid(id,bid);
	}

	@Override
	public void UpdateBycode(String scode, String name) {
		// TODO Auto-generated method stub
		userCourseMapping.updateBycode(scode,name);
	}

	@Override
	public List<Usercourse> getScoreByCidBid(int bid, int cid) {
		// TODO Auto-generated method stub
		return userCourseMapping.getScoreByCidBid(cid,bid);
	}

	@Override
	public void deleteBycid(int id) {
		userCourseMapping.deleteBycid(id);
	}

	@Override
	public List<Usercourse> getAllBycid(int cid) {
		// TODO Auto-generated method stub
		return userCourseMapping.getAllBycid(cid);
	}

	@Override
	public int getNumBycidBid(int cid, int bid) {
		// TODO Auto-generated method stub
		return userCourseMapping.getTotalnumberBycidbid(cid,bid);
	}



	

}
