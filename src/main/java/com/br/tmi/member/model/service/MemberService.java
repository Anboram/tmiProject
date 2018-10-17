package com.br.tmi.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.tmi.member.model.dao.MemberDao;
import com.br.tmi.member.model.vo.MemberVo;

@Service
public class MemberService {
	
	@Autowired
	MemberDao memberdao;

	public MemberVo selectEmail(MemberVo member) {
		return memberdao.selectEmail(member);
	}

	public int insertMember(MemberVo member) {
		return memberdao.insertMember(member);
	}

	public MemberVo selectMember(MemberVo member) {
		return memberdao.selectMember(member);
	}

	/*public MemberVo memberVerify(MemberVo member) {
		return memberdao.updateVerify(member);
	}*/


}
