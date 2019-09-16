package com.dana.hos.comm.repo;

import java.util.List;

import com.dana.hos.comm.module.CommentDTO;
import com.dana.hos.comm.module.PageDTO;
import com.dana.hos.comm.module.ReviewDTO;

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
}
