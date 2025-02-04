package kr.co.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.MemberVO;

public interface MemberService {

	public void join(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo, HttpSession session) throws Exception;
	
	public int listCount(HttpSession session) throws Exception;
	
	public List<BoardVO> memberPosting(Criteria criteria, HttpSession session) throws Exception;
	
	public void delAll(int[] delNums) throws Exception;
}
