package com.example.with.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@RequestMapping("/review/list")
	public ModelAndView review() {
		ModelAndView m = new ModelAndView("review/reviewList");
		ArrayList<Review> list = service.getAllList();
		m.addObject("list", list);
		return m;
	}
}
