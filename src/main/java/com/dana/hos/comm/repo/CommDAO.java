package com.dana.hos.comm.repo;

import java.util.List;

import com.dana.hos.comm.module.CommentDTO;
import com.dana.hos.comm.module.PageDTO;
import com.dana.hos.comm.module.ReviewDTO;
import com.dana.hos.hopital.module.EventDTO;

public interface CommDAO {
	// 후기 작성
	public int reviewWrite(ReviewDTO dto);
	
	// 전체 후기 리스트
	public List<ReviewDTO> totalList(PageDTO pdto);
	
	// 전체 해시 리스트
	public List<ReviewDTO> hashList();
	
	// 특정 번호 후기 상세
	public ReviewDTO reviewDetail(int vino);
	
	// 후기 댓글작성
	public int writeCom(CommentDTO dto);
	
	// 댓글 가지고 오기
	public List<CommentDTO> comList(int vino);
	
	// 후기글 삭제하기
	public int deleteReview(int vino);
	
	// 후기 수정하기
	public int updateReview(ReviewDTO rdto);
	
	// 후기 댓글 삭제
	public int comDelete(int cno);
	
	// 후기 댓글 수정
	public int modifyCom(CommentDTO dto);
	
	// 해시 페이지
	public List<ReviewDTO> reviewHash(PageDTO pdto);
	
	//이벤트 리스트
	public List<EventDTO> eventList(EventDTO edto);
	
	//이벤트 페이지
	public int eventCount();
}
