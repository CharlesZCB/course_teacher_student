package com.cn.bean;

import java.io.Serializable;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class ListCourseTeacher implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7513068866194070385L;
	private Course course;
	private String tname;
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public String getTname() {
		return tname;
	}
	public ListCourseTeacher() {
		super();
	}
	public ListCourseTeacher(Course course, String tname) {
		super();
		this.course = course;
		this.tname = tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}

}
