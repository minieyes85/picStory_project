/**
 * 
 */

$(document).ready(function() {

	$(".commentCreateBtn").on("click", function() {
		let postId = $(this).val();
		let content = $("#commentInput" + postId).val();

		if (content == "") {
			alert("댓글 내용을 입력하세요.");
			return;
		}

		$.ajax({
			type: "post",
			url: "/post/comment/create",
			data: {
				"postId": postId,
				"content": content
			},
			success: function(data) {
				if (data.result == "success") {
					alert("댓글 등록 성공");
					location.reload();
				} else {
					alert("댓글 등록 실패");
				}
			},
			error: function() {
				alert("error");
			}
		});

	});

	$(".commentDeleteBtn").on("click", function() {
		if (confirm("댓글을 삭제 하시겠습니까?")) {
			var commentId = $(this).attr("at");

			$.ajax({
				type: "get",
				url: "/post/comment/delete",
				data: {
					"commentId": commentId
				},
				success: function(data) {
					if (data.result == "success") {
						alert("댓글 삭제 성공");
						location.reload();
					} else {
						alert("댓글 삭제 실패");
					}
				},
				error: function() {
					alert("error");
				}
			});
		}

	});

	$(".reCommentBtn").on("click", function() {
		var commentId = $(this).attr("at");
		var commentContent = $("#comment" + commentId + "Content").text();

		$("#updateComment" + commentId).removeAttr("hidden");
		$("#commentDiv" + commentId).hide();

		$("#updateCommentInput" + commentId).val(commentContent);

	});

	$(".commentUpdateBtn").on("click", function() {
		var commentId = $(this).attr("at");
		var updatedCommentContent = $("#updateCommentInput" + commentId).val();

		$.ajax({
			type: "post",
			url: "/post/comment/update",
			data: {
				"id": commentId,
				"content": updatedCommentContent
			},
			success: function(data) {
				if (data.result == "success") {
					alert("댓글 수정 성공");
					location.reload();
				} else {
					alert("댓글 수정 실패");
				}
			},
			error: function() {
				alert("error");
			}
		});
	});
	
	$(".createLike").on("click", function(){
		var id = $(this).attr("at");
		
		$.ajax({
			type: "get",
			url: "/post/like/create",
			data: {
				"postId": id
			},
			success: function(data){
				if(data.result == "success"){
					location.reload();
				} else {
					alert("좋아요가 등록되지 않았습니다.");
				}
			},
			error: function(){
				alert("error");
			}
		});
	});
	
	$(".deleteLike").on("click", function(){
		var postId = $(this).attr("at");
		
		$.ajax({
			type:"get",
			url: "/post/like/delete",
			data: {
				"postId": postId,
			},
			success: function(data){
				if(data.result == "success"){
					location.reload();
				} else {
					alert("좋아요가 삭제되지 않았습니다.");
				}
			},
			error: function(){
				alert("error");
			}
		});
	});



});