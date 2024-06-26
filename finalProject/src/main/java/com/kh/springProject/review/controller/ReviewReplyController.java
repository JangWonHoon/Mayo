package com.kh.springProject.review.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.regexp.recompile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.springProject.member.model.vo.Member;
import com.kh.springProject.review.model.service.ReviewReplyService;
import com.kh.springProject.review.model.vo.ReviewReplyLikeVO;
import com.kh.springProject.review.model.vo.ReviewReplyVO;


import lombok.extern.slf4j.Slf4j;

@RequestMapping("/v1/review/reply")
@Controller
@Slf4j
public class ReviewReplyController  {
	@Autowired
	private ReviewReplyService reviewReplyService;
	

	 @PostMapping
	    @ResponseBody
	    public ResponseEntity<?> postReview(@RequestBody ReviewReplyVO reviewReplyVO, HttpSession session) {
	        Member member = (Member) session.getAttribute("loginUser");
	        if (member != null) {
	            reviewReplyVO.setUserKey(Integer.parseInt(member.getMemberNo()));
	            reviewReplyService.postReview(reviewReplyVO.getUserKey(), reviewReplyVO);
	            return ResponseEntity.ok("success");
	        } else {
	            return ResponseEntity.status(401).body("Unauthorized");
	        }
	    }

	
	
	//댓글 등록
	@GetMapping
	@ResponseBody
	public ResponseEntity<?> getReview(@RequestParam("toiletNo") int toiletNo){
		
		List<ReviewReplyVO> reviews=reviewReplyService.getReview(toiletNo);
		
		return ResponseEntity.ok(reviews);
	}
	
	//좋아요 누르기
	@PostMapping("/like")
	@ResponseBody
	public ResponseEntity<?> postLikeReview(@RequestBody ReviewReplyVO reviewReplyVO ){
		reviewReplyService.postLikeReview(1,reviewReplyVO.getToiletNo());
		return ResponseEntity.ok("sucess");
	}
	
	//좋아요 수 전체 조회
	@GetMapping("/like")
	@ResponseBody
	public ResponseEntity<?> gettLikeReview( ){
		List<ReviewReplyLikeVO> map =reviewReplyService.gettLikeReview(1);
		System.out.println(map.toString());
		return ResponseEntity.ok(map);
	}
	
	
	
	

}
