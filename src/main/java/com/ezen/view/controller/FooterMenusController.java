package com.ezen.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.QnaVO;
import com.ezen.biz.dto.UserVO;
import com.ezen.biz.qna.QnaService;

@Controller
public class FooterMenusController {

	@Autowired
	QnaService qnaService;

	@RequestMapping(value = "/footer_policy")
	public String footer_policy(Model model) {

		return "footer_menus/footer_policy"; // footer_policy.jsp 호출
	}

	@RequestMapping(value = "/footer_contact")
	public String footer_contact(Model model) {

		return "footer_menus/footer_contact"; // footer_contact.jsp 호출
	}

	@RequestMapping(value = "/footer_company")
	public String footer_company(Model model) {

		return "footer_menus/footer_company"; // footer_company.jsp 호출
	}

	// qna 목록 화면
	@RequestMapping(value = "qna_List")
	public String qnaList(QnaVO vo, Model model) {

		// 로그인 여부 확인
		// 나중에 추가

		// qna 게시판 목록
		if (vo.getQnaSearchCondition()==null) vo.setQnaSearchCondition("0");
		if (vo.getQnaSearchKeyword()==null) vo.setQnaSearchCondition("");
		System.out.println("qna검색조건="+vo.getQnaSearchCondition());
		System.out.println("qna검색키워드="+vo.getQnaSearchKeyword());
		
		List<QnaVO> qnaList = qnaService.getlistQna(vo);

		model.addAttribute("qnaList", qnaList); // JSP에 값 전달
		return "footer_menus/qna_List"; // qna_List.jsp 호출

	}

	// qna 상세보기
	@RequestMapping(value = "qna_Detail")
	public String qnaDetail(QnaVO vo, HttpSession session, Model model) {

		QnaVO qna = qnaService.getQna(vo.getQseq());

		model.addAttribute("qnaVO", qna);

		return "footer_menus/qna_Detail"; // qna_Detail.jsp 호출
	}

	// qna 질문하기 화면
	@RequestMapping(value = "qna_Write")
	public String qnaWriteView(HttpSession session) {

		return "footer_menus/qna_Write"; // qnaWrite.jsp 호출
	}

	// qna 질문하기 등록
	@RequestMapping(value = "qna_Write_Action", method = RequestMethod.POST)
	public String qnaWriteAction(QnaVO vo, HttpSession session) {

		// 로그인 여부 확인
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		if (loginUser == null) {

			return "login_form";
		} else {
			vo.setUser_id(loginUser.getUser_id());
			qnaService.insertQna(vo);

			return "redirect:qna_List"; // qna등록 되었으니, 다시 qna_List.jsp호출
		}

	}
	
	// qna 답변하기 업데이트
	@RequestMapping(value="qna_Answer", method= RequestMethod.POST)
	public String qna_AnswerAction(QnaVO vo, Model model, HttpSession session) {
		
		// 관리자 로그인 여부 확인
		/*UserVO loginAdmin = (UserVO) session.getAttribute("loginUser");
		System.out.println(">>>>>>>qna_Answer컨트롤러 loginAdmin : "+ loginAdmin);
		
		if (loginAdmin == null) {
			model.addAttribute("msg", "관리자 로그인이 필요합니다.");
		} else {
			qnaService.qna_Answer(vo);
				
		}
		*/
		qnaService.qna_Answer(vo);
		System.out.println(">>>>>>>qna_Answer컨트롤러 : "+ vo);
		return "redirect:qna_List";	// qnaDetail.jsp 호출
	}

}










