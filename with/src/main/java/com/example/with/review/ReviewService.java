package com.example.with.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper mapper;
	
	public void addReview(Review r) {
		mapper.insert(r);
	}
	
	public ArrayList<Review> getAllList() {
		return mapper.selectAll();
	}
	
	public void delReview(int review_num) {
		mapper.delete(review_num);
	}
}