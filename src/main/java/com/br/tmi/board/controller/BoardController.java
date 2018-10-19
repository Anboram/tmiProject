package com.br.tmi.board.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.br.tmi.board.model.service.BoardService;
import com.br.tmi.board.model.vo.BoardReplyVo;
import com.br.tmi.board.model.vo.BoardVo;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	//현재날짜 기준으로 365게시판 이동
	@RequestMapping("boardListSelect.do")
	public ModelAndView boardListSelect(ModelAndView mv){
		SimpleDateFormat df = new SimpleDateFormat("MM-dd");

		Date date = new Date();
		String today  = df.format(date);
		
		List<BoardVo> bList = boardService.selectDateBoard(today);
		System.out.println(bList.toString());
		mv.addObject("bList", bList);
		mv.setViewName("board/boardList");
		return mv;
	}
	//날짜 클릭시 해당 날짜 질문으로 이동
	@RequestMapping("selectDateBoard.do")
	public ModelAndView selectDateBoard(String selectDate, ModelAndView mv){
		System.out.println(selectDate);
		List<BoardVo> bList = boardService.selectDateBoard(selectDate);
		System.out.println(bList.toString());
		mv.addObject("bList", bList);
		mv.setViewName("board/boardList");
		
		return mv;
	}
}
