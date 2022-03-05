package com.market.oi.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	@GetMapping("/test/list")
	public void getSelect(Model model)throws Exception{
		
		TestVO testVO=testService.getSelect();
		model.addAttribute("VO", testVO);
	}
	
}
