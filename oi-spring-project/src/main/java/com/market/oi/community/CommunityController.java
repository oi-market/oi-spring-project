package com.market.oi.community;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.market.oi.community.comments.CommentsService;
import com.market.oi.community.comments.CommentsVO;
import com.market.oi.member.MemberVO;
import com.market.oi.util.CommunityPager;

@Controller
@RequestMapping("/neighborhood/**")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private CommentsService commentsService; 
	
	//@Value("${community.filePath}")
	private String filePath;
	
	
	
	//주소자르는 메서드
	public String cutLocation(Authentication auth) {
		
		//MemberVO가 UserDetail를 상속
		//				<-	principal에서 꺼냄
		UserDetails user = (UserDetails)auth.getPrincipal();
		//꺼낸 걸 memberVO로 변환해서 넣음
		MemberVO sessionMember = (MemberVO)user;
		
		System.out.println("Location : "+sessionMember.getLocation());
		
		
		//*****************  주소값 잘라서 보여주기  ******************
		
		int check1 = 0;
		int check2 = 0;
			
			for(int i = 0; i < sessionMember.getLocation().length(); i++) {
	
				// charAt 함수로 문자열을 한글자씩 취득
				System.out.println(sessionMember.getLocation().charAt(i));
				
				if(sessionMember.getLocation().charAt(i)==' ') {
					if(check1 == 0) {
						check1 = i+1;
					} else if(check1 != 0 && check2 == 0) {
						check2 = i;
					}
				}
				
			}

		System.out.println("check1 : "+check1);
		System.out.println("check2 : "+check2);
		
		String cutLocation = sessionMember.getLocation().substring(check1, check2);
		
		//******************************************************
		
		return cutLocation;
	}
	
	
	
	//커뮤니티 List
	@GetMapping("board")
	public ModelAndView getList(ModelAndView mv, CommunityPager communityPager, Authentication auth) throws Exception{
		
		System.out.println("search1 : "+communityPager.getSearch());
		System.out.println("FilePath : "+filePath);
		
		//주소 자르는 메서드
		String cutLocation = cutLocation(auth);
		
		communityPager.setCutLocation(cutLocation);
		System.out.println(communityPager.getCutLocation());
		
				
		List<CommunityVO> ar = communityService.getList(communityPager);

		List<Long> copy = new ArrayList<Long>();
		
		for(int i=0; i<ar.size(); i++) {
			CommentsVO commentsVO = new CommentsVO();
			commentsVO.setCommunityNum(ar.get(i).getNum());
			Long count = commentsService.getTotalCount(commentsVO);
			
			copy.add(count);
			System.out.println("copyList : "+copy.get(i));
			
		}

		mv.addObject("cutLocation", cutLocation);

		mv.addObject("count", copy);
		
		mv.addObject("list", ar);
		mv.addObject("size", ar.size());

		mv.addObject("communityPager", communityPager);
		mv.setViewName("neighborhood/board");
		
		System.out.println("search : "+communityPager.getSearch());
		
		return mv;
	}
	
	//커뮤니티 Select
	@GetMapping("select")
	public ModelAndView getSelect(CommunityVO communityVO, CommentsVO commentsVO, Authentication auth) throws Exception{
		
		System.out.println("select");
	
		ModelAndView mv = new ModelAndView();
		
		communityVO = communityService.getSelect(communityVO);
		
		
		//MemberVO가 UserDetail를 상속
		//				<-	principal에서 꺼냄
		UserDetails user = (UserDetails)auth.getPrincipal();
		//꺼낸 걸 memberVO로 변환해서 넣음
		MemberVO sessionMember = (MemberVO)user;
		
		System.out.println("username : "+sessionMember.getUsername());
		System.out.println("writer : "+communityVO.getWriter());
		System.out.println("nickName : "+communityVO.getNickName());

		//주소 자르는 메서드
		String cutLocation = cutLocation(auth);	
		
		//comments select
		List<CommentsVO> ar = commentsService.getList(commentsVO);
		Long count = commentsService.getTotalCount(commentsVO);


		mv.addObject("cutLocation", cutLocation);
		
		mv.addObject("count", count);
		mv.addObject("vo", communityVO);
		mv.addObject("session", sessionMember.getUsername());
		
		mv.addObject("comments", commentsVO);
		mv.addObject("list", ar);
		
		mv.setViewName("neighborhood/select");
		
		return mv;
	}
	
	//커뮤니티 Insert
	@GetMapping("insert")
	public ModelAndView setInsert(Authentication auth) throws Exception{
		System.out.println("insert");
		ModelAndView mv = new ModelAndView();
		CommunityVO communityVO = new CommunityVO();

		//주소 자르는 메서드
		String cutLocation = cutLocation(auth);
		
		mv.addObject("cutLocation", cutLocation);
		mv.addObject("vo", communityVO);
		mv.setViewName("neighborhood/insert");

		return mv;
	}
	
	
	@PostMapping("insert")
	public String setInsert(CommunityVO communityVO, MultipartFile [] files, Model model, Authentication auth) throws Exception {
		
		//MemberVO가 UserDetail를 상속
		//				<-	principal에서 꺼냄
		UserDetails user = (UserDetails)auth.getPrincipal();
		//꺼낸 걸 memberVO로 변환해서 넣음
		MemberVO memberVO = (MemberVO)user;
		
		communityVO.setWriter(memberVO.getUsername());
		communityVO.setLocation(memberVO.getLocation());
		communityVO.setNickName(memberVO.getNickName());
		
		System.out.println("writer : "+memberVO.getUsername());
		System.out.println("location : "+memberVO.getLocation());
		System.out.println("nickName : "+memberVO.getNickName());
		
		for(MultipartFile f : files) {
			System.out.println(f.getOriginalFilename());
		}
		
		int result = communityService.setInsert(communityVO, files);
		
		String message = "등록에 실패했습니다!";
		String path = "./board";
		
		System.out.println("insert result :"+result);
		
		if(result>0) {
			message = "등록에 성공했습니다!";
		}

		model.addAttribute("msg", message);
		model.addAttribute("path", path);
		
		return "common/communityResult";
		
	}
	
	//커뮤니티 Delete
	@GetMapping("delete")
	public ModelAndView setDelete(CommunityVO communityVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = communityService.setDelete(communityVO);
		
		String message = "삭제 권한이 없습니다!";
		String path = "./board";
		
		if(result > 0) {
			message = "삭제를 성공적으로 마쳤습니다!";
		}

		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/communityResult");
		
		return mv;
	}
	
	//커뮤니티 Update
	@GetMapping("update")
	public ModelAndView setUpdate(CommunityVO communityVO, Authentication auth) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		//주소 자르는 메서드
		String cutLocation = cutLocation(auth);
		
		mv.addObject("cutLocation", cutLocation);
		
		//값 가져오기
		communityVO = communityService.getSelect(communityVO);
		
		mv.addObject("vo", communityVO);
		mv.setViewName("neighborhood/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(CommunityVO communityVO, ModelAndView mv, Authentication auth) throws Exception{
		
		//MemberVO가 UserDetail를 상속
		//				<-	principal에서 꺼냄
		UserDetails user = (UserDetails)auth.getPrincipal();
		//꺼낸 걸 memberVO로 변환해서 넣음
		MemberVO memberVO = (MemberVO)user;
		
		communityVO.setWriter(memberVO.getUsername());
		communityVO.setLocation(memberVO.getLocation());
		communityVO.setNickName(memberVO.getNickName());
		
		System.out.println("nicName : "+memberVO.getUsername());
		System.out.println("location : "+memberVO.getLocation());
		System.out.println("nickName : "+memberVO.getNickName());
		
		int result = communityService.setUpdate(communityVO);

		String message = "수정 권한이 없습니다!";
		String path = "./board";
		
		if(result > 0) {
			message = "수정을 성공적으로 마쳤습니다!";
		}

		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/communityResult");
		
		return mv;

	}
	
	
	//summerfile upload	
	@PostMapping("summerFileUpload")
	public ModelAndView setSummerFileUpload(MultipartFile file)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Summer File Upload");
		System.out.println(file.getOriginalFilename());
//		System.out.println(file.getName());
		String fileName = communityService.setSummerFileUpload(file);
		fileName = "../resources/upload/community/"+fileName;
		
		mv.addObject("result", fileName);
		mv.setViewName("common/ajaxResult");
		
		return mv;
		
	}
	
	@PostMapping("summerFileDelete")
	public ModelAndView setSummerFileDelete(String fileName) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		boolean result = communityService.setSummerFileDelete(fileName);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}

}
