package com.koreait.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.koreait.domain.UserDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
//	@Test
//	public void joinTest() {
//		UserDTO user = new UserDTO();
//		user.setUserid("testid");
//		user.setUserpw("testpw");
//		user.setUsername("testname");
//		
//		boolean result = 1 == mapper.join(user);
//		log.info("Result : "+result);
//	}
	
	@Test
	public void loginTest() {
		UserDTO loginUser = mapper.login("testid", "testpw");
		log.info(loginUser);
	}
}













