package com.cn.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Video;
import com.cn.mapping.VideoMapping;
import com.cn.service.VideoService;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
@Service
public class VideoServiceImp implements VideoService {

	@Autowired
	VideoMapping videoMapping;
	@Override
	public List<Video> getAll() {
		return videoMapping.getAll();
	}
	@Override
	public void addOne(String name, String introduce, String personname, String realpath, String picname,String filename,String videoname,String size) {
		videoMapping.addOne(name,introduce,personname,realpath,picname,filename,videoname,size);
		
	}
	@Override
	public void deleteById(int ids) {
		videoMapping.deleteById(ids);
		
	}
	@Override
	public Video getOneBytime() {
		// TODO Auto-generated method stub
		return videoMapping.getOneBytime();
	}


}
