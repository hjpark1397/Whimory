package com.test.whimory.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.user.model.dao.UserDao;
import com.test.whimory.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	//Dao 연결
	@Autowired
	private UserDao userDao;
	
	//로그인 기능 수행
	@Override
	public User selectLogin(User user) {
		return userDao.selectLogin(user);
	}
	
	//회원 정보 찾기 
	@Override
	public User selectUser(String user_id) {
		return userDao.selectUser(user_id);
	}
	
	//회원 목록
	@Override
	public ArrayList<User> selectList(){
		return userDao.selectList();
	}

}
