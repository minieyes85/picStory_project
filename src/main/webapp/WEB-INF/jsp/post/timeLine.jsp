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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

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
				<c:forEach var="postDetail" items="${post}">
					<div class="post border">
						<div class="postHeader d-flex justify-content-between">
							<div class="postOwner mt-2 ml-3 d-flex align-items-center">
								${postDetail.post.userName }
							</div>
							
							<div class="postDate mt-2 mr-3 d-flex align-items-center">
								<fmt:formatDate value="${postDetail.post.createdAt}" pattern="yy-MM-dd HH:mm"/>
							
							<!-- modal launch button -->
							
							<c:if test="${userId eq postDetail.post.userId}">
								<div>
									<a href="#" class="text-dark" data-toggle="modal" data-target="#exampleModalCenter">
										<i class="bi bi-three-dots-vertical"></i>
									</a>
								</div>
							</c:if>
							
							<!-- Modal -->
							<div class="modal fade bd-example-modal-sm" id="exampleModalCenter" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalCenterTitle"
								aria-hidden="true">
								<div class="modal-dialog modal-sm modal-dialog-centered"
									role="document">
									<div class="modal-content">
									<div class="modal-body text-center">
										<a href="/post/update_view?id=${postDetail.post.id}" class="text-decoration-none text-primary"
										data-post-id="${postDetail.post.id}">편집하기</a>
									</div>
									<div class="modal-body text-center">
										<a href="/post/delete?id=${postDetail.post.id}"
										onclick="return confirm('삭제하시겠습니까?')"
										class="text-decoration-none text-danger"
										data-post-id="${postDetail.post.id}">삭제하기</a>
									</div>
										
									</div>
								</div>
							</div>


							</div>
						</div>
						
						<!-- 이미지 이미지 유무에 따라 표시 if -->
						<c:choose>
							<c:when test="${postDetail.post.imagePath eq null}"></c:when>
							<c:when test="${postDetail.post.imagePath ne null}">
								<div class="postImg mt-2 d-flex justify-content-center">
									<img src="${postDetail.post.imagePath}" />
								</div>
							</c:when>
						</c:choose>
						
						<!-- 좋아요 -->
						
						<div class="postLike mt-2 ml-2">
	
							<!-- userId if 좋아요 하트 채울지 말지 -->
							
							<c:if test="${postDetail.like.check eq 1 }">
							<a class="deleteLike" at="${postDetail.post.id }">
								<img src="/static/images/heart_fill.png"/>								
							</a>
							<span>좋아요</span> 
							${postDetail.like.count }
							</c:if>
							
							<c:if test="${postDetail.like.check eq 0 }">
							<a class="createLike" at="${postDetail.post.id }">
								<img src="/static/images/heart_empty.png"/>								
							</a>
							<span>좋아요</span> 
							${postDetail.like.count }
							</c:if>
						
							<c:if test="${postDetail.like eq null }">
							<a class="createLike" at="${postDetail.post.id }">
								<img src="/static/images/heart_empty.png"/>								
							</a>
							<span>좋아요</span> 
							</c:if>
						</div>
						
						 
						<!-- 내용 -->
						<div class="postContent m-2">
							${postDetail.post.content }
						</div>					
						
						<!-- 댓글 -->
						
						<div class="postComment ml-2 mr-2 mb-2" id="post${postDetail.post.id}">
							<div class="border-top"></div>
							
							<!-- 댓글 리스트 -->

								<c:forEach var="comment" items="${postDetail.commentList }">

									<div id="commentDiv${comment.id}" class="comment">
										<div class="d-flex justify-content-between">
											<div>
												<span class="font-weight-bold"> ${comment.userName }
												</span> <span id="comment${comment.id}Content">${comment.content}</span>
											</div>
											<c:if test="${userId eq comment.userId }">
												<div>
													<a at="${comment.id}" class="reCommentBtn ml-1"> <img
														src="/static/images/editBtn.png" width="15px"
														class="commentDelBtn">
													</a>
													<a at="${comment.id}" class="commentDeleteBtn ml-2"> <img
														src="/static/images/delBtn.png" width="10px"
														class="commentDelBtn">
													</a>
												</div>

											</c:if>
										</div>
									</div>
									<div id="updateComment${comment.id }" class="mb-2" hidden>
										<div class="d-flex justify-content-between">
											<div class="postCommentInputForm">
												<input id="updateCommentInput${comment.id }"
													class="form-control form-control-sm mr-3" type="text" />
											</div>
											<button at="${comment.id}"
												class="commentUpdateBtn btn btn-sm btn-primary">수정</button>
										</div>
									</div>
								</c:forEach>

								<div class="border-top mb-2"></div>
							
							<!-- 댓글 작성 -->
							<div class="postCommentInput d-flex justify-content-between">
								<div class="postCommentInputForm">
									<input type="text" class="form-control form-control-sm mr-3"
										id="commentInput${postDetail.post.id}"/>						
								</div>
								<button class="btn btn-sm btn-primary commentCreateBtn"
									value="${postDetail.post.id}">작성</button>
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