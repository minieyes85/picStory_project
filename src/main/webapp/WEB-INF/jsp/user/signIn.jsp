<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
	
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/picStoryStyle.css" type="text/css">

<title>PicStory</title>
</head>
<body>
	<div class="d-flex justify-content-center align-items-center" id="wrap">
		<div class="border border-secondaary bg-white d-flex justify-content-center" id="boxSignIn">
			<div class="d-flex flex-column justify-content-center">
				<div class="text-center h1 mt-3 mb-3">
				PicStory
				</div>
				<form>
				<div class="d-flex flex-column" id="boxSignInInput" >
					<input class="form-control mb-3" type="text" placeholder="ID" id="loginId">
					<input class="form-control mb-3" type="password" placeholder="Password" id="password">
					<div class="d-flex justify-content-center mb-3">
						<input class="btn btn-primary" type="submit" value="로그인" id="signInBtn">
					</div>
				</div>
				</form>
				
				<div class="border-top mb-3"></div>
				
				<div id="boxAskSign" class="text-center">
					<span class="mr-3">계정이 없으신가요?</span> <a href="/user/signup_view">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function(){
		$("#signInBtn").on("click",function(e){
			
			e.preventDefault();
			
			var loginId = $("#loginId").val();
			var password = $("#password").val();
			
			//입력값 확인
			
			if(loginId == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			
			if(password == ""){
				alert("패스워드를 입력하세요.");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/user/sign_in",
				data:{
					"loginId":loginId,
					"password":password
				},
				success:function(data){
					if(data.result == "success"){
						alert(data.userName + "님 환영합니다.");
						location.href = "/post/timeline_view"
					} else {
						alert("일치하는 회원이 없습니다.");
					}
				},
				error:function(){
					alert("error");
				}
			});
			
		});
	});
</script>

</html>