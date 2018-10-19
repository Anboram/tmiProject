package com.br.tmi.board.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardVo {
	
	private int q_no;
	private String q_question;
	private Date q_date;
	
	
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_question() {
		return q_question;
	}
	public void setQ_question(String q_question) {
		this.q_question = q_question;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	
	public BoardVo(){}
	
	public BoardVo(int q_no, String q_question, Date q_date) {
		super();
		this.q_no = q_no;
		this.q_question = q_question;
		this.q_date = q_date;
	}
	@Override
	public String toString() {
		return "BoardVo [q_no=" + q_no + ", q_question=" + q_question + ", q_date=" + q_date + "]";
	}
	
	
	
}
