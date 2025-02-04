<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <title>Hello YongminLand</title>
    <link rel="stylesheet" href="/resources/css/update.css">
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
        </header>
        <script>
			$(document).ready(function() {
				$("#btn-mypage").on("click",function(){
					location.href="/member/myPage";
					})

				$("#btn-out").on("click",function(){
					if(confirm("로그아웃하시겠습니까?")){
						location.href="/member/logout";
						}
					})
			})
        </script>


        <main>
            <div class="list-title">
                <img src="/resources/images/coffee.png">
                <h1>Community</h1>
            </div>
            <form role="form" method="post" action="/board/update" >
            <input type="hidden" name="bno" value="${update.bno}"/>
            <div class="detail-table">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td colspan="3"><input type="text" id="title" name="title" onfocus="this.select()"
                                value="${update.title}" autofocus autocomplete=off></td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td colspan="3"><fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td class="align-center">${update.writer}</td>
                            <th>조회수</th>
                            <td class="align-center">${update.hit}</td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3"></td>
                        </tr>
                        <tr class="content">
                            <td colspan="4"><textarea id="content" name="content">${update.content}</textarea></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="update-bottom-side">
                <button type="submit" id="btn-mod" >수정</button>
                <a class="btn-text btn-cancel" href="javascript:history.back();">취소</a>
            </div>
			</form>
        </main>
    </body>
</html>