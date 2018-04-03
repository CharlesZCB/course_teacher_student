package com.cn.service;

import java.sql.Timestamp;
import java.util.List;

import com.cn.bean.Inform;
import com.cn.bean.News;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface NewsService {

	List<News> getAll();

	void insertone(String title, String content, String editor,int state, String imageaddress,String image);



	void deletes(int id);

	News getById(int id);

	void ChangeStatueById(int id,int changeStatue);

	int getStatueById(int ids);

	List<News> getNewsFiveByTime();

	void insertTime(Timestamp time1,int ids);

	News getNewsById(int id);


}
