package com.example.with.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService service;

	@RequestMapping(value = "/category/delCategory")
	public String delCategory(@RequestParam(value = "category_num") int category_num,
			@RequestParam(value = "c_type") int c_type) {
		service.delCategory(category_num, c_type);
		return "admin/category";
	}
}