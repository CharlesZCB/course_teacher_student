package com.cn.service;

import java.util.Date;
import java.util.List;

import com.cn.bean.Classroom;
import com.cn.bean.User;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface UserService {

	
	/**
	 * 查询所有目录
	 * @return
	 */
	List<User> getList();
	
	void delete(int id);
	
	
	User getItemById(int id);
	
	void insertone(String name, String password, String email,Date birth,
			String headaddress,String filename
	,String s_county,String s_province,String s_city,String scode,int bannum,String jibie,
	String enge,String sex,String ident);
	
	void Update(int id,String name,String banming,int banhao,String jibie ,String email);

	List<Classroom> getClassRooms();

	List<User> getListByid(int id);//此处的id是classid

	List<User> getListBycode(int banhao);

	String getNameById(int binder);

	String getScodeById(int binder);

	String getEmailById(int binder);

	String getVirthById(int binder);

	String getBanmingById(int binder);

	String getNianjiById(int binder);

	int getBanhaoById(int binder);

	String getNameBycode(String uid);

	String getNameBycode(String scode, String password);

	Integer getIdByNameAndPass(String scode, String password);

	String getSexById(int id);

	String getPassswordById(int id);

	String getImageById(int id);

	String getProvinceById(int id);

	String getCountyById(int id);

	String getCity(int id);

	

	Date getSBirthById(int id);

	void UpdatePassById(int id, String newpass);

	List<User> getStuByBanhao(int banhao);

	int getSubcode(String banhao);

	int getSnumBybcode(Integer integer);

	String getJibieByuid(Integer stuid);

	List<User> getAllByBanhao(int banhao);

	int getIdByscode(String scode);

	Integer getIdByscodeIdent(String ident, String scode);



	
	
	

}
