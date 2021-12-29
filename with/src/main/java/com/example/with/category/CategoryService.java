package com.example.with.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	private CategoryMapper mapper;
	
	public void delCategory(int category_num, int c_type) {
		switch (c_type) {
		case 1:
			mapper.deleteCategory1(category_num);
			break;
		case 2:
			mapper.deleteCategory2(category_num);
			break;
		case 3:
			mapper.deleteCategory3(category_num);
			break;
		}
	}
}
