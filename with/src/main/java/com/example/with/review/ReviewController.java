package com.example.with.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		ArrayList<Review> list = service.getAllList(id);
		mv.addObject("list", list);
		mv.addObject("m", m);
		return mv;
	}
	
	@RequestMapping("/review/addReview")
	public ModelAndView addReview(String id, int star, String content, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/review/reviewList");
		HttpSession session = request.getSession(false);
		String member_id = (String)session.getAttribute("id");
		Review r = new Review();
		r.setMember_id(member_id);
		r.setProduct_id(id);
		r.setReview_content(content);
		r.setStar(star);
		
		service.addReview(r);
		mv.addObject("id", id);
		
		return mv;
	}
}
