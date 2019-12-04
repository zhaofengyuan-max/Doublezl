package com.niit.dao;

import java.util.List;

import com.niit.entity.Academy;
import com.niit.entity.Admin;

public interface IAdminDao {
	
	public Admin getAdminById(String id);
	public List<Object[]> getAdminStu(String acaNo,String majNo,String batNo,String stuNo);
	public int deleStu(String stuNO);
	public List<Object[]>   getAdminMaj(String acaName);
	public List<Academy> getAdminAca();
	public int deleAca(String acaNo);
	public List<Object[]>   getAdminTea(String acaName);
	public List<Object[]>   getAdminBat(String acaName,String majName);
	public List<Object[]>   getAdminClass(String buliding);
}
