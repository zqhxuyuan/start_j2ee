package com.xuyuan.spring3.recipes.mvc.web;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xuyuan.spring3.recipes.mvc.domain.Member;
import com.xuyuan.spring3.recipes.mvc.service.MemberService;

/**
 * 8-12. Bean validation with Annotations (JSR-303)
 * http://localhost:8888/start_j2ee/member/list			[url-pattern:/]
 * http://localhost:8888/start_j2ee/member/list.html  	[url-pattern:*.html]
 * 
 * url-pattern:*.html需要加上*.html的地方有：
 * 	访问的URL；（jsp页面访问）
 * 	return "redirect:list.html";
 */
@Controller
@RequestMapping("/member")
@SessionAttributes("guests")
public class MemberController {
    
    private static Validator validator;
    /**
	 * @uml.property  name="memberService"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
        ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
        validator = validatorFactory.getValidator();
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String setupForm(Model model) {
        model.addAttribute("member", new Member()); //上方表单区域
        model.addAttribute("guests", memberService.list()); //下方列表数据
        return "memberList";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submitForm(@ModelAttribute("member") Member member, BindingResult result, Model model) {
        // Get JSR-303 errors ( See domain Member class for annotations validation) 
        Set<ConstraintViolation<Member>> violations = validator.validate(member);

        // Loop over possible errors, Add JSR-303 errors to BindingResult so Spring can display them in view via a FieldError
        for (ConstraintViolation<Member> violation : violations) {
            String propertyPath = violation.getPropertyPath().toString();
            String message = violation.getMessage();
            result.addError(new FieldError("member", propertyPath, "Invalid " + propertyPath + "(" + message + ")"));
        }

        // Use JSR-303 violations.size() == 0 or standard Spring result.hasErrors() which now has the JSR-303 errors
        if (!result.hasErrors()) { // No errors
            memberService.add(member);
            model.addAttribute("guests", memberService.list());

            // NOTE THAT SessionStatus.setComplete(); is NEVER called  , This allow the memberList to grow since its stored in session.Calling SessionStatus.setComplete() would destroy values in memberList
            return "memberList";
        } else {
            return "memberList";
        }
    }

    @RequestMapping(value = "/remove", method = RequestMethod.GET) 
    public String removeMember(@RequestParam("memberName") String memberName) {
        memberService.remove(memberName);
        //return "redirect:list";
        return "redirect:list.html";
    }
}

