package com.cn.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.cn.bean.Usercourse;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface UsercourseService {

	void insertScore(int cid, String uid, int score, String uname,
			String cname,int ctime,int bid,String nian,String xueqi);

	List<Integer> getCidByScode(String scode);

	List<Usercourse> getAllByscode(String scode);

	List<Usercourse> getAll();

	List<LinkedHashMap> GetScoresByBid(int classid);

	List<LinkedHashMap> GetScoresByBidAndXueqi(int classid, String string, String string2);

	List<Usercourse> getAllByuidAndXueqi(String scode, String nian, String xuedu );

	List<Integer> getIdByXueqiAndNian(String xueqi, String nian,int bid,int cid);

	String getCnameByCidBid(int id, int bid);

	void UpdateBycode(String scode, String name);

	List<Usercourse> getScoreByCidBid(int bid, int cid);

	void deleteBycid(int id);

	List<Usercourse> getAllBycid(int cid);

	int getNumBycidBid(int cid, int bid);



}
