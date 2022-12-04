package com.koreait.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.domain.UserDTO;
import com.koreait.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {
	
	@Setter(onMethod_ = @Autowired)
	private UserService service;
	//회원가입 페이지로 이동 - GET - join.jsp
	//회원가입 데이터 처리 - POST - home.jsp
	//로그인 페이지로 이동 - GET - login.jsp
	//로그인 데이터 처리 - POST - home.jsp
	//로그아웃 - GET - home.jsp
	
//	@GetMapping("join")
//	public void join() {}
//	
//	@GetMapping("login")
//	public void login() {}
	@GetMapping({"join","login"})
	public void replace() {}
	
	@PostMapping("join")
	public String join(UserDTO user, HttpServletResponse resp) {
		if(service.join(user)) {
			Cookie joinid = new Cookie("joinid",user.getUserid());
			joinid.setMaxAge(300);
			resp.addCookie(joinid);
		}
		return "redirect:/";
	}
	
	@PostMapping("login")
	public String login(String userid, String userpw, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserDTO loginUser = service.login(userid, userpw);
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser.getUserid());
		}
		return "home";
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "home";
	}
	
}








