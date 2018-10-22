package com.br.tmi.board.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardReplyVo {
	
	private int a_no;
	private int a_m_no;
	private int a_q_no;
	private String a_answer;
	private Date a_writedate;
	private char a_delflag;
	private char a_privateflag;
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public int getA_m_no() {
		return a_m_no;
	}
	public void setA_m_no(int a_m_no) {
		this.a_m_no = a_m_no;
	}
	public int getA_q_no() {
		return a_q_no;
	}
	public void setA_q_no(int a_q_no) {
		this.a_q_no = a_q_no;
	}
	public String getA_answer() {
		return a_answer;
	}
	public void setA_answer(String a_answer) {
		this.a_answer = a_answer;
	}
	public Date getA_writedate() {
		return a_writedate;
	}
	public void setA_writedate(Date a_writedate) {
		this.a_writedate = a_writedate;
	}
	public char getA_delflag() {
		return a_delflag;
	}
	public void setA_delflag(char a_delflag) {
		this.a_delflag = a_delflag;
	}
	public char getA_privateflag() {
		return a_privateflag;
	}
	public void setA_privateflag(char a_privateflag) {
		this.a_privateflag = a_privateflag;
	}
	
	public BoardReplyVo(){}
	
	public BoardReplyVo(int a_no, int a_m_no, int a_q_no, String a_answer, Date a_writedate, char a_delflag,
			char a_privateflag) {
		super();
		this.a_no = a_no;
		this.a_m_no = a_m_no;
		this.a_q_no = a_q_no;
		this.a_answer = a_answer;
		this.a_writedate = a_writedate;
		this.a_delflag = a_delflag;
		this.a_privateflag = a_privateflag;
	}
	@Override
	public String toString() {
		return "BoardReplyVo [a_no=" + a_no + ", a_m_no=" + a_m_no + ", a_q_no=" + a_q_no + ", a_answer=" + a_answer
				+ ", a_writedate=" + a_writedate + ", a_delflag=" + a_delflag + ", a_privateflag=" + a_privateflag
				+ "]";
	}
	
	
	
}
