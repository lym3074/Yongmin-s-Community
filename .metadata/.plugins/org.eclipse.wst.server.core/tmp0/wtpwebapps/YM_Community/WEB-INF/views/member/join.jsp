<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello YongminLand</title>
    <link rel="stylesheet" href="/resources/css/join.css">
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

    <div id="body">
        <section class="login-form">
            <h1>Sign-Up Page</h1>
            <form action="/member/join" method="post">
                <div class="int-area">
                    <input type="text" name="userId" id="userId"
                    autocomplete="off" required>
                    <label for="userId">USER ID</label>
                </div>
                <div class="int-area">
                    <input type="password" name="userPwd" id="userPwd"
                    autocomplete="off" required>
                    <label for="userPwd">PASSWORD</label>
                </div>
                <div class="int-area">
                    <input type="password" name="confirmPwd" id="confirmPwd"
                    autocomplete="off" required> 
                    <label for="confirmPw">CONFIRM PASSWORD</label> 
                </div>
                <div class="int-area">
                    <input type="text" name="userName" id="userName"
                    autocomplete="off" required>
                    <label for="userName">NAME</label>
                </div>
                <div class="int-area">
                    <input type="email" name="userEmail" id="userEmail"
                    autocomplete="off" required>
                    <label for="userEmail">EMAIL</label>
                </div>
                
                <div class="btn-area">
                    <button id="btn" type ="submit">JOIN</button>
                    <a href="home">BACK</a>
                </div>
            </form>
        </section>
    </div>

    <script>
        let id = $('#userId');
        let pw = $('#userPwd');
        let pw2 = $('#confirmPwd')
        let name = $('#userName');
        let email = $('#userEmail');
        let btn = $('#btn');

        $(btn).on('click',function() {
            if($(id).val() == "") {
                $(id).next('label').addClass('warning2');
                setTimeout(function() {
                    $('label').removeClass('warning2');
                }, 1000);
            }

            else if($(pw).val() == "") {
                $(pw).next('label').addClass('warning2');
                setTimeout(function() {
                    $('label').removeClass('warning2');
                }, 1000);
            }

            else if($(pw2).val() == "") {
                $(pw2).next('label').addClass('warning2');
                setTimeout(function() {
                    $('label').removeClass('warning2');
                }, 1000);
            }

            else if($(name).val() == "") {
                $(name).next('label').addClass('warning2');
                setTimeout(function() {
                    $('label').removeClass('warning2');
                }, 1000);
            }
            else if($(email).val() == "") {
                $(email).next('label').addClass('warning2');
                setTimeout(function() {
                    $('label').removeClass('warning2');
                }, 1000);
            }

            else if($(pw).val() != $(pw2).val()) {
                alert('비밀번호가 맞지 않습니다. 확인 한번만~');
                return false;
            }
        }
    );
    </script>
</body>
</html>