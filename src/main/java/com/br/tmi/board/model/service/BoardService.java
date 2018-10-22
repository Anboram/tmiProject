package com.br.tmi.board.model.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.tmi.board.model.dao.BoardDao;
import com.br.tmi.board.model.vo.BoardReplyVo;
import com.br.tmi.board.model.vo.BoardVo;

@Service
public class BoardService {
	
	@Autowired
	BoardDao boardDao;

	public List<BoardVo> selectDateBoard(String today) {
		return boardDao.selectDateBoard(today);
	}

	public List<BoardVo> selectNoBoard(int q_no) {
		return boardDao.selectNoBoard(q_no);
	}

	public int insertReply(BoardReplyVo reply) {
		return boardDao.insertReply(reply);
	}

	public List<BoardReplyVo> selectNoReply(int a_q_no) {
		return boardDao.selectNoReply(a_q_no);
	}

	

}
