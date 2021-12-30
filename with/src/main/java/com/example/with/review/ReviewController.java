package com.example.with.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.with.member.Member;
import com.example.with.member.MemberService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("/review/reviewList")
	public ModelAndView review(String id) {
		ModelAndView mv = new ModelAndView("review/reviewList");
		Member m = mService.getMember(id);
		/*
		 * ArrayList<Review> list = service.getAllList(id); m.addObject("list", list);
		 */
		mv.addObject("m", m);
		return mv;
	}
	
	@RequestMapping("/review/addReview")
	public String addReview(String id, int star, String content, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String member_id = (String)session.getAttribute("id");
		Review r = new Review();
		r.setMember_id(member_id);
		r.setProduct_id(id);
		r.setReview_content(content);
		r.setStar(star);
		
		service.addReview(r);
		
		return "redirect:/review/reviewList"; 
	}
}
