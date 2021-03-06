package edu.kh.ugloryA.customer.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.ugloryA.customer.model.service.CustomerService;
import edu.kh.ugloryA.customer.model.vo.Customer;

@Controller
@RequestMapping("/customer")
@SessionAttributes({"message"})
public class CustomerController {

	private Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService service;
	
	
	@GetMapping("/selectAll")
	public String selectAll(@RequestParam(value="key", required = false) String key, 
			@RequestParam(value="query", required=false) String query,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
			Model model) {
		
		Map<String,	Object> map = null;
		
		
		
		if(key == null && query == null) { 
			map = service.selectAllCustomer(cp);
		} else {
			map = service.searchCustomer(key, query);
		}
		
		model.addAttribute("map", map);
		
		return "manageMember/MemberList";
	}
	
	@ResponseBody
	@GetMapping("/changeSt")
	public int changeStatement(int customerNo) {
		return service.changeStatement(customerNo);
	}
		

}
