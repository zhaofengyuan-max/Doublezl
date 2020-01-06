package com.niit.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.niit.dao.IFaceDao;
import com.niit.entity.User;


@Service
public class FaceBiz implements IFaceBiz{
	
	@Resource
	private IFaceDao facedao;

  
	public List<User> selectAllUsers() {
		return facedao.selectAllUsers();
	}

}
