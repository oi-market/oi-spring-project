package com.market.oi.member;

import java.io.Console;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private JavaMailSender javaMailSender;


	@GetMapping("memberPage")
	public void memberPage(HttpSession session)throws Exception{
		System.out.println("1111");

	}




	@GetMapping("CheckMail")
	@ResponseBody
	public String SendMail(Model model,String email, HttpSession session) {
		Random random = new Random();
		String key = "";
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
		key += numIndex;
		message.setSubject("오이마켓 인증번호");
		message.setText("오이마켓 인증번호입니다.\n"+"인증 번호 : "+key);
		javaMailSender.send(message);
		model.addAttribute("key", key);
		//		session.setAttribute("key", key);
		System.out.println(key);

		return key;
	}




	@GetMapping("memberJoinCheck")
	public void memberJoinCheck()throws Exception{

	}

	@GetMapping("memberJoin")
	public String memberJoin(@ModelAttribute MemberVO memberVO)throws Exception{
		return "member/sign-up";
	}

	@PostMapping("memberJoin")
	public String memberJoin(@Valid MemberVO memberVO, Errors errors ,MultipartFile avatar)throws Exception{
		System.out.println("Join Process" + memberVO.getName().length());
		//		if(errors.hasErrors()) {
		//			return "member/memberJoin";
		//		}

		if(memberService.memberError(memberVO, errors)) {

			return "member/sign-up";
		}

		int result = memberService.memberJoin(memberVO, avatar);

		return "redirect:../";
	}
	
	@GetMapping("idCheck")
	@ResponseBody
	   public String memberIdCheck (MemberVO memberVO)throws Exception{
		System.out.println("idCheck시작전");
	      memberVO = memberService.idCheck(memberVO);
	      String result = "";//0 사용 불가 1:사용가능
	      if(memberVO==null) {
	         result="null";
	      }      
//	      model.addAttribute("result", result);
	      return result;
	   }

	@GetMapping("memberLogin")
	public String memberLogin() throws Exception{
		System.out.println("GetLogin");
		return "member/memberLogin";
	}
	
	@GetMapping("loginFail")
	public String loginFail()throws Exception{
		System.out.println("Login Fail");
		return "member/memberLoginResult";
	}
	

	@GetMapping("memberLogout")
	public String Logout(HttpSession session)throws Exception{
		session.invalidate();
		
		return "redirect:../";	
	}



	@GetMapping("memberLoginResult")
	public String memberLoginResult()throws Exception{
		System.out.println("Login 성공");
		return "redirect:/";
	}

	@GetMapping("memberFindID")
	public void memberFindID()throws Exception{

	}
	@PostMapping("memberFindID")
	@ResponseBody
	public String memberFindId(MemberVO memberVO,Model model)throws Exception{
		memberVO = memberService.memberFindID(memberVO);
		System.out.println(memberVO);
		String message ="";

		if(memberVO== null) {
			message="이름 , 이메일 불일치";

		} else {
			message="회원님의 아이디는 " + memberVO.getUsername()+" 입니다.";
		}
		model.addAttribute("message",message);
		System.out.println(message);

		return message;
	}

	@GetMapping
	public void memberFindPW() {

	}

	@PostMapping("memberFindPW")
	@ResponseBody
	public String memberFindPW(MemberVO memberVO,Model model)throws Exception{
		Random random = new Random();
		memberVO = memberService.memberFindPW(memberVO); 
		SimpleMailMessage message = new SimpleMailMessage();
		String alertMessage ="";

		
		if(memberVO== null) {
			alertMessage="아이디 ,이름 ,이메일 불일치";

		}else {
			String newPW = "";
			
			for (int i = 0; i < 3; i++) {
				int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
				newPW += (char) index;
			}
			int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
			newPW += numIndex;
			
			memberVO.setPassword(newPW);
			System.out.println(newPW);
			System.out.println(memberVO.getEmail());
			
			message.setTo(memberVO.getEmail());
			
			message.setSubject("오이마켓 임시비밀번호");
			message.setText("오이마켓 임시비밀번호입니다.\n"+"임시비밀번호 : "+newPW);
			javaMailSender.send(message);


			int result = memberService.memberUpdatePW(memberVO);
//			System.out.println(memberVO);


			alertMessage=memberVO.getEmail()+"로 임시비밀번호가 전송되었습니다";
//test			alertMessage="임시비밀번호는 " + newPW +" 입니다.";
		}
		model.addAttribute("message",message);
//		System.out.println(message);

		return alertMessage;
	}





}
