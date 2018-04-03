package com.cn.service;

import java.util.List;

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
public interface VideoService {

	List<Video> getAll();

	void addOne(String name, String introduce, String personname, String realpath, 
			String picname,String filecname,String filename,String size);

	void deleteById(int ids);

	Video getOneBytime();
}
