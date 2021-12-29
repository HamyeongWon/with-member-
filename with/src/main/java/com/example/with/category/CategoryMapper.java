package com.example.with.category;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	   void deleteCategory1(int category_num);
	   void deleteCategory2(int category_num);
	   void deleteCategory3(int category_num);


}
