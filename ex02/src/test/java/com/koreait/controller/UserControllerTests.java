package com.koreait.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
@WebAppConfiguration
@Log4j
public class UserControllerTests {
	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext wac;
	
	//가짜 MVC
	//마치 브라우저에서 사용하는 것처럼 만들어서 Controller를 실행해 볼 수 있다.
	private MockMvc mvc;
	
	//org.junit.Before
	//적용된 메소드들을 모든 테스트 전에 한번씩 실행한다.
	@Before
	public void setup() {
		mvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
//	@Test
//	public void replaceTest() throws Exception {
//		//mvc.perform(요청) : 해당 요청대로 mockMVC가 수행
//		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.get("/user/join"))
//		.andReturn()
//		.getModelAndView();
//		
//		log.info(mav.getViewName());
//		log.info(mav.getModelMap());
//	}
	
//	@Test
//	public void joinTest() throws Exception {
//		//								요청제작자				post방식으로	/user/join으로 보내는 요청을 생성
//		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/user/join")
//				.param("userid", "apple")											//요청을 보낼 때 파라미터 추가해서 요청 보내기
//				.param("userpw","abcd1234")
//				.param("username", "김사과")
//		)
//		.andReturn()																//반환된 결과 : 응답(뷰, 모델 등을 포함)
//		.getModelAndView();															//응답에서 모델과 뷰를 포함하고 있는 타입의 객체 받기
//		
//		log.info(mav.getViewName());
//		log.info(mav.getModelMap());
//	}
	
//	@Test
//	public void loginTest() throws Exception {
//		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/user/login")
//				.param("userid", "apple")
//				.param("userpw", "abcd1234")
//		)
//		.andReturn()
//		.getModelAndView();
//		
//		log.info(mav.getViewName());
//		log.info(mav.getModelMap());
//	}
	
	@Test
	public void logoutTest() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.get("/user/logout"))
		.andReturn()
		.getModelAndView();
		
		log.info(mav.getViewName());
	}

}



















