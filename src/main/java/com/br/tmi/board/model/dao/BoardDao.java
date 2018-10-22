package com.br.tmi.board.model.dao;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.br.tmi.board.model.vo.BoardReplyVo;
import com.br.tmi.board.model.vo.BoardVo;

@Repository
public class BoardDao {
	
	@Autowired
	public SqlSessionTemplate sqlSession;

	public List<BoardVo> selectDateBoard(String today) {
		return sqlSession.selectList("BoardMapper.selectDateBoard", today);
	}

	public List<BoardVo> selectNoBoard(int q_no) {
		return sqlSession.selectList("BoardMapper.selectNoBoard",q_no);
	}

	public int insertReply(BoardReplyVo reply) {
		return sqlSession.insert("BoardMapper.insertReply", reply);
	}

	public List<BoardReplyVo> selectNoReply(int a_q_no) {
		return sqlSession.selectList("BoardMapper.selectNoReply", a_q_no);
	}

}
