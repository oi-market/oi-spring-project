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
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import org.springframework.web.servlet.ModelAndView;




@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
	private PasswordEncoder passwordEncoder;


	@GetMapping("memberPage")
	public void memberPage(Authentication authentication,Model model)throws Exception{
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(userDetails.getUsername());
		MemberFileVO imgName = memberService.selectImage(memberVO);
		System.out.println(imgName);
		 model.addAttribute("imgName", imgName.getFileName());

	}




	@GetMapping("CheckMail")
	@ResponseBody
	public String SendMail(Model model,String email, HttpSession session) {
		Random random = new Random();
		String key = "";
		SimpleMailMessage message = new SimpleMailMessage();
		//message.setFrom("오이마켓");
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
	public String memberJoin(@Valid MemberVO memberVO,
									Errors errors,
									MultipartFile avatar
									)throws Exception{
		System.out.println("Join Process" + memberVO.getName().length());

				if(errors.hasErrors()) {
					System.out.println("일로가냐");
					return "member/sign-up";
				}

		if(memberService.memberError(memberVO, errors)) {
				System.out.println("에러");

			return "member/sign-up";
			
		}


		int result = memberService.memberJoin(memberVO, avatar);
		System.out.println("성공");

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
	
	/*session 담아서 mypage에서 사용하기 위해 작성해놓은 코드 -혜민
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.getLogin(memberVO);
		
		session.setAttribute("member", memberVO);
		System.out.println(session);
		mv.setViewName("mypage/**");
		
		return mv;
	}*/
	
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
			message="잘못된 정보를 입력하셨습니다.";

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
	
	


	
	@PostMapping("memberUpdate")
	@ResponseBody
	public String memberUpdate(MemberVO memberVO , Authentication authentication) throws Exception{
		  UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		  String message = "";
	       memberVO.setUsername(userDetails.getUsername());
	       System.out.println(memberVO);
	       int result = memberService.memberUpdate(memberVO);
	       System.out.println(result);
	       if(result>0) {
	       MemberVO sessionUpdateVO = (MemberVO)userDetails; 
	       sessionUpdateVO.setNickName(memberVO.getNickName());
	       sessionUpdateVO.setName(memberVO.getName());
	       sessionUpdateVO.setEmail(memberVO.getEmail());
	       sessionUpdateVO.setPhone(memberVO.getPhone());
	       
	       	System.out.println(sessionUpdateVO);
	       	message="회원정보가 수정 되었습니다.";
	       }else {
	    	   message="회원정보 수정에 실패하였습니다.";
	       }

	       return message;
	}
	
	
	
	@PostMapping("setImage")
	@ResponseBody
	public String setImage(@Valid MemberVO memberVO,Errors errors, MultipartFile avatar,Authentication authentication) throws Exception{
		if(avatar.getSize()==0) {
			return "파일이없습니다.";
		}
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		System.out.println(memberVO);
		MemberFileVO memberFileVO = memberService.selectImage(memberVO);
		System.out.println(memberFileVO);
		if(memberFileVO==null) {
			int result1 = memberService.setImage(memberVO, avatar);
			System.out.println(result1);
		}else {
			int result = memberService.delImage(memberFileVO);
			int result1 = memberService.setImage(memberVO, avatar);
			System.out.println(result1);
		}
		String message="업로드 되었습니다.";	
		System.out.println(message);
		return message;
	}
	
	@PostMapping("delImage")
	@ResponseBody
	public String delImage(MemberVO memberVO,Authentication authentication)throws Exception{
		String message= "";
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		System.out.println(memberVO);
		MemberFileVO memberFileVO = memberService.selectImage(memberVO);
		if(memberFileVO==null) {
			message="삭제할 사진이없습니다.";
		}else {
			
			int result = memberService.delImage(memberFileVO);
			message="사진이 삭제되었습니다.";
		}
		
		
		return message;
	}
	

	
	
	
	
	
	@GetMapping("memberDelete")
	@ResponseBody
	public String memberDelete(MemberVO memberVO ,Authentication authentication)throws Exception{
		System.out.println(memberVO);
		String message ="";
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		boolean result = passwordEncoder.matches(memberVO.getPassword(), userDetails.getPassword());
		System.out.println(memberVO);
		System.out.println(result);
		if(result) {
			memberService.memberDelete(memberVO);
			message="삭제되었습니다.";
			
		}else {
			message="비밀번호가 일치하지않습니다.";
		}
		
		
		return message;	
	}
	
//	@GetMapping("memberPWCheck")
//	public boolean memberPWCheck(MemberVO memberVO, Authentication authentication)throws Exception{
//		
//		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//		
//		String pw2 =userDetails.getPassword();
//		
//		boolean result = passwordEncoder.matches(memberVO.getPassword(), pw2);
//		
//		System.out.println(result);
//		
//		return result;
//	}
	

	
	
	
	

	@PostMapping("memberPWChange")
	@ResponseBody
	public String memberPWChange(MemberVO memberVO ,Authentication authentication,String newPW1, String newPW2)
	throws Exception{
		String message="";
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		boolean result = passwordEncoder.matches(memberVO.getPassword(), userDetails.getPassword());
		System.out.println(newPW1);
		System.out.println(newPW2);
		if(result) {
			if(newPW1.equals(newPW2)){
				memberVO.setPassword(newPW1);
				int num = memberService.memberUpdatePW(memberVO);
				message="비밀번호가 변경되었습니다. 다시 로그인해주세요.";
			}else {
				message="바꿀 비밀번호가 같지않습니다.";
			}
			
		}else {
			message="현재비밀번호가 틀렸습니다.";
		}

	
		return message;
		
	}
	
	
	@GetMapping("testPage")
	public void testPage(MemberVO memberVO,Authentication authentication,Model model)throws Exception {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		memberVO.setUsername(userDetails.getUsername());
		System.out.println(memberVO);
		MemberFileVO memberFileVO = memberService.selectImage(memberVO);
		
		Double score = memberService.Score(memberVO);
		
		if(score==null) {
			score= 0.0;
		}
		score =( Math.round(score * 100) / 100.0);
		
		if(memberFileVO!=null) {
			model.addAttribute("imgName", memberFileVO.getFileName());
		}
		
		System.out.println(score);
		int change = 20;
		double scoreStar = change*score;
		System.out.println(score);
		model.addAttribute("Score",score);
		model.addAttribute("scoreStar",scoreStar);

		
	}
	
	
	
 
	@PostMapping("radiusUpdate")
	public String memberUpdateRadius(MemberVO memberVO , Authentication authentication) throws Exception{
		
		int result = memberService.memberUpdateRadius(memberVO, authentication);
		
		
		return "redirect:../mypage/village";
	}
	
	@PostMapping("loacationUpdate")
	public String memberUpdateLocation(MemberVO memberVO , Authentication authentication) throws Exception{
		
		int result = memberService.memberUpdateLocation(memberVO, authentication);
		
		
		return "redirect:../mypage/village";
	}
	
	
	
	
	
	
}
