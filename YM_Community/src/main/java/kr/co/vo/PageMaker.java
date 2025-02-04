package kr.co.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int startPage; // 표시되는 페이지 번호 중 첫번째 번호
	private int endPage; // 표시되는 페이지 번호 중 마지막 번호
	private int totalCount; // 전체 게시물 수
	private int totalPage; //전체 페이지
	private boolean prev; // 이전 버튼을 위한 변수
	private boolean next; // 다음 버튼을 위한 변수
	private int displayPageNum = 5; // 한 번에 표시할 페이징 번호의 개수
	private Criteria criteria;
	
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	
	public int getTotalPage() {
		return totalPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	private void calcData() {
		
		// 표시되는 페이지 번호 중 마지막 번호
		endPage = (int) (Math.ceil(criteria.getPage() / (double)displayPageNum) * displayPageNum);
		
		// 표시되는 페이지 번호 중 첫번째 번호
		startPage = (endPage - displayPageNum) + 1;
		totalPage = (int)(Math.ceil(totalCount / (double)criteria.getPerPageNum()));
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		prev = startPage ==1?false:true;
		next = endPage * criteria.getPerPageNum() >= totalCount?false:true;
	}
	
	// myPage 게시판에 URL 식별을 위한 uriComponent 추가
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder
				.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", criteria.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
	}
	
	// 검색 기능이 포함된 Board list에 필요한 uri Component 추가
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder
				.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", criteria.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria)criteria).getSearchType())
				.queryParam("keyword", encoding(((SearchCriteria)criteria).getKeyword()))
				.build();
		
		return uriComponents.toUriString();
	}
	
	// 기본값 인코딩 메소드
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length()==0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(keyword,"UTF-8");
		} catch(UnsupportedEncodingException e) {
			return "";
		}
	}
}