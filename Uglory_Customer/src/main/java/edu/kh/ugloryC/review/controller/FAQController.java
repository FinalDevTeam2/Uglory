package edu.kh.ugloryC.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/faq")
public class FAQController {
	
	public String faq() {
	
		return "common/FAQ";
	}

}