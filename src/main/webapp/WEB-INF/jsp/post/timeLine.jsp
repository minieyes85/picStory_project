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

<script type="text/javascript" src="/static/js/timeLine.js"></script>

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
							<div class="postOwner mt-2 ml-3 d-flex align-items-center">
								${post.userName }
								<!-- 글 편집 버튼 -->
								<c:if test="${userId eq post.userId}">
									<a href="/post/update_view?id=${post.id}" class="ml-1">
										<img src="/static/images/editBtn.png" class="postEditBtn">
									</a>
								</c:if>
							</div>
							
							<div class="postDate mt-2 mr-3 d-flex align-items-center">
								<fmt:formatDate value="${post.createdAt}" pattern="yy-MM-dd HH:mm"/>
								<!-- 글 삭제 버튼 -->
								<c:if test="${userId eq post.userId}">
									<a href="/post/delete?id=${post.id}" class="ml-1"
										onclick="return confirm('삭제하시겠습니까?')">
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
						
						<!-- 좋아요 -->
						<div class="postLike mt-2 ml-2">
							
							<a href="/post/like/create?id=${post.id }">
							<img src="/static/images/heart_empty.png"/>
							</a>


							<!-- 
							<img src="/static/images/heart_fill.png"/>
							 --> 
							 
							<span class="ml-1">좋아요</span>
						</div>
						 
						<!-- 내용 -->
						<div class="postContent m-2">
							${post.content }
						</div>					
						
						<!-- 댓글 -->
						
						<div class="postComment ml-2 mr-2 mb-2" id="post${post.id}">
							<div class="border-top"></div>
							
							<!-- 댓글 리스트 -->
							
							<c:forEach var="comments" items="${allComments }">
								<c:if test="${post.id eq comments.key }">
									<c:forEach var="comment" items="${comments.value }">
										<div id="commentDiv${comment.id}" class="comment">
											<div class="d-flex justify-content-between">
												<div>
													<span class="font-weight-bold">
														${comment.userName }
													</span>
													<span id="comment${comment.id}Content">${comment.content}</span>
												</div>
												<c:if test="${userId eq comment.userId }">
													<div>
														<a at="${comment.id}"
															class="reCommentBtn ml-1">
															<img src="/static/images/editBtn.png"
																width="15px" class="commentDelBtn">
														</a>
														<a at="${comment.id}"
															class="commentDeleteBtn ml-2">
															<img src="/static/images/delBtn.png"
																width="10px" class="commentDelBtn">
														</a>
													</div>
													
												</c:if>
											</div>
										</div>
										<div id="updateComment${comment.id }" class="mb-2" hidden>
											<div class="d-flex justify-content-between">
												<div class="postCommentInputForm">
													<input id="updateCommentInput${comment.id }" class="form-control form-control-sm mr-3" type="text" />
												</div>
												<button at="${comment.id}" class="commentUpdateBtn btn btn-sm btn-primary">수정</button>
											</div>
										</div>
										</c:forEach>								
								</c:if>
							</c:forEach>
							<div class="border-top mb-2"></div>
							
							<!-- 댓글 작성 -->
							<div class="postCommentInput d-flex justify-content-between">
								<div class="postCommentInputForm">
									<input type="text" class="form-control form-control-sm mr-3"
										id="commentInput${post.id}"/>						
								</div>
								<button class="btn btn-sm btn-primary commentCreateBtn"
									value="${post.id}">작성</button>
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