package com.br.tmi.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.br.tmi.member.model.vo.MemberVo;

@Repository
public class MemberDao {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	public MemberVo selectEmail(MemberVo member) {
		return sqlSession.selectOne("MemberMapper.selectEmail", member);
	}

	public int insertMember(MemberVo member) {
		return sqlSession.insert("MemberMapper.insertMember", member);
	}

}
