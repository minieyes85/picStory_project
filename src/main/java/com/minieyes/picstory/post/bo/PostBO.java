package com.minieyes.picstory.post.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.minieyes.picstory.comment.bo.CommentBO;
import com.minieyes.picstory.comment.model.Comment;
import com.minieyes.picstory.common.FileManagerService;
import com.minieyes.picstory.like.BO.LikeBO;
import com.minieyes.picstory.like.model.LikeDTO;
import com.minieyes.picstory.post.dao.PostDAO;
import com.minieyes.picstory.post.model.Post;
import com.minieyes.picstory.post.model.PostDetail;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public int createPost(
			int userId,
			String userName,
			String content,
			MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);

		return postDAO.insertPost(userId, userName, content, imagePath);
	}
	
	public List<Post> findAllPosts() {
		
		return postDAO.selectPost();
	}
	
	public List<PostDetail> getPostList(int userId) {
		// post list 가져오기
		// post 대응하는 댓글 좋아요 가져오기
		// post 대응하는 댓글 좋아요 데이터 구조 만들기
		
		List<Post> postList = postDAO.selectPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		// 해당하는 post id로 댓글 가져오기
		for(Post post:postList) {
			int postId = post.getId();
			List<Comment> commentList = commentBO.getCommentList(postId);
			LikeDTO like = likeBO.getLike(postId, userId);			
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);;
			postDetail.setLike(like);			
			
			postDetailList.add(postDetail);
			
		}
		
		return postDetailList;
	}
	
	public Map<String, List<Comment>> findComments(){
		
		Map<String, List<Comment>> result = new HashMap<>();
		
		List<Post> posts = new ArrayList<>();		
		posts = postDAO.selectPost();
		
		for(Post post:posts) {
			int postId = post.getId();
			List<Comment> comments = new ArrayList<>();
			comments = commentBO.getCommentList(postId);
			result.put(String.valueOf(postId), comments);
		}
		
		return result;
	}
	
	public Post findPost(int id) {
		return postDAO.selectTargetPost(id);
	}
	
	public int updatePost(int id, String content) {
		return postDAO.updatePost(id, content);
	}
	
	public int deletePost(int id) {
		
		Post post = postDAO.selectTargetPost(id);
		
		FileManagerService.removeFile(post.getImagePath());
		
		// comment 삭제		
		commentBO.removeCommentByPostId(id);		
		
		// like 삭제
		likeBO.removeLikeByPostId(id);
		
		return postDAO.deletePost(id);
	}
	
}
