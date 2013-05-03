package com.xuyuan.spring3.recipes.mvc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.xuyuan.spring3.recipes.mvc.domain.Member;

public class MemberServiceImpl implements MemberService {

    /**
	 * @uml.property  name="members"
	 * @uml.associationEnd  qualifier="memberName:java.lang.String com.xuyuan.spring3.recipes.mvc.domain.Member"
	 */
    private Map<String, Member> members = new TreeMap<String, Member>();

    public void add(Member member) {
        members.put(member.getName(), member);
    }

    public void remove(String memberName) {
        members.remove(memberName);
    }

    public List<Member> list() {
        return new ArrayList<Member>(members.values());
    }
}
