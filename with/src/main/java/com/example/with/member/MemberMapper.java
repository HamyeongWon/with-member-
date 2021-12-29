package com.example.with.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	void insert(Member m);
	ArrayList<Member> select(); // 사용자 전체 목록(관리자)
	Member selectById(String id);
	void update(Member m);
	void delete(String id);
	void updatePwd(String id, String pwd);
}