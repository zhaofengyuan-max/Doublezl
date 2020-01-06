package com.niit.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.entity.Academy;
import com.niit.entity.User;

@Repository
public class FaceDao implements IFaceDao {
	
	@Resource(name="ht")
	private HibernateTemplate ht;

	@Override
	public List<User> selectAllUsers() {
		List<User> list=ht.loadAll(User.class);
		return list;
	}

}
