package com.example.with.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping("/")
	public String main() {
		return "index";
	}

	@GetMapping("/member/join")
	public String joinForm() {
		return "member/joinForm";
	}

	/*
	 * @GetMapping("/members/{id}") public Member getMem(@PathVariable String id) {
	 * return service.getMember(id); }
	 * 
	 * @RequestMapping("/members/update") // post - insert public String
	 * insertMember(@RequestBody Member m) { if (m != null) { service.addMember(m);
	 * return ""; } else { return ""; } // return "member/join"; }
	 * 
	 * @RequestMapping("member/{id}") public String update() { return
	 * "member/update"; }
	 * 
	 * @RequestMapping("/members/del") public String deleteMember(@PathVariable
	 * String id) { if (id != null || id.equals("")) { service.delMember(id); } else
	 * { return "false"; } return ""; }
	 */
}