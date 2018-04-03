package com.cn.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.bean.Video;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface VideoMapping {

	List<Video> getAll();

	void addOne(@Param("name")String name,
			    @Param("introduce") String introduce,
			    @Param("personname")String personname,
			    @Param("realpath") String realpath,
			    @Param("picname")String picname,
			    @Param("filename")String filename,
			    @Param("videoname")String videoname,
			    @Param("size")String size);

	void deleteById(@Param("ids")int ids);

	Video getOneBytime();
}
