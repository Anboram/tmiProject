package com.br.tmi.member.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberVo {
	private int m_no; 
	private String m_name;
	private String m_email;
	private String m_pwd;
	private Date m_enrolldate;
	private Date m_connectiondate;
	
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public Date getM_enrolldate() {
		return m_enrolldate;
	}

	public void setM_enrolldate(Date m_enrolldate) {
		this.m_enrolldate = m_enrolldate;
	}

	public Date getM_connectiondate() {
		return m_connectiondate;
	}

	public void setM_connectiondate(Date m_connectiondate) {
		this.m_connectiondate = m_connectiondate;
	}

	public MemberVo(){}

	public MemberVo(int m_no, String m_name, String m_email, String m_pwd, Date m_enrolldate, Date m_connectiondate) {
		super();
		this.m_no = m_no;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_enrolldate = m_enrolldate;
		this.m_connectiondate = m_connectiondate;
	}

	@Override
	public String toString() {
		return "MemberVo [m_no=" + m_no + ", m_name=" + m_name + ", m_email=" + m_email + ", m_pwd=" + m_pwd
				+ ", m_enrolldate=" + m_enrolldate + ", m_connectiondate=" + m_connectiondate + "]";
	}
	
	
}
