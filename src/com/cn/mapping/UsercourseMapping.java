package com.cn.mapping;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.ibatis.annotations.Param;

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
public interface UsercourseMapping {

	void insertScore(@Param("cid")int cid, @Param("uid")String uid,
			@Param("score")int score,@Param("uname")String uname,@Param("cname")String cname,
			@Param("ctime")int ctime,@Param("bid")int bid,
			@Param("nian")String nian,@Param("xueqi")String xueqi);

	List<Integer> getCidByScode(@Param("scode")String scode);

	List<Usercourse> getAllByScode(@Param("scode")String scode);

	List<Usercourse> getAll();

    String getAllByBid(@Param("classid")int classid);

	void getAllById1(Map<String, Object> params);

	String getAllById2(String string, Map<String, Integer> param1);

	List<LinkedHashMap> GetScoresByBid(int classid);

	List<LinkedHashMap> GetScoresByBidAndXueqi(@Param("classid")int classid, @Param("string")String string, 
			@Param("string2")String string2);

	List<Usercourse> getAllByuidAndXueqi(@Param("scode")String scode,@Param("nian") String nian,@Param("xuedu") String xuedu);

	List<Integer> getIdByXueqiAndNian(@Param("xueqi")String xueqi,@Param("nian") String nian,@Param("bid")int bid
			,@Param("cid")int cid);

	String getCnameByCidBid(@Param("id")int id,@Param("bid") int bid);

	void updateBycode(@Param("scode")String scode,@Param("name") String name);

	List<Usercourse> getScoreByCidBid(@Param("cid")int cid,@Param("bid") int bid);

	void deleteBycid(@Param("id")int id);

	List<Usercourse> getAllBycid(@Param("cid")int cid);

	int getTotalnumberBycidbid(@Param("cid")int cid, @Param("bid")int bid);




}
