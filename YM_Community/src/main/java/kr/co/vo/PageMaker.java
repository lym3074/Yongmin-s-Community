package kr.co.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;
	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPage;
	// 표시되는 페이지 번호 중 마지막 번호
	private int endPage;
	//전체 페이지
	private int totalPage;
	private boolean prev;
	private boolean next;
	
	// 한 번에 표시할 페이징 번호의 개수
	private int displayPageNum = 5;
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
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder
				.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", criteria.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
	}
	

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