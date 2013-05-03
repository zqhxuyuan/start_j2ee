package com.xuyuan.spring3.recipes.security.board.web;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xuyuan.spring3.recipes.security.board.domain.Message;
import com.xuyuan.spring3.recipes.security.board.service.MessageBoardService;

/**
 * 1.domain,service,web
 * 2.web.xml	ContextLoaderListener,DelegatingFilterProxy,DispatcherServlet
 * 	dispatcher-servlet.xml
 * 	applicationContext_beans.xml 业务实现类
 * 	applicationContext_security.xml  
 * 
 */
@Controller 
@RequestMapping("/messageList*") 
public class MessageListController  { 
 
    /**
	 * @uml.property  name="messageBoardService"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private MessageBoardService messageBoardService; 
 
    @Autowired 
    public MessageListController(MessageBoardService messageBoardService) { 
        this.messageBoardService = messageBoardService; 
    } 
 
     
    @RequestMapping(method = RequestMethod.GET) 
    public String generateList(Model model) {  
         List<Message> messages = Collections.emptyList(); 
         messages = messageBoardService.listMessages(); 
         model.addAttribute("messages",messages); 
         return "messageList"; 
    } 
}
