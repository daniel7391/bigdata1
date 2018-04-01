package gazua.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gazua.dao.MyBatisConnectionFactory;
import gazua.helper.BaseController;
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;
import gazua.model.Member;
import gazua.service.MemberService;
import gazua.service.impl.MemberServiceImpl;

@WebServlet("/member/out_ok.do")
public class OutOk extends BaseController {

	private static final long serialVersionUID = -7525599863974448087L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	// --> import study.jsp.mysite.service.MemberService;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		memberService = new MemberServiceImpl(sqlSession, logger);

		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 탈퇴할 수 없다.
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/gazua/main.do", "로그인 후에 이용 가능합니다.");
			return null;
		}

		/** (4) 파라미터 받기 */
		String member_Pw = web.getString("member_pw");
		logger.debug("member_pw=" + member_Pw);

		if (member_Pw == null) {
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}

		/** (5) 서비스에 전달하기 위하여 파라미터를 Beans로 묶는다. */
		// 회원번호는 세션을 통해서 획득한 로그인 정보에서 취득.
		Member loginInfo = (Member) web.getSession("loginInfo");
		Member member = new Member();
		member.setMember_id(loginInfo.getMember_id());
		member.setMember_pw(member_Pw);

		/** (6) Service를 통한 탈퇴 시도 */
		try {
			// 비밀번호 검사 --> 비밀번호가 잘못된 경우 예외발생
			memberService.selectMemberPasswordCount(member);
			// 탈퇴처리
			memberService.deleteMember(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		// 탈퇴되었다면 프로필 이미지를 삭제한다.
		upload.removeFile(loginInfo.getMember_profile_img());

		/** (7) 정상적으로 탈퇴된 경우 강제 로그아웃 및 페이지 이동 */
		web.removeAllSession();
		web.redirect(web.getRootPath() + "/gazua/main.do", "탈퇴되었습니다.");
		return null;
	}

}
