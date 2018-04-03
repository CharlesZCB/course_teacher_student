package com.cn.mapping;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

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
public interface NewsMapping {

	List<News> getalls();

	void addone(@Param("title")String title,
			    @Param("content")String content, 
			    @Param("editor")String editor,
			    @Param("state")int state, 
			    @Param("imageaddress")String imageaddress,
			    @Param("image") String image
			    );

	void deleted(@Param("id")int id);

	News selectById(int id);


	void chageStatueById(@Param("id")int id, @Param("changeStatue")int changeStatue);

	int getStatueById(int ids);

	List<News> getNewsFive();

	void insertTime(@Param("time1")Timestamp time1,@Param("ids")int ids);

	News getNewsById(@Param("id")int id);

	

}
