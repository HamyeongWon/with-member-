package com.example.with.category;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService service;

	@RequestMapping("/admin/category")
	public void categoryView(Model model) {
		
	}

	//ī�װ� �߰�
	@RequestMapping(value = "/category/addCategory")
	@ResponseBody
	public String addCategory(@RequestParam String category_name, @RequestParam int category_type,
			@RequestParam(required = false, defaultValue = "-1") int parent_category_num) {
		Category c = new Category(0,category_name,parent_category_num);		
		service.addCategory(c, category_type);
		return getCategory(category_type, parent_category_num);
	}

	//ī�װ� ���
	@RequestMapping(value = "/category/getCategory")
	@ResponseBody
	public String getCategory(@RequestParam int category_type,@RequestParam(required = false, defaultValue = "-1") int parent_category_num) {
		ArrayList<Category> cate_list = null;
		switch (category_type) {
		case 1:
			cate_list = (ArrayList<Category>) service.getAllCategory(1, 0);
			break;
		case 2:
			cate_list = (ArrayList<Category>) service.getAllCategory(2, parent_category_num);
			break;
		case 3:
			cate_list = (ArrayList<Category>) service.getAllCategory(3, parent_category_num);
			break;
		}
		Gson g = new Gson();
		return g.toJson(cate_list);
	}

	//ī�װ� ����
	@RequestMapping(value = "/category/deleteCategory")
	@ResponseBody
	public String deleteCategory(@RequestParam int category_type, @RequestParam int category_num) {
		Category c = service.getCategory(category_type, category_num);
		service.delCategory(category_type, category_num);
		return getCategory(category_type, c.getParent_category_num());
	}

}
