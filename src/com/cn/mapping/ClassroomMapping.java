package com.cn.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

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
public interface ClassroomMapping {

	List<Classroom> getAll();

	void deletes(int id);

	List<String> getallTeachername();

	void insertclass(@Param("jibie")String jibie, @Param("classname")String classname,@Param("daoyuan") String daoyuan, 
			@Param("num")int num,@Param("tcode")String tcode);

	

	String getClassRoomById(int id);

	String getTeBYId(int id);

	void UpdateByDaoyuan(@Param("daoyuan")String daoyuan,@Param("cnum")int cnum,@Param("tname")String tname);

	int getCode(int id);

	List getSNum();

	void insertNum(@Param("parseInt")int parseInt,@Param("i")int i);

	List getAllBanhao();

	Classroom getClassById(@Param("id")int id);

	String getClassNameByBanhao(@Param("ban1")int ban1);

	String getJibieByBanhao(@Param("ban2")int ban2);

	List<Classroom> getJibieNoDistinct();

	List<String> getNameByjibie(@Param("jibie")String jibie);

	List<Integer> getBanhaoByNameJibie(@Param("banming")String banmig,@Param("jibie")String jibie);

	Classroom getClassRoomsById(@Param("integer")Integer integer);

	List<Classroom> getClassByTcode(@Param("tcode")String tcode);

	Classroom getClassBYCode(Integer integer);

	int getBanhaoById(int classid);

	int getSnumByBanhao(@Param("banhao")String banhao);

	void updateSnumBybanhao(@Param("snum")int snum,@Param("banhao")String banhao);

	List<Integer> getBahaoByTcode(@Param("tcode")String tcode);

	void UpdateTnameByTcode(@Param("tname")String tname,@Param("tcode") String tcode);

	List<Classroom> getAllByJibie(@Param("jibie")String jibie);

	Integer getIdBycode(@Param("integer")Integer integer);





}
