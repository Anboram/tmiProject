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
}
