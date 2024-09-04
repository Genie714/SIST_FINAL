/*====================
	IMomentDAO.java
	- 인터페이스
====================*/

package com.test.prj;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IMomentDAO
{
	// 그룹 페이지에서 모든 모먼트 리스트 확인
	public ArrayList<MomentDTO> allList(String group_id);
	
	// 모먼트 등록 인원 수 확인
	public int count(String group_id);
	
	// 그룹원 수 확인
	public int countMember(String group_id);

	// 날짜 컬럼 수 확인
	public int countDate();
	
	// 모먼트 날짜 데이터 입력(추가)
	public int addDate(MomentDTO dto);
	
	// 장소 컬럼 수 확인
	public int countPlace();
	
	// 모먼트 장소 데이터 입력(추가)
	public int addPlace(MomentDTO dto);

	// 전체 모먼트 수 확인
	public int countMoment();
	
	// 모먼트 데이터 입력(추가)
	public int addMoment(MomentDTO dto);
	
	// 그룹원 아이디 확인
	public String searchMemberId(@Param("user_id") String user_id, @Param("group_id") String group_id);

	// 모먼트 참여자 데이터 입력(추가)
	public int addMomentMember(MomentDTO dto);

	// 모먼트 조회 페이지에서 해당 모먼트 정보 확인
	public MomentDTO momentList(String moment_id);
	
	// 이미 참여 중인 모먼트인지 확인
	public int momentJoinCount(@Param("user_id") String user_id, @Param("moment_id") String moment_id);

	// 이중약속 확인
	public int momentDateCount(@Param("user_id") String user_id, @Param("date_name") String date_name);
	
	/*
	// 모먼트 데이터 확인
	public MomentDTO search(String moment_id);
	
	// 모먼트 데이터 수정
	public int modify(MomentDTO dto);
	
	// 모먼트 데이터 삭제
	public int remove(String moment_id);
	*/
}
