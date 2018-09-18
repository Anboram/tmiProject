package com.br.tmi.member.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.br.tmi.member.model.service.MemberService;
import com.br.tmi.member.model.vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;

	@RequestMapping("login.do")
	public String login(){
		return "member/memberSelect";
	}
	@RequestMapping("join.do")
	public String join(){
		return "member/memberInsert";
	}
	@RequestMapping("memberInsertForm.do")
	public String memberInsertForm(){
		return "member/memberInsertForm";
	}
	
	@RequestMapping(value="emailCheck.do", produces="application/text; charset=utf-8")
	public @ResponseBody String EmailCheck(String m_email){
		MemberVo member = new MemberVo();
		member.setM_email(m_email);;
		member = memberService.selectEmail(member);
		return member == null ?"ok":"x";
	}
	
	@RequestMapping(value="memberInsert.do")
	public String memberInsert(MemberVo member, Model model, HttpServletRequest request){
		System.out.println(member);
		int result = memberService.insertMember(member);
		model.addAttribute(member);
		return "member/sendEmail.do";
	}
	
	@Autowired
	private JavaMailSender mailSender;
	
	//이메일 인증 발송
	@RequestMapping(value="sendEmail.do")
	public String email(MemberVo member){
		
		System.out.println("이동 완료!");
		String email = "mozleteam@gmail.com";
		String tomail = member.getM_email();
		String title = "TMI 회원가입을 축하합니다.";
		String content = "";
		

	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(email);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
		
		return "index.do";
	}
	
}
