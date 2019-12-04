package com.niit.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.entity.Message;
import com.niit.entity.Student;
import com.niit.entity.Teacher;

@Repository
public class MessageDao implements IMessageDao {
	
	@Resource(name="ht")
	private HibernateTemplate ht;

	@Override
	public int findAllRecords() {
		String hql="select count(*)from Message";
		Long count=(Long) ht.find(hql).listIterator().next();
		System.out.println("------------"+count.intValue());
		return count.intValue();  
	}  
 
	@Override
	public List<Message> findMessagesWithPageByTeacher(int startIndex, int pageSize) {
		String findhql="from Message order by LeaveWordTime desc";
		SessionFactory  sf=ht.getSessionFactory();
		Session s=sf.getCurrentSession();
		Query query = s.createQuery(findhql);
		query.setFirstResult(startIndex);
	    query.setMaxResults(pageSize);
	    @SuppressWarnings("unchecked")
		List<Message> list=(List<Message>)query.list();
		return list;
	}

	@Override
	public void replayMessage(String messageid, String newReplay) {
		String hql ="update Message set Replay=:newReplay,ReplayTime=:replayTime "
				+ " where MessageId=:messageId";
		SessionFactory  sf=ht.getSessionFactory();
		Session s=sf.getCurrentSession();
		Query query = s.createQuery(hql);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String replayTime=sdf.format(new Date());
		query.setParameter("newReplay",newReplay);
		query.setParameter("messageId",messageid);
		query.setParameter("replayTime",replayTime);
		query.executeUpdate();

		
	}

	@Override
	public List<Message> findMessagesWithPage(int startIndex, int pageSize, int stuId) {
//		FROM t_message  WHERE stuId=?  ORDER BY leaveWordTime DESC LIMIT  ? , ?
		String hql="from Message where stuNo=:stuNo order by LeaveWordTime desc";
		SessionFactory  sf=ht.getSessionFactory();
		Session s=sf.getCurrentSession();
		Query query = s.createQuery(hql);
		query.setParameter("stuNo", stuId);
		query.setFirstResult(startIndex);
	    query.setMaxResults(pageSize);
	    @SuppressWarnings("unchecked")
		List<Message> list=(List<Message>)query.list();
		return list;
	}

	@Override
	public int findAllRecordsByStuId(int stuId) {
		String hql="select count(*) from Message where stuNo=:stuNo";
		SessionFactory  sf=ht.getSessionFactory();
		Session s=sf.getCurrentSession();
		Query query = s.createQuery(hql);
		query.setParameter("stuNo",stuId);
		Long count=(Long) (query.iterate().next());
		System.out.println("------------"+count.intValue());
		return count.intValue(); 
	}

	@Override
	public void addMessage(Message msg) {
		ht.save(msg);
		
	}

	@Override
	public Message findMessageById(String id) {
		Message message = (Message) ht.get(Message.class,id);
		return message;
	}

}
