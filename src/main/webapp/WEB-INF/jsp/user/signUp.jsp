<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/picStoryStyle.css"
	type="text/css">

<title>PicStory</title>
</head>
<body>
	<div class="d-flex justify-content-center align-items-center" id="wrap">
		<div
			class="border border-secondaary bg-white d-flex justify-content-center"
			id="boxSignUp">
			<div class="d-flex flex-column justify-content-center">
				<div class="text-center h1 mt-3 mb-3">PicStory</div>
				<div class="d-flex flex-column" id="boxSignUpInput">

					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="ID" id="loginId">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button" id="dupChkBtn">중복검사</button>
						</div>
					</div>
					
					<div id="chkResult" class="mb-3"></div>
					
					<input class="form-control mb-3" type="password"
						placeholder="Password" id="password">
					
					<input class="form-control mb-3"
						type="password" placeholder="Password check" id="passwordCheck">
					
					<input class="form-control mb-3"
						type="text" placeholder="User Name" id="userName">
					
					<input class="form-control mb-3"
						type="text" placeholder="E-mail address" id="email">
					
					<div class="d-flex justify-content-center mb-3">
						<input class="btn btn-secondary" type="button" value="회원가입" id="signUpBtn" disabled>
					</div>
					
				</div>

				<div class="border-top mb-3"></div>

				<div id="boxAskSign" class="text-center">
					<span class="mr-3">이미 가입하셨나요?</span> <a href="/user/signin_view">로그인</a>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function(){
		
		$("#loginId").on("input",function(){
			$("#signUpBtn").attr("disabled",true);
			$("#signUpBtn").attr("class","btn btn-secondary");
			$("#chkResult").text("");
		});
		
		$("#dupChkBtn").on("click",function(){
			var loginId = $("#loginId").val();
			
			if(loginId == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"/user/is_duplicated_id",
				data:{
					"loginId":loginId
				},
				success:function(data){
					if(data.is_duplicated == "false"){
						$("#chkResult").text("사용가능한 아이디 입니다.");
						$("#chkResult").attr("class","mb-3 text-primary");						
						$("#signUpBtn").attr("class","btn btn-primary");
						$("#signUpBtn").attr("disabled",false);
					} else if(data.is_duplicated == "true") {
						$("#chkResult").text("이미 사용중인 아이디 입니다.");
						$("#chkResult").attr("class","mb-3 text-danger");
					}
				},
				error:function(){
					alert("error");
				}
			});
			
		});
		
		
		$("#signUpBtn").on("click",function(){
			
			var loginId = $("#loginId").val();
			var password = $("#password").val();
			var passwordCheck = $("#passwordCheck").val();
			var userName = $("#userName").val();
			var email = $("#email").val();
			
			// 입력값 체크
			
			if(loginId == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			
			if(password == ""){
				alert("패스워드를 입력하세요.");
				return;
			}
			
			if(password != passwordCheck){
				alert("패스워드가 일치하지 않습니다.");
				return;
			}
			
			if(userName == ""){
				alert("이름을 입력하세요.");
				return;
			}
			
			if(email == ""){
				alert("이메일 주소를 입력하세요.");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/user/sign_up",
				data:{
					"loginId":loginId,
					"password":password,
					"userName":userName,
					"email":email
				},
				success:function(data){
					if(data.result == "success"){
						alert(userName+"님 가입을 환영합니다.");
						location.href = "/user/signin_view"
					} else {
						alert("회원가입 실패");
					}
				},
				error:function(){
					alert("error");
				}
				
				
			})
			
			
		});
	});
</script>

</html>