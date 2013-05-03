package com.xuyuan.spring3.recipes.security.board.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.acls.domain.BasePermission;
import org.springframework.security.acls.domain.GrantedAuthoritySid;
import org.springframework.security.acls.domain.ObjectIdentityImpl;
import org.springframework.security.acls.domain.PrincipalSid;
import org.springframework.security.acls.model.MutableAcl;
import org.springframework.security.acls.model.MutableAclService;
import org.springframework.security.acls.model.ObjectIdentity;
import org.springframework.transaction.annotation.Transactional;

import com.xuyuan.spring3.recipes.security.board.domain.Message;

public class MessageBoardServiceImpl implements MessageBoardService { 
	 
    /**
	 * @uml.property  name="messages"
	 * @uml.associationEnd  qualifier="getId:java.lang.Long com.xuyuan.spring3.recipes.security.board.domain.Message"
	 */
    private Map<Long, Message> messages = new LinkedHashMap<Long, Message>(); 
 
    /**
	 * @uml.property  name="mutableAclService"
	 * @uml.associationEnd  
	 */
    private MutableAclService mutableAclService; 
    
    /**
	 * @param mutableAclService
	 * @uml.property  name="mutableAclService"
	 */
    public void setMutableAclService(MutableAclService mutableAclService) { 
        this.mutableAclService = mutableAclService; 
    }
    
    @Secured({"ROLE_USER", "ROLE_GUEST"})
    //@Secured({"ROLE_USER", "ROLE_GUEST", "AFTER_ACL_COLLECTION_READ"})
    public List<Message> listMessages() { 
        return new ArrayList<Message>(messages.values()); 
    } 
 
    @Transactional
    @Secured({"ROLE_USER"}) 
    public synchronized void postMessage(Message message) { 
        message.setId(System.currentTimeMillis()); 
        messages.put(message.getId(), message);
        
        //5-7. Handling Domain Object Security
        //create an ACL for a message when it is posted
        ObjectIdentity oid = new ObjectIdentityImpl(Message.class, message.getId()); 
        MutableAcl acl = mutableAclService.createAcl(oid); 
        acl.insertAce(0, BasePermission.ADMINISTRATION, new PrincipalSid(message.getAuthor()), true); 
        acl.insertAce(1, BasePermission.DELETE, new GrantedAuthoritySid("ROLE_ADMIN"), true); 
        acl.insertAce(2, BasePermission.READ, new GrantedAuthoritySid("ROLE_USER"), true); 
        mutableAclService.updateAcl(acl);
    }
    
    @Transactional
    //5-5. Securing Methods with Annotations
    //@Secured({"ROLE_ADMIN", "IP_LOCAL_HOST"}) 
    //5-7. Handling Domain Object Security
    @Secured("ACL_MESSAGE_DELETE")
    public synchronized void deleteMessage(Message message) { 
        messages.remove(message.getId());
        
        //delete the ACL when this message is deleted
        ObjectIdentity oid = new ObjectIdentityImpl(Message.class, message.getId()); 
        mutableAclService.deleteAcl(oid, false);
    } 
 
    //@Secured({"ROLE_USER", "ROLE_GUEST"}) 
    @Secured({"ROLE_USER", "ROLE_GUEST", "AFTER_ACL_READ"})
    public Message findMessageById(Long messageId) { 
        return messages.get(messageId); 
    } 
}