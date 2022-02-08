<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	<div>
		
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="d-flex justify-content-center align-items-start">
			
			<div>
			
			<div>
				<c:forEach var="post" items="${Posts}">
					<div class="post border">
						<div class="postHeader d-flex justify-content-between">
							<div class="postOwner mt-2 ml-3">
								${post.userName }
							</div>
							
							<div class="postDate mt-2 mr-3 d-flex">
								<fmt:formatDate value="${post.createdAt}" pattern="yy-MM-dd HH:mm"/>
								<!-- 글삭제 버튼 -->
								<c:if test="${userId eq post.userId}">
									<a href="/post/delete?id=${post.id}" class="ml-1">
										<img src="/static/images/delBtn.png" class="postDelBtn">
									</a>
								</c:if>
							</div>
						</div>
						
						<!-- 이미지 이미지 유무에 따라 표시 if -->
						<c:choose>
							<c:when test="${post.imagePath eq null}"></c:when>
							<c:when test="${post.imagePath ne null}">
								<div class="postImg mt-2 d-flex justify-content-center">
									<img src="${post.imagePath}" />
								</div>
							</c:when>
						</c:choose>
						<!-- 좋아요 기능 추후 구현
						<div class="postLike mt-2 ml-2">
							<img src="/static/images/heart_empty.png"/>
							<span class="ml-1">좋아요</span>
						</div>
						
						 -->
						 
						<!-- 내용 -->
						<div class="postContent m-2">
							${post.content }
						</div>					
						
						<!-- 댓글 -->
						
						<div class="postComment m-2">
							<hr>
							
							<!-- 댓글 리스트 추후 구현
							<div class="mb-1">최준선 : 11111111</div>
							<div class="mb-1">최준선 : 222222222</div>
							<div class="mb-1">최준선 : 3333333333</div>
							-->
							
							<!-- 댓글 작성 -->
							<div class="postCommentInput d-flex">
								<div class="postCommentInputForm">
									<input type="text" class="form-control mr-3" />						
								</div>
								<button class="btn btn-sm btn-primary" value="${post.id}">작성</button>
							</div>
						</div>				
					</div>
				</c:forEach>
			</div>			
			
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>

</body>

</html>