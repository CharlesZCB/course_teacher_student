package com.cn.bean;

import java.util.Date;

/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class Video {
	private String size;//视频大小
    private String time;//视频时长
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	private  int id;
	private String videoname;//原视频的名称
	private String realpath;//被下载的地址
	private String pic;//海报图名字
	private String personname;//上传者姓名
	private String name;//片名
	private String introduce;//简介
	private Date dateTime;//上传时间
	private String picaddress;//上传地址
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getVideoname() {
		return videoname;
	}
	public void setVideoname(String videoname) {
		this.videoname = videoname;
	}
	public String getPicaddress() {
		return picaddress;
	}
	public void setPicaddress(String picaddress) {
		this.picaddress = picaddress;
	}
	public String getRealpath() {
		return realpath;
	}
	public void setRealpath(String realpath) {
		this.realpath = realpath;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	public String getPersonname() {
	return personname;
}
public void setPersonname(String personname) {
	this.personname = personname;
}
	public Video() {
		super();
	}
	public Video(int id, String name, String introduce, Date dateTime) {
		super();
		this.id = id;
		this.name = name;
		this.introduce = introduce;
		this.dateTime = dateTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
}
