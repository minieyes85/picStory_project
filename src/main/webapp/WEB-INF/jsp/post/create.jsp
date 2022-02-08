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
					포스트 작성
				</div>
				
				<!-- 포스트 내용 -->
				
				<div class="postContent mt-2 d-flex justify-content-center">
					<textarea class="form-control ml-3 mr-3" rows="15" autofocus id="postContentInput"></textarea>
				</div>
								
				<!-- 첨부 사진 파일 -->
				
				<div class="postImg mt-2 ml-3">
					<input type="file" id="fileInput">									
				</div>
				
				<!-- 포스트 취소/등록 -->
				
				<div class="d-flex justify-content-between ml-3 mr-3 mt-2 mb-3">
					<button class="btn btn-danger"
						onclick="location.href='/post/timeline_view'">취소</button>
					<button class="btn btn-primary" id="postCreateBtn">등록</button>
				</div>
				
								
			</div>
						
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>

</body>

<script>
	$(document).ready(function(){
		$("#postCreateBtn").on("click",function(){
			var postContentInput = $("#postContentInput").val();
			
			if(postContentInput == ""){
				alert("내용을 입력하세요.");
				return;
			}
			
			var formData = new FormData();
			formData.append("content", postContentInput);
			formData.append("file",$("#fileInput")[0].files[0]);
			
			$.ajax({
				type: "post",
				url: "/post/create",
				data: formData,
				
				//파일 업로드 필수 설정
				enctype:"multipart/form-data",
				processData:false,
				contentType:false,
				
				success: function(data){
					if(data.result == "success"){
						alert("글이 성공적으로 등록 되었습니다.");
						location.href="/post/timeline_view";
					} else {
						alert("글이 등록 되지 않았습니다.");
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