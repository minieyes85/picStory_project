<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="d-flex border-bottom align-items-center">
	<div class="h1 ml-5 mr-auto">PicStory</div>

	<div class="mr-3" id="userName">
		<a href="/user/update_view" class="text-decoration-none text-dark">${userName}</a>
	</div>

	<div class="mr-3">
		<button class="btn btn-primary">글쓰기</button>
	</div>

	<div class="mr-5">
		<button class="btn btn-danger"
			onclick="location.href='/user/signOut'">로그아웃</button>
	</div>
</header>