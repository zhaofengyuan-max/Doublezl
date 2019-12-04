package com.niit.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.niit.dao.IAdminDao;
import com.niit.entity.Academy;
import com.niit.entity.Admin;

@Service
public class AdminBiz implements IAdminBiz {
	@Resource(name="adminDao")
	private IAdminDao  adminDao;

	@Override
	public Admin getAdminById(String id) {
	return adminDao.getAdminById(id);
	}

	@Override
	public List<Object[]> getAdminStu(String acaNo, String majNo, String batNo, String stuNo) {
		return adminDao.getAdminStu(acaNo, majNo, batNo, stuNo);
	}

	@Override
	public int deleStu(String stuNO) {

		return adminDao.deleStu(stuNO);
	}

	@Override
	public List<Object[]> getAdminMaj(String acaName) {
		
		return adminDao.getAdminMaj(acaName);
	}



	@Override
	public List<Object[]> getAdminTea(String acaName) {
		return adminDao.getAdminTea(acaName);
	}

	@Override
	public List<Object[]> getAdminBat(String acaName, String majName) {
		return adminDao.getAdminBat(acaName, majName);
	}

	@Override
	public List<Object[]> getAdminClass(String buliding) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Academy> getAdminAca() {

		
		return adminDao.getAdminAca();
	}

	@Override
	public int deleAca(String acaNo) {
		return adminDao.deleAca(acaNo);
	}

}
