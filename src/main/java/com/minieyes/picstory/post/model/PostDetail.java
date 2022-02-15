package com.minieyes.picstory.post.model;

import java.util.List;

import com.minieyes.picstory.comment.model.Comment;
import com.minieyes.picstory.like.model.LikeDTO;

public class PostDetail {
	
	//포스트 하나 + 댓글 리스트 + 좋아요 갯수
	
	private Post post;
	private List<Comment> commentList;
	private LikeDTO like;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public LikeDTO getLike() {
		return like;
	}
	public void setLike(LikeDTO like) {
		this.like = like;
	}
	

}
