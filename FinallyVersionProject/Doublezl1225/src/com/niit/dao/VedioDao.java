package com.niit.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.entity.Vedio;
import com.niit.util.PageModel;

@Repository
public class VedioDao implements IVedioDao {

	@Resource(name="ht")
	private HibernateTemplate ht;
	

	@Override
	public void saveVedio(Vedio v) {
		ht.save(v);
	}


	@Override
	public List<Vedio> findAllVedio() {
		String findhql="from Vedio order by vedioId desc";
		SessionFactory  sf=ht.getSessionFactory();
		Session s=sf.getCurrentSession();
		Query query = s.createQuery(findhql);
		query.setFirstResult(0);  
	    query.setMaxResults(4);
	    @SuppressWarnings("unchecked")
		List<Vedio> vedioList=(List<Vedio>)query.list();
		return  vedioList;
	}


	@Override
	public Vedio findVedioById(Integer vedioId) {
		Vedio vedio=ht.get(Vedio.class, vedioId);
		return vedio;
		
	}

	@Override
	public int findAllRecords() {
		String hql="select count(*)from Vedio";
		Long count=(Long) ht.find(hql).listIterator().next();
		System.out.println("------------"+count.intValue());
		return count.intValue();
	}

	@Override
	public List<Vedio> findVediosWithPageByTeacher(int startIndex, int pageSize) {
		String findhql="from Vedio";
		SessionFactory  sf=ht.getSessionFactory();
		Session s=sf.getCurrentSession();
		Query query = s.createQuery(findhql);
		query.setFirstResult(startIndex);
	    query.setMaxResults(pageSize);
	    List<Vedio> list=(List<Vedio>)query.list();
		return list;
	}


	@Override
	public List<Vedio> findVedioWithPage(int i, int j) {
		String findhql="from Vedio";
		SessionFactory  sf=ht.getSessionFactory();
		Session s=sf.getCurrentSession();
		Query query = s.createQuery(findhql);
		query.setFirstResult(j);
	    query.setMaxResults(j);
	    @SuppressWarnings("unchecked")
		List<Vedio> list=(List<Vedio>)query.list();
		return list;
	}


	@Override
	public void deleteVedioByTeacher(Integer vedioId) {
		Vedio vedio=ht.get(Vedio.class, vedioId);
		ht.delete(vedio);
	}



}
