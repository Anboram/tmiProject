package com.br.tmi.member.controller;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.br.tmi.member.model.service.MemberService;
import com.br.tmi.member.model.vo.MemberVo;
import com.br.tmi.util.MailHandler;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	@Inject
	JavaMailSender mailSender;

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
	public String memberInsert(MemberVo member) throws MessagingException, UnsupportedEncodingException{
		System.out.println(member);
		int result = memberService.insertMember(member);
		if(result>0){
			System.out.println("메일발송");
			System.out.println(member.toString());
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[TMI] 회원가입을 환영합니다.");
			sendMail.setText(new StringBuffer().append("<a href='http://localhost:8081/tmi/memberVerify.do?m_email="+member.getM_email())
			.append("' target='_blenk'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("mozleteam@gmail.com", "tmi");
			sendMail.setTo(member.getM_email());
			sendMail.send();
		}else{
			System.out.println("memberInsert 오류");
		}
		return "redirect:index.do";
	}
	/*
	@RequestMapping(value="memberVerify.do", method=RequestMethod.GET)
	public String verify(MemberVo member){
		System.out.println("이메일 인증 확인");
		member = memberService.memberVerify(member);
		return "index.do";
	}
	*/
}
