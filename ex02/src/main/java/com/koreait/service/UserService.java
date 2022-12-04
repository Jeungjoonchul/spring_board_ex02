package com.koreait.service;

import com.koreait.domain.UserDTO;

public interface UserService {
	boolean join(UserDTO user);
	UserDTO login(String userid,String userpw);
}
