package kr.co.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.PageMaker;
import kr.co.vo.SearchCriteria;


@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value="/board/write", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("getWritePage");
	}
	
	// 게시판 글 작성
	@RequestMapping(value="/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception {
		logger.info("write");
		service.write(boardVO);
		return "redirect:/board/list";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("Scriteria") SearchCriteria Scriteria) throws Exception {
		logger.info("list");
		model.addAttribute("list", service.list(Scriteria));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(Scriteria);
		pageMaker.setTotalCount(service.listCount(Scriteria));
		
		model.addAttribute("pageMaker",pageMaker);
		return "board/list";
	}
	
	// detail 페이지 조회
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String read(BoardVO boardVO,@ModelAttribute("Scriteria") SearchCriteria Scriteria, Model model)
					throws Exception {
		logger.info("read");
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("Scriteria", Scriteria);
		model.addAttribute("getPrev",service.getPrev(boardVO.getBno()));
		model.addAttribute("getNext",service.getNext(boardVO.getBno()));
		return "board/detail";
	}
	
	// get updatePage
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model) throws Exception {
		logger.info("updateView");
		model.addAttribute("update",service.read(boardVO.getBno()));
		return "board/update";
	}
	
	// update action
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception {
		service.update(boardVO);
		return "redirect:/board/list";
	}
	
	// delete action
	 @RequestMapping(value="/delete", method=RequestMethod.POST)
	 public String delete(BoardVO boardVO) throws Exception { 
		 logger.info("delete");
		 service.delete(boardVO.getBno());
		 return "redirect:/board/list";
	 }
	 
	
}
