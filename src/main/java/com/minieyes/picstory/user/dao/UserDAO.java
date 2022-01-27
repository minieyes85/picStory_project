package com.minieyes.picstory.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.minieyes.picstory.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("userName") String userName,
			@Param("email") String email
			);
	
	public User selectUser(
			@Param("loginId") String loginId,
			@Param("password") String password
			);
	
	public int updateUser(
			@Param("userId") int userId,
			@Param("password") String password,
			@Param("userName") String userName,
			@Param("email") String email);
	
	public User selectLoginId(@Param("loginId") String loginId);
}
