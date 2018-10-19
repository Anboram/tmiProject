package com.br.tmi.board.model.dao;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.br.tmi.board.model.vo.BoardVo;

@Repository
public class BoardDao {
	
	@Autowired
	public SqlSessionTemplate sqlSession;

	public List<BoardVo> selectDateBoard(String today) {
		return sqlSession.selectList("BoardMapper.selectDateBoard", today);
	}

}
