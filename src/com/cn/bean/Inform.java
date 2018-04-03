package com.cn.bean;

import java.io.Serializable;
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
public class Inform implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7886861820470779649L;
	private Date infordate;//通告时间
	private String title;//通告标题
	private String content;//通告内容
	private String writer;//通告作者
	
	
	public Inform() {
		super();
	}
	public Inform(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}
	public Date getInfordate() {
		return infordate;
	}
	public void setInfordate(Date infordate) {
		this.infordate = infordate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private int id;
}
