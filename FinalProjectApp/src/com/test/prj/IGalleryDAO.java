/*====================
	IGalleryDAO.java
	- 인터페이스
====================*/

package com.test.prj;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IGalleryDAO
{
	// 갤러리 페이지의 작성글 가져오기
	public ArrayList<GalleryDTO> galleryList(@Param("moment_id") String moment_id);
	
	// 갤러리 테이블 모든 레코드 개수 세기
	public int galleryCount();
	
	// 그룹원 아이디 확인
	public String searchMemberId(@Param("user_id") String user_id, @Param("group_id") String group_id);
	
	// 모먼트 참여자 아이디 찾기
	public String getPartiId(@Param("member_id") String member_id, @Param("moment_id") String moment_id);
	
	// 갤러리 테이블에 데이터 추가
	public int addGallery(@Param("moment_id") String moment_id, @Param("participant_id") String participant_id
						, @Param("file_realname") String file_realname, @Param("file_settingname") String file_settingname
						, @Param("root") String root);
	
	// 특정 갤러리 페이지 정보 조회
	public GalleryDTO myGalleryList(@Param("gallery_id") String gallery_id);

	// 특정 갤러리 페이지 댓글 수 조회
	public int countComment(@Param("gallery_id") String gallery_id);

	// 특정 갤러리 페이지 댓글 내용 조회
	public ArrayList<GalleryDTO> GalleryCommentList(@Param("gallery_id") String gallery_id);

}
