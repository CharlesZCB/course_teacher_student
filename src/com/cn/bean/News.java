package com.cn.bean;

import java.io.Serializable;
import java.util.Date;

import net.sf.jsqlparser.expression.DateTimeLiteralExpression.DateTime;


/**
 * ：新闻部分
 * @作者  张昌北
 * @创建时间 2018年1月23日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class News implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6022789714762802357L;


	@Override
	public String toString() {
		return "News [id=" + id + ", showoff=" + showoff + ", title=" + title + ", content=" + content + ", editor="
				+ editor + ", image=" + image + ", editdate=" + editdate + ", imageaddress=" + imageaddress + "]";
	}
	public News() {
		super();
	}
	public News(int id, int showoff, String title, String content, String editor, String image, Date editdate,
			String imageaddress) {
		super();
		this.id = id;
		this.showoff = showoff;
		this.title = title;
		this.content = content;
		this.editor = editor;
		this.image = image;
		this.editdate = editdate;
		this.imageaddress = imageaddress;
	}
	private int id;
	private int showoff;//是否在滚动栏目中显示
	private String title;//标题
	private String content; //内容
	private String editor; //编辑者
	private DateTime changetime;
	
	
	public DateTime getChangetime() {
		return changetime;
	}
	public void setChangetime(DateTime changetime) {
		this.changetime = changetime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getShowoff() {
		return showoff;
	}
	public void setShowoff(int showoff) {
		this.showoff = showoff;
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
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getEditdate() {
		return editdate;
	}
	public void setEditdate(Date editdate) {
		this.editdate = editdate;
	}
	public String getImageaddress() {
		return imageaddress;
	}
	public void setImageaddress(String imageaddress) {
		this.imageaddress = imageaddress;
	}
	private String image; //图片
	private Date   editdate; //编辑日期
	private String imageaddress;

}
