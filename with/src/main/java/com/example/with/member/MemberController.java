package com.example.with.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.with.category.Category;
import com.example.with.category.CategoryService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@Autowired
	private CategoryService cService;

	@RequestMapping("/")
	public ModelAndView main() {
		ModelAndView m = new ModelAndView("index");
//		ArrayList<Product> list = productService.getList();
//		m.addObject("list", list);

		return m;
	}

	@RequestMapping("/member/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		Member m = service.getMember(id);
		int count = 0;
		if (m == null) {
			count = 1;
		} else {
			count = 0;
		}
		return count;
	}

	@RequestMapping("/member/nickCheck")
	@ResponseBody
	public int nickCheck(@RequestParam("nick") String nick) {
		return service.getNick(nick);
	}

	@GetMapping("/member/login")
	public String login() {
		return "member/login";
	}

	@PostMapping("/member/login")
	public String login(String id, String pwd, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member m = service.getMember(id);
		if (m != null && m.getPwd().equals(pwd)) {
			session.setAttribute("id", id);
			session.setAttribute("nick", m.getNick());
		} else {
			System.out.println("login fail");
		}

		return "redirect:/member/main";
	}

	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.removeAttribute("id");
		session.invalidate();
		return "redirect:/member/main";
	}

	@RequestMapping("/member/del")
	public String delMember(@RequestParam("id") String id) {
		service.delMember(id);
		return "redirect:/member/logout";
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
		if (m != null && service.getMember(m.getId()) == null) {
			service.addMember(m);
		} else {
			System.out.println("join fail");
		}

		return "redirect:/member/main";
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
		HttpSession session = request.getSession(false);
		if (m != null) {
			m.setId((String) session.getAttribute("id"));
			service.editMember(m);
		} else {
			System.out.println("update fail");
		}

		return "redirect:/member/myPage";
	}

	@RequestMapping("/member/myPage")
	public ModelAndView myPage(String id) {
		ModelAndView mv = new ModelAndView("member/main");
		Member m = service.getMember(id);
		mv.addObject("m", m);
		return mv;
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
			mav.addObject("error", "?????????(?????????)??? ??????????????????..");
		} else if (m.getId().equals(id)) {
			mav.addObject("id", id);
			mav.setViewName("/member/changePwd");
		} else {
			mav.setViewName("/member/findPwd");
			mav.addObject("error", "???????????? ??????????????????.");
		}

		return mav;
	}

	@GetMapping(value = "/member/changePwd")
	public void changePwdPage() {
	}

	@PostMapping(value = "/member/changePwd")
	public String changePwd(Member m) {
		service.editPwd(m);
		return "redirect:/member/login";
	}
}