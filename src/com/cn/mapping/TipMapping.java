package com.cn.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.bean.Tip;

/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface TipMapping {

	void insertOne(@Param("tid")int tid,@Param("cname") String cname,
			@Param("banhao")int banhao, @Param("banming")String banming,
			@Param("i")int i);

	List<Tip> getMessageByTid(@Param("tid")int tid);

	void updateStatue(@Param("tid")int tid,@Param("cid") int cid, @Param("banhao")int banhao);

	void updateStatueByid(@Param("id")int id);

	void delete(@Param("id")int id);


}
