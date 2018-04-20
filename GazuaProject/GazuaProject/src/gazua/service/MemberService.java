package gazua.service;

import java.util.List;

import gazua.model.Member;

/** 회원 관련 기능을 제공하기 위한 Service 계층 */
public interface MemberService {
	/**
	 * 아이디 중복검사
	 * @param member - 아이디
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public void selectUserIdCount(Member member) throws Exception;
	
	/**
	 * 닉네임 중복검사
	 * @param member - 닉네임
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public void selectName2Count(Member member) throws Exception;
	
	/**
	 * 회원가입(아이디,이메일 중복검사 후 가입처리)
	 * @param member - 일련번호, 가입일시,변경일시를 제외한 모든 정보
	 * @throws Exception
	 */
	public void insertMember(Member member) throws Exception;
	
	/**
	 * 로그인
	 * @param member - 아이디 비밀번호
	 * @return 회원정보
	 * @throws Exception
	 */
	public Member selectLoginInfo(Member member) throws Exception;
	
	
	/**
	 * 비밀번호 검사
	 * @param member
	 * @throws Exception
	 */
	public void selectMemberPasswordCount(Member member) throws Exception;
	
	/**
	 * 회원탈퇴
	 * @param member - 회원번호, 비밀번호
	 * @throws Exception
	 */
	public void deleteMember(Member member) throws Exception;
	
	/**
	 * 일련번호에 의한 회원정보 조회
	 * @param member
	 * @throws Exception
	 */
	public Member selectMember(Member member) throws Exception;
	
	public void updateMember(Member member) throws Exception;
	
	public Member selectFindMemberId(Member member) throws Exception;
	
	public void updateMemberPasswordByEmail(Member member) throws Exception;
	
	public List<Member> selectidList(Member member) throws Exception;
}
