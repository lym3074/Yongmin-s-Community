<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello YongminLand</title>
    <link rel="stylesheet" href="/resources/css/write.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="/resources/js/header.js"></script>
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
    <c:if test="${member==null}">
    	<script>
			$("#btn-reg").on("click",function() {
				alert("회원만 이용가능합니다. 로그인하십시오.");
				location.href="/member/home";
				})
		</script>
    </c:if>
    <script>
     $("#btn-cancel").on("click",function() {
             location.href="/board/list";
         })
    </script>
    
    <main>
        <div class="list-title">
            <img src="/resources/images/write.png">
            <h1>Write Page</h1>
        </div>

        <form role="form" method="post" action="/board/write">
            <div class="write-content">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td colspan="3">
                                <input type="text" name="title"/>
                            </td>
                        </tr>
                        <tr class="second">
                            <th>첨부파일</th>
                            <td colspan="3">
                                <input type="file" name="file" /> 
                            </td>
                        </tr>
                        <tr>
                        <td><input type="hidden" id="writer" name="writer" value="${member.userId}"></td>
                        </tr>
                        <tr class="content">
                            <td colspan="4"><textarea class="content" name="content"></textarea></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="confirmation">
                <input id="btn-reg" type="submit" value="등록" />
                <button id="btn-cancel" type="button">취소</button>     
            </div>
        </form>
    </main>
</body>
</html>