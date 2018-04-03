package com.cn.mapping;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

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
public interface UserMapping {

	public List<User> list();


	public void delete(int id);


	public User getItem(@Param("id")int id);


	public void insertUser(
			               @Param("name")String name, 
			               @Param("password")String password,
			               @Param("email")String email,
			               @Param("birth")Date birth,
			               @Param("head")String head,
			               @Param("filename")String filename,
			               @Param("s_county")String s_county,
			               @Param("s_province")String s_province,
			               @Param("s_city")String s_city,
			               @Param("scode")String scode,
			               @Param("bannum")int bannum,
			               @Param("jibie")String jibie,
			               @Param("enge")String enge,
			               @Param("sex")String sex,
			               @Param("ident")String ident);
	


	public List<Classroom> getAllclassroom();


	public List<User> getAllByclassId(@Param("id")int id);


	public String getNameById(@Param("binder")int binder);


	public String getScodeByID(@Param("binder")int binder);


	public String getEmailById(@Param("binder")int binder);


	public String getBirthById(@Param("binder")int binder);


	public String getBanmingById(@Param("binder")int binder);


	public String getNianjiByID(@Param("binder")int binder);


	public int getBanhaoById(@Param("binder")int binder);


	public void Update(@Param("id")int id, @Param("name")String name, @Param("banming")String banming,@Param("banhao") int banhao,@Param("jibie") String jibie,@Param("email") String email);


	public String getNameByCodeu(@Param("uid")String uid);


	public String getNameByCodeAndPass(@Param("scode")String scode, @Param("password")String password);


	public Integer getIdByNameAndpass(@Param("scode")String scode,@Param("password") String password);


	public String getSexById(@Param("id")int id);

/////////////
	public String getPasswordById(int id);


	public String getImageById(int id);


	public String getProvinceById(int id);


	public String getCountyById(int id);


	public String getCityById(int id);


	public Date getBirthsById(int id);


	public void UpdatePassById(@Param("id")int id,@Param("password") String newpass);

	
	public List<User> getStuBybanhao(@Param("banhao")int banhao);


	public int getSubCode(@Param("banhao")String banhao);


	public int getSnumBybcode(@Param("integer")Integer integer);


	public String getJIbieByUid(@Param("stuid")Integer stuid);


	public List<User> getAllByBanhao(@Param("banhao")int banhao);


	public int getIdByscode(@Param("scode")String scode);


	public Integer getIdByscodeIdent(@Param("ident")String ident, @Param("scode")String scode);




	


}
