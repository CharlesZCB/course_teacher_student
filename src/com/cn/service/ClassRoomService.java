package com.cn.service;

import java.util.List;

import com.cn.bean.Classroom;
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
public interface ClassRoomService {

	List<Classroom> getAll();

	void delete(int id);

	List<String> getAllTeacher();

	void insertclass(String jibie, String classname, String daoyuan, int num, String tcode);

	String getJibieById(int id);

	String getClassNameById(int id);

	void UpdateRoomByDaoyuan(String daoyuan,int cnum, String tname);

	int getClassCodeById(int id);

	List getCNum();

	void insertNumBybanhao(int parseInt, int i);

	List getAllbanhao();

	Classroom getClassDetailById(int id);

	String getNameByBanhao(int ban1);

	String getJibieByBanhao(int ban2);

	List<Classroom> getJibieNoDistinct();

	List<String> getNameJibie(String jibie);

	List<Integer> getBanhaoByNameJibie(String banming, String jibie);

	Classroom getRoomById(Integer integer);

	List<Classroom> getClassByTcode(String tcode);

	Classroom getClassBybcode(Integer integer);

	int getbanhaoByCid(int classid);

	int getSnumBybanhao(String banhao);

	void updateStuNumBybanhao(int snum, String banhao);

	List<Integer> getBanhaoByTcode(String tcode);

	void updateTname(String tname, String tcode);

	List<Classroom> getAllByJibie(String jibie);

	int getIdBycode(int bid);


}
