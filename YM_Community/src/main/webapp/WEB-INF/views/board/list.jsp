<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/list.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <header id="header">
        <nav class="gnb-menu">
            <a href="/member/home">Home</a>
            <a href="list">Community</a>
            <a href="">Archive</a>
            <a href="">Contact</a>
        </nav>
        <c:if test="${member!=null}">
	        <div class="right-side">
	        	<label>${member.userName}님 환영합니다!</label>
	            <button id="btn-mypage" type="button">My Page</button>
	            <button id="btn-out" type="button">LogOut</button>
	        </div>
        </c:if>
    <script>
        $(document).ready(function() {
			$("#btn-out").on("click",function() {
				if(confirm("로그아웃하시겠습니까?")) {
					location.href="/member/logout";
					}
				})
				
			$("#btn-mypage").on("click",function() {
					location.href="/member/myPage";
				})
           })
           
    </script>
    
    </header>
    <main class="main">
            <div class="list">
                <div class="list-title">
                    <img src="/resources/images/coffee.png">
                    <h1>Community</h1>
                </div>

            <form class="table-form">
                        <fieldset>
                            <select name="searchType">
                                <option value="t"<c:out value="${Scriteria.searchType == null || Scriteria.searchType eq 't' ? 'selected':''}"/>>제목</option>
                                <option value="w"<c:out value="${Scriteria.searchType eq 'w' ? 'selected':''} }" />>작성자</option>
                            </select>
                            <input type="text" name="keyword" id="keywordInput" autocomplete=off value="${Scriteria.keyword}"/>
                            <input id ="search-btn" class="btn" type="submit" value="검색" />
                            <button id="write-btn" class="btn" type="button">글쓰기</button>
                            <script>
                                	$('#search-btn').click(function() {
                                    		self.location = "list" + 
                                    		'${pageMaker.makeQuery(1)}' + 
                                    		"&searchType=" + $("select option:selected").val() + 
                                    		"&keyword=" + encodeURIComponent($('#keywordInput').val());
                                    	})
                                    	
                                    $("#write-btn").click(function() {
	                                	location.href="write";
	                                })
                            </script>
                        </fieldset>
             </form>
					
                <table class="table">
                    <thead>
                        <tr>
                            <th class="w60">번호</th>
                            <th class="expand">제목</th>
                            <th class="w100">작성자</th>
                            <th class="w100">작성일</th>
                            <th class="w60">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="list">
                        <tr>
                            <td><c:out value="${list.bno}" /></td>
                            <td><a href="/board/detail?bno=${list.bno}&page=${Scriteria.page}&perPageNum=${Scriteria.perPageNum}&searchType=${Scriteria.searchType}&keyword=${Scriteria.keyword}">
                            <c:out value="${list.title}" /></a></td>
                            <td><c:out value="${list.writer}" /></td>
                            <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" /></td>
                            <td><c:out value="${list.hit}" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="page-view">
                    <div><span class="text-bold">${Scriteria.page}</span> / ${pageMaker.totalPage} pages</div>
                </div>
            </div>
            
            <div class="page-move">
                <ul>
                	<c:if test="${pageMaker.prev}">
                		<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
                	</c:if>
                	
                	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
                    	<li><a class="text-${(Scriteria.page==idx)?'bold':''}" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
                    </c:forEach>
                    
                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>  
                    </c:if>
                </ul>
            </div>
    </main>
</body>
</html>