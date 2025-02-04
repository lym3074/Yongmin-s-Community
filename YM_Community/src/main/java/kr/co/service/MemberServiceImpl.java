package kr.co.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.co.dao.MemberDAO;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO dao;
	
	@Override
	public void join(MemberVO vo) throws Exception {
		dao.join(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo, HttpSession session) throws Exception {
		
		MemberVO login = dao.login(vo);
		if(login==null) {
			return null;
		}
		else {
			session.setAttribute("member", login);
			return login;
		}
	}
	
	@Override
	public List<BoardVO> memberPosting(Criteria criteria, HttpSession session) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		String userId = vo.getUserId();
		int rowStart = criteria.getRowStart();
		int rowEnd = criteria.getRowEnd();
		
		map.put("userId",userId);
		map.put("rowStart", rowStart);
		map.put("rowEnd", rowEnd);
		
		return dao.memberPosting(map);
	}
	
	@Override
	public int listCount(HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		return dao.listCount(vo.getUserId());
	}
	
	@Override
	public void delAll(int[] delNums) throws Exception {
			dao.delAll(delNums);
	}
	
}
