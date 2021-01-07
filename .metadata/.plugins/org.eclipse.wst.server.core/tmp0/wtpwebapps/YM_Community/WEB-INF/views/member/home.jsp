<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello YongminLand</title>
    <link rel="stylesheet" href="/resources/css/home.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
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
    

    <div id="body">
        <section class="login-form">
            <h1>YONGMIN's Story</h1>
            <form role="form" method="post" action="/member/login">
                <div class="int-area">
                    <input type="text" name="userId" id="userId"
                    autocomplete="off" required>
                    <label for="userId">USER NAME</label>
                </div>
                <div class="int-area">
                    <input type="password" name="userPwd" id="userPwd"
                    autocomplete="off" required>
                    <label for="userPwd">PASSWORD</label> 
                </div>
                <div class="btn-area">
                    <button id="btn" type ="submit">LOGIN</button>
                </div>
            </form>
            <div class="caption">
                <a href="join">Join Us</a>
            </div>
        </section>
    </div>
    <script>
        let id = $('#userId');
        let pw = $('#userPwd');
        let btn = $('#btn');
        
        $(btn).on('click',function() {
            if($(id).val() == "") {
                $(id).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                }, 1000);
            }
            else if($(pw).val() == "") {
                $(pw).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                }, 1000);
            }
        });

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
    <c:if test="${msg==false}">
    <script>
    	alert("아이디와 비밀번호를 확인해주세요.");
    </script>
    </c:if>
    
    <c:if test="${member!=null}">
    <script>
    $("#btn").on("click", function() {
    	if(confirm("이미 로그인 중입니다. 새로 로그인하시겠습니까?"));
        })
    </script>
    </c:if>
    
</body>
</html>