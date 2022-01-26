package com.minieyes.picstory.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minieyes.picstory.common.EncryptUtils;
import com.minieyes.picstory.user.dao.UserDAO;
import com.minieyes.picstory.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String userName, String email) {
		// 비밀번호 암호화
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encPassword, userName, email);
	}
	
	public User findUser(String loginId, String password) {
		
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encPassword);
	}
}
