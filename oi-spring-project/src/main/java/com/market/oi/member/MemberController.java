package com.market.oi.member;

import java.util.Enumeration;
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
	
	@GetMapping("jusoAPI")
	public void jusoAPI()throws Exception{
		
	}
	
	@GetMapping("CheckMail")
	@ResponseBody  //AJAX후 값을 리턴하기위해 작성
		public void SendMail(@RequestParam Map<String,Object> body) {

			Random random=new Random();  //난수 생성을 위한 랜덤 클래스
			String key="";  //인증번호 
		
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(body.get("mail").toString()); //스크립트에서 보낸 메일을 받을 사용자 이메일 주소 
			//입력 키를 위한 코드
			for(int i =0; i<3;i++) {
				int index=random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
				key+=(char)index;
			}
			int numIndex=random.nextInt(9999)+1000; //4자리 랜덤 정수를 생성
			key+=numIndex;
			message.setSubject("오이마켓 인증번호");
			message.setText("오이마켓 인증번호입니다.\n"+"인증 번호 : "+key);
			javaMailSender.send(message);
		}
	
	
	@GetMapping("memberJoinCheck")
	public void memberJoinCheck()throws Exception{
		
	}
	
	@GetMapping("memberJoin")
	public String setJoin(@ModelAttribute MemberVO memberVO)throws Exception{
		return "member/memberJoin";
	}
	
	@PostMapping("memberJoin")
	public String memberJoin(@Valid MemberVO memberVO, Errors errors ,MultipartFile avatar)throws Exception{
		System.out.println("Join Process" + memberVO.getName().length());
		if(errors.hasErrors()) {
			return "member/memberJoin";
		}
		if(memberService.memberError(memberVO, errors)) {
			
			return "member/memberJoin";
		}
		
		int result = memberService.memberJoin(memberVO, avatar);
		
		return "redirect:../";
	}
	
	
	@GetMapping("memberLogin")
	public String memberLogin() throws Exception{
		
		return "member/memberLogin";
	}
	
	@PostMapping("memberLogin")
	public String getLogin(HttpServletRequest request)throws Exception{
		
		System.out.println("Message:"+request.getAttribute("message"));
		
		return "member/memberLogin";
	}
	
	
	
}
