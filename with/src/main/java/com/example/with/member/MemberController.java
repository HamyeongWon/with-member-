package com.example.with.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping("/")
	public String main() {
		return "index";
	}
	
	@GetMapping("/member/login")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping("/idCheckService")
	@ResponseBody
	public int idCheck(@RequestBody String id) {
		Member m = service.getMember(id);
		if (m == null) {
			return 1;
		} else {
			return 0;
		}
	}

	@RequestMapping("member/main")
	public String main2() {
		return "index";
	}

	@GetMapping("/member/join")
	public String joinForm() {
		return "member/joinForm";
	}

	@PostMapping("/member/join")
	public String join(Member m, HttpServletRequest r) {
		System.out.println("회원가입");
		if (m != null && service.getMember(m.getId()) == null) {
			System.out.println("회원정보: " + m.toString());
			service.addMember(m);
			// 로그인 기능이 없어서 임시 구현----------------
			HttpSession ss = r.getSession();
			ss.setAttribute("id", m.getId());
			// --------------------------------------
		} else {
			System.out.println("로그인 실패");
		}

		return "redirect:/member/myPage";
	}

	@GetMapping("member/update")
	public ModelAndView updateForm(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ModelAndView mv = new ModelAndView("member/editForm");
		Member m = service.getMember((String) session.getAttribute("id"));
		mv.addObject("m", m);
		return mv;
	}

	@PostMapping("member/update")
	public String update(Member m, HttpServletRequest request) {
		System.out.println("정보 수정");
		HttpSession session = request.getSession(false);
		if (m != null) {
			m.setId((String) session.getAttribute("id"));
			service.editMember(m);
		} else {
			System.out.println("정보 수정 실패");
		}

		return "redirect:/member/myPage";
	}

	@GetMapping("/member/myPage")
	public String myPage() {
		return "member/main";
	}
	
	@RequestMapping(value = "/member/passwordChk")
	public void pwdChk() {
	}
	
	@PostMapping(value = "/member/pwdChk")
	@ResponseBody
	public JSONObject pwdChk(HttpServletRequest req, @RequestParam("pwd") String pwd) {
		HttpSession session = req.getSession(false);
		JSONObject jo = new JSONObject();
		String id = (String) session.getAttribute("id");
		Member m = service.getMember(id);
		if (m.getPwd().equals(pwd)) {
			jo.put("res", "ok");

		} else {
			jo.put("res", "fail");
		}
		return jo;
	}
	
	@GetMapping(value = "/member/findPwd")
	public String findp(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		if (id != null) {
			return "redirect:/member/main";
		} else {
			return req.getRequestURI();
		}
	}
	
	@PostMapping(value = "/member/findPwd")
	public ModelAndView findPwd(String id) {
		ModelAndView mav = new ModelAndView();
		Member m = service.getMember(id);
		
		if (m == null) {
			mav.setViewName("/member/findPwd");
			mav.addObject("error", "아이디를 확인해주세요.");
		} else if (m.getId().equals(id)) {
			mav.addObject("id", id);
			mav.setViewName("/member/changePwd");
		} else {
			mav.setViewName("/member/findPwd");
			mav.addObject("error", "입력값을 확인해주세요.");
		}
		System.out.println(m);
		
		return mav;
	}
	
	@GetMapping(value = "/member/changePwd")
	public void changePwdPage() {
	}

	@PostMapping(value = "/member/changePwd")
	public String changePwd(Member m) {
		System.out.println("changePwd");
		service.editPwd(m);
		System.out.println("changePwd2");
		return "redirect:/member/loginForm";
	}
}