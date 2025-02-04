package kr.co.dao;

import java.util.List;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.SearchCriteria;

public interface BoardDAO {
	
	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// list 조회
	public List<BoardVO> list(SearchCriteria Scriteria) throws Exception;
	
	// list 총 갯수
	public int listCount(SearchCriteria Sciteria) throws Exception;
	
	// detail 조회 
	public BoardVO read(int bno) throws Exception;
	
	// 이전 페이지
	public BoardVO getPrev(int bno) throws Exception;
	
	// 다음 페이지
	public BoardVO getNext(int bno) throws Exception;
	
	// 게시글 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시글 삭제
	public void delete(int bno) throws Exception;
	
	// 조회수 증가
	public void hit(int bno) throws Exception;
}
