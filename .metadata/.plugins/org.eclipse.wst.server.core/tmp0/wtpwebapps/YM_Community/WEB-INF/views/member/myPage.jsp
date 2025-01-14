<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Hello YongminLand</title>
	    <link rel="stylesheet" href="/resources/css/mypage.css">
	    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	    <script src="/resources/js/header.js"></script>
    </head>
    <body>
        <header id="header">
            <nav class="gnb-menu">
            <a href="home">Home</a>
            <a href="/board/list">Community</a>
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
        </header>
    
        <main>
            <div class="mypage-title">
                <img src="/resources/images/mypage.png">
                <h1>My Page</h1>
            </div>

            <table class="info-table">
                <thead>
                    <tr>
                        <th>INFO</th>
                        <td colspan="3"> </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>User ID</th>
                        <td class="text-align-left text-indent text-strong text-orange">${member.userId}</td>
                        <th>Name</th>
                        <td class="text-align-left text-indent">${member.userName }</td>
                    </tr>
                    <tr>
                        <th>e-mail</th>
                        <td>${member.userEmail }</td>
                        <th>join date</th>
                        <td><fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd" /></td>
                    </tr>
                </tbody>
            </table>
			
			<form action="deleteAll" method="post">
	            <table class="writen-table">
	                <thead>
	                    <tr>
	                        <th class="posting" colspan="2">POSTING LIST</th>
	                    </tr>
	                    <tr>
	                        <th class="w60">번호</th>
	                        <th class="expand">제목</th>
	                        <th class="w100">작성자</th>
	                        <th class="w100">작성일</th>
	                        <th class="w60">조회수</th>
							<th class="w40">삭제</th>
	                    </tr>
	                </thead>
	                
	                <tbody>
		                <c:forEach items="${memberPosting}" var="memberPosting">
			                <tr>
			                      <td><c:out value="${memberPosting.bno }" /></td>
			                      <td><a href="/board/detail?bno=${memberPosting.bno}">
			                      <c:out value="${memberPosting.title }" /></a></td>
			                      <td><c:out value="${memberPosting.writer }" /></td>
			                      <td><fmt:formatDate value="${memberPosting.regdate }" pattern="yyyy-MM-dd" /></td>
			                      <td><c:out value="${memberPosting.hit}" /></td>
								  <td><input type="checkbox" name="del-num" value="${memberPosting.bno}"></td>
			                </tr>
		                </c:forEach>
	                </tbody>
	            </table>
	
	            <div class="bottom-button">
	                <input type="hidden" name = "nos" value = "${nos}">
	                <input type="submit" id="del-all" class="btn-text" name = "cmd" value="삭제">
	            </div>
	            <script>
					$("#del-all").on("click", function() {
						if(confirm("선택한 게시물을 전부 삭제합니다."))
							return;
						else
							return false;
						})
	            </script>
			</form>
			
            <div class="page-move">
                <ul>
                	<c:if test="${pageMaker.prev}">
                		<li><a href="myPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
                	</c:if>
                	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
                    	<li><a class="text-${(criteria.page==idx)?'bold':''}" href="myPage${pageMaker.makeQuery(idx)}">${idx}</a></li>
                    </c:forEach>
                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                    	<li><a href="myPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>  
                    </c:if>
                </ul>
            </div>
        </main>
    </body>

</html>