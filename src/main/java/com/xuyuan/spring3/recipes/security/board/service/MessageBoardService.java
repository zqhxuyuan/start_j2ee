package com.xuyuan.spring3.recipes.security.board.service;

import java.util.List;

import com.xuyuan.spring3.recipes.security.board.domain.Message;

public interface MessageBoardService { 
	 
    public List<Message> listMessages(); 
    public void postMessage(Message message); 
    public void deleteMessage(Message message); 
    public Message findMessageById(Long messageId); 
} 