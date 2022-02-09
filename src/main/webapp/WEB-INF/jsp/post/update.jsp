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
	<div>
		
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="d-flex justify-content-center align-items-center">
						
			<div class="post border">
				<div class="postHeader d-flex justify-content-between mt-2 ml-3">
					포스트 수정
				</div>
				
				<!-- 첨부사진 표시 -->
				
				<div>
					<c:choose>
						<c:when test="${post.imagePath eq null}"></c:when>
						<c:when test="${post.imagePath ne null}">
							<div class="postImg mt-2 d-flex justify-content-center">
								<img class="postUpdateImg" src="${post.imagePath}" />
							</div>
						</c:when>
					</c:choose>
				</div>
				
				<!-- 포스트 내용 -->
				
				<div class="postContent mt-2 d-flex justify-content-center">
					<textarea class="form-control ml-3 mr-3" rows="5" autofocus id="postContentInput">${post.content}</textarea>
				</div>
								
				<!-- 포스트 취소/등록 -->
				
				<div class="d-flex justify-content-between ml-3 mr-3 mt-2 mb-3">
					<button class="btn btn-danger"
						onclick="location.href='/post/timeline_view'">취소</button>
					<button class="btn btn-primary" id="postUpdateBtn">수정</button>
				</div>
				
								
			</div>
						
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>

</body>

<script>
	$(document).ready(function(){
		$("#postUpdateBtn").on("click",function(){
			var postContentInput = $("#postContentInput").val().trim();
			var postId = ${post.id};
			
			if(postContentInput == ""){
				alert("내용을 입력하세요.");
				return;
			}
			
			var formData = new FormData();
			formData.append("content", postContentInput);
			
			$.ajax({
				type: "post",
				url: "/post/update",
				data: {
					"postId": postId,
					"content": postContentInput
				},
				
				success: function(data){
					if(data.result == "success"){
						alert("글이 성공적으로 수정 되었습니다.");
						location.href="/post/timeline_view";
					} else {
						alert("글이 등록 수정 않았습니다.");
					}
				},
				error: function(){
					alert("error");
				}
			
			});
		})
	});

</script>


</html>