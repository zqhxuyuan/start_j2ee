package com.xuyuan.spring3.recipes.mvc.service;

import java.util.List;

import com.xuyuan.spring3.recipes.mvc.domain.Member;

public interface MemberService {
    public void add(Member member);
    public void remove(String memberName);
    public List<Member> list();
}
