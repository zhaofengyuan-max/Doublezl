package com.niit.dao;

import java.util.List;

import com.niit.entity.Message;
import com.niit.entity.Student;


 

public interface IMessageDao {
	int findAllRecords();
	
	List<Message> findMessagesWithPageByTeacher(int startIndex, int pageSize);
	
	void replayMessage(String id, String replay);
	
	List<Message> findMessagesWithPage(int startIndex, int pageSize,int stuId);
	
	int findAllRecordsByStuId(int stuId);
	
	void addMessage(Message msg);
	
	Message findMessageById(String id);

}
