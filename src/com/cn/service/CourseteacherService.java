package com.cn.service;

import java.util.List;

import com.cn.bean.Courseteacher;
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
public interface CourseteacherService {

	List<Integer> getTeacherById(int ids);

	void insertOne(int tc, int cid,int bid, int ctime, String tname, String cname, String week, String jie
			,String banming);

	List<Courseteacher> getAll();

	Courseteacher IsTeacherExut(int ban1, int cid);


	List<Integer> getAllteacherId();

	List<Integer> getCourseIdByTId(int id);

	List<Integer> getbanjiIdByTId(int id);

	List<Integer> getBanjisByTidCid(int tid, int cid);

	List<Integer> getCidByBanhao(int banhao);

	List<Integer> getTidByBanhao(int banhao);

	String getCourseNameByTidCid(Integer integer, Integer integer2);

	List<Courseteacher> getAllBybanhao(int banhao);

	void deleteteacourseByTid(int id);

	void deletecourseByCid(int id);

	Integer getIdByWeekAndJieTc(String week, String jie, int tc);

	List<Courseteacher> getAllByTid(int tid);

	List<Courseteacher> getAllBybanhao1(int banhao);

	Integer getIdByWeekAndJie(String week, String jie,int ban1);

	List<Courseteacher> getAllByTidCid(int tid, Integer integer);

	List<Integer> getIdByTidCid(int tid, int cident);

	Courseteacher getAllById(Integer integer);

	List<Courseteacher> getAllBcodeCid(Integer integer, int banhao);

	List<Integer> getTidByCid(int cid);

	List<Courseteacher> getAllDistincBycid(int id);

	void UpdateTeacher(int id, String tname);








}
