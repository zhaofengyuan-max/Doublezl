package com.niit.biz;

import com.niit.entity.Message;
import com.niit.util.PageModel;



public interface IMessageBiz {
	
	PageModel findMessagesWithPageByTeacher(int currentPageNum);
	
	void replayMessage(String messageid, String newReplay);
	
	PageModel findMessagesWithPage(int currentNum, int stuId);
	
	void addMessage(Message msg);
	
	Message findMessageById(String id);
  
}
