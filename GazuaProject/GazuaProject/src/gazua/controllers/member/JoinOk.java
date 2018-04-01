package gazua.controllers.member;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gazua.dao.MyBatisConnectionFactory;
import gazua.helper.BaseController;
import gazua.helper.FileInfo;
import gazua.helper.RegexHelper;
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;
import gazua.model.Member;
import gazua.service.MemberService;
import gazua.service.impl.MemberServiceImpl;

@WebServlet("/member/join_ok.do")
public class JoinOk extends BaseController {
	private static final long serialVersionUID = -5017670312983929539L;
	
	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	RegexHelper regex;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	// --> import study.jsp.mysite.service.MemberService;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		// 회원가입 처리를 위한 Service객체
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		memberService = new MemberServiceImpl(sqlSession, logger);

		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") != null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "이미 로그인 하셨습니다.");
			return null;
		}

		/** (4) 파일이 포함된 POST 파라미터 받기 */
		// <form>태그 안에 <input type="file">요소가 포함되어 있고,
		// <form>태그에 enctype="multipart/form-data"가 정의되어 있는 경우
		// WebHelper의 getString()|getInt() 메서드는 더 이상 사용할 수 없게 된다.
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}

		// UploadHelper에서 텍스트 형식의 파라미터를 분류한 Map을 리턴받아서 값을 추출한다.
		Map<String, String> paramMap = upload.getParamMap();
		String member_name = paramMap.get("member_name");
		String member_user_id = paramMap.get("member_user_id");
		String member_name2 = paramMap.get("member_name2");
		String member_pw = paramMap.get("member_pw");
		String member_pw_re = paramMap.get("member_pw_re");
		String member_email = paramMap.get("member_email");
		String member_gender = paramMap.get("member_gender");
		String birthdate = paramMap.get("birthdate");

//		String member_name = web.getString("member_name");
//		String member_user_id = web.getString("member_user_id");
//		String member_name2 = web.getString("member_name2");
//		String member_pw = web.getString("member_pw");
//		String member_pw_re = web.getString("member_pw_re");
//		String member_email = web.getString("member_email");
//		String member_gender = web.getString("member_gender");
//		int member_age = web.getInt("member_age");

		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("member_name=" + member_name);
		logger.debug("member_user_id=" + member_user_id);
		logger.debug("member_name2=" + member_name2);
		logger.debug("member_pw=" + member_pw);
		logger.debug("member_pw_re=" + member_pw_re);
		logger.debug("member_email=" + member_email);
		logger.debug("member_gender=" + member_gender);
		logger.debug("birthdate=" + birthdate);
		

		/** (5) 입력값의 유효성 검사 */
		// 아이디 검사
		if (!regex.isValue(member_user_id)) {
			sqlSession.close();
			web.redirect(null, "아이디를 입력하세요.");
			return null;
		}

		if (!regex.isEngNum(member_user_id)) {
			sqlSession.close();
			web.redirect(null, "아이디는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}

		if (member_user_id.length() > 20) {
			sqlSession.close();
			web.redirect(null, "아이디는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}

		// 비밀번호 검사
		if (!regex.isValue(member_pw)) {
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}

		if (!regex.isEngNum(member_pw)) {
			sqlSession.close();
			web.redirect(null, "비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}

		if (member_pw.length() > 20) {
			sqlSession.close();
			web.redirect(null, "비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}

		// 비밀번호 확인
		if (!member_pw.equals(member_pw_re)) {
			sqlSession.close();
			web.redirect(null, "비밀번호 확인이 잘못되었습니다.");
			return null;
		}

		// 이름 검사
		if (!regex.isValue(member_name)) {
			sqlSession.close();
			web.redirect(null, "이름을 입력하세요.");
			return null;
		}

		if (!regex.isKor(member_name)) {
			sqlSession.close();
			web.redirect(null, "이름은 한글만 입력 가능합니다.");
			return null;
		}

		if (member_name.length() < 2 || member_name.length() > 10) {
			sqlSession.close();
			web.redirect(null, "이름은 2~10글자 까지만 가능합니다.");
			return null;
		}

		// 이메일 검사
		if (!regex.isValue(member_email)) {
			sqlSession.close();
			web.redirect(null, "이메일을 입력하세요.");
			return null;
		}

		if (!regex.isEmail(member_email)) {
			sqlSession.close();
			web.redirect(null, "이메일의 형식이 잘못되었습니다.");
			return null;
		}


		// 성별검사
		if (!regex.isValue(member_gender)) {
			sqlSession.close();
			web.redirect(null, "성별을 입력하세요.");
			return null;
		}

		if (!member_gender.equals("M") && !member_gender.equals("F")) {
			sqlSession.close();
			web.redirect(null, "성별이 잘못되었습니다.");
			return null;
		}

		/** (6) 업로드 된 파일 정보 추출 */
		List<FileInfo> fileList = upload.getFileList();
		// 업로드 된 프로필 사진 경로가 저장될 변수
		String member_profile_img = null;

		// 업로드 된 파일이 존재할 경우만 변수값을 할당한다.
		if (fileList.size() > 0) {
			// 단일 업로드이므로 0번째 항목만 가져온다.
			FileInfo info = fileList.get(0);
			member_profile_img = info.getFileDir() + "/" + info.getFileName();
		} else {
			member_profile_img = null;
		}
		System.out.println(member_profile_img);
		// 파일경로를 로그로 기록
		logger.debug("profileImg=" + member_profile_img);

		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		member.setMember_user_id(member_user_id);
		member.setMember_pw(member_pw);
		member.setMember_name(member_name);
		member.setMember_name2(member_name2);
		member.setBirthdate(birthdate);
		member.setMember_email(member_email);
		member.setMember_gender(member_gender);
		member.setMember_profile_img(member_profile_img);

		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			memberService.insertMember(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}

		/** (9) 가입이 완료되었으므로 메인페이지로 이동 */
		sqlSession.close();
		web.redirect(web.getRootPath() + "/gazua/main.do", "회원가입이 완료되었습니다. 로그인 해 주세요.");

		// INSERT,UPDATE,DELETE 처리를 수행하는 action 페이지들은
		// 자체적으로 View를 갖지 않고 결과를 확인할 수 있는
		// 다른 페이지로 강제 이동시켜야 한다. (중복실행 방지)
		// 그러므로 View의 경로를 리턴하지 않는다.
		return null;
	}

}
