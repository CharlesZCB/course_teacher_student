package com.cn.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import com.cn.bean.Inform;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface InformMapping {

	void insert(@Param("title")String title, @Param("content")String content,
			@Param("writer")String writer);

	List<Inform> getAll();

	void deletes(@Param("id")int id);

	Inform getInforById(int id);


}
