package edu.kh.ugloryC.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FAQController {
	
	@RequestMapping("/faq")
	public String faq() {
		return "common/FAQ";
	}

}
