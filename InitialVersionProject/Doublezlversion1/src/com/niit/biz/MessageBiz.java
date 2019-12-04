package com.niit.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.niit.dao.IMessageDao;
import com.niit.entity.Message;
import com.niit.entity.Student;
import com.niit.util.PageModel;


@Service   
public class MessageBiz implements IMessageBiz {
	
	@Resource(name="messageDao")  
	private IMessageDao messageDao;

	@Override
	public PageModel findMessagesWithPageByTeacher(int currentPageNum) {
		int totalRecords=messageDao.findAllRecords();
		PageModel pm=new PageModel(currentPageNum,totalRecords,5);
		List<Message> list=messageDao.findMessagesWithPageByTeacher(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		return pm;
	}

	@Override
	public void replayMessage(String messageid, String newReplay) {
		messageDao.replayMessage(messageid, newReplay);
	}

	@Override
	public PageModel findMessagesWithPage(int currentNum, int stuId) {
		int totalRecords=messageDao.findAllRecordsByStuId(stuId);
		PageModel pm=new PageModel(currentNum,totalRecords,5);
		List<Message> list=messageDao.findMessagesWithPage(pm.getStartIndex(),pm.getPageSize(),stuId);
		pm.setList(list);
		return pm;
	}

	@Override
	public void addMessage(Message msg) {
		messageDao.addMessage(msg);
	}

	@Override
	public Message findMessageById(String id) {
		return messageDao.findMessageById(id);
	}

}
