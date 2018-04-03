package com.cn.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import com.alibaba.druid.sql.dialect.oracle.ast.stmt.OracleMultiInsertStatement.InsertIntoClause;
import com.cn.bean.Courseteacher;
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
public interface CourseteacherMapping {

	List<Integer> getTeachersList(int ids);

	void insertOne(@Param("tc")int tc, @Param("cid")int cid,@Param("bid")int bid,@Param("ctime")int ctime
			,@Param("tname")String tname,@Param("cname")String cname,
			@Param("week")String week,@Param("jie")String jie,@Param("banming")String banming);


	List<Courseteacher> getAll();

	Courseteacher getTeacherIdIs(@Param("ban1")int ban1,@Param("cid") int cid);

	List<Integer> getAllTeacherId();

	List<Integer> getCourseIdById(int id);

	List<Integer> getroomIdById(@Param("id")int id);

	List<Integer> getBanjisByTidCid(@Param("tid")int tid,@Param("cid") int cid);

	List<Integer> getCidByBanhao(@Param("banhao")int banhao);

	List<Integer> getTidByBanhao(@Param("banhao")int banhao);

	String getCourseNameByTidCid(@Param("integer")Integer integer,@Param("integer2") Integer integer2);

	List<Courseteacher> getAllBybanhao(@Param("banhao")int banhao);

	void deleteteacourseBytid(int id);

	void deleteCourseByCid(int id);

	Integer getIdByWeekjieTc(@Param("week")String week,@Param("jie") String jie,@Param("tc") int tc);

	List<Courseteacher> getAllByTid(int tid);

	List<Courseteacher> getAllBybanhao1(int banhao);

	Integer getIdByWeekAndJie(@Param("week")String week,@Param("jie") String jie,@Param("ban1")int ban1);

	List<Courseteacher> getAllByTidAndCid(@Param("tid")int tid,@Param("integer")Integer integer);

	List<Integer> getIdByTidCId(@Param("tid")int tid,@Param("cident") int cident);

	Courseteacher getAllById(@Param("integer")Integer integer);

	List<Courseteacher> getAllByBcodeCid(@Param("integer")Integer integer, @Param("banhao")int banhao);

	List<Integer> getTidByCid(@Param("cid")int cid);

	Integer getBcodeByTidCid(@Param("cid")int cid,@Param("integer") Integer integer);

	List<Courseteacher> getAllDistinctBycid(@Param("id")int id);

	void Update(@Param("id")int id,@Param("tname") String tname);

	


}
