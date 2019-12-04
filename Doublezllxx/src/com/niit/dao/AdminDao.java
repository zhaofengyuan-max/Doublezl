package com.niit.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.entity.Academy;
import com.niit.entity.Admin;
import com.niit.entity.Student;
@Repository
public class AdminDao implements IAdminDao{
	
	@Resource(name="ht")
	private HibernateTemplate ht;

	@Override
	public Admin getAdminById(String id) {
		
		return ht.get(Admin.class, id);
	}

	@Override
	public List<Object[]> getAdminStu(String acaName, String majName, String batName, String stuNo) {
		
		System.out.println("dddd");
		String hql="select a.stuNo,a.stuName,a.stuGender,c.batName,d.majName,b.acaName,a.politicalStatus" + 
				" from Student a,Academy b,Batch c,Major d" + 
				" where a.batNo=c.batNo and c.majNo=d.majNo and d.acaNo=b.acaNo" + 
				" and a.stuNo=? and b.acaName=? and c.batName=? and  d.majName=?";
		List<Object[]> list=(List<Object[]>) ht.find(hql, new String[] {stuNo,acaName,batName,majName});
		
		
		return list;
	}

	@Override
	public int deleStu(String stuNO) {
	 Student stu1=ht.get(Student.class, stuNO);
		ht.delete(stu1);
		Student stu2=ht.get(Student.class, stuNO);
		if(stu2!=null) {
			return 0;
		}else {
			return 1;
		}
		
	}

	@Override
	public List<Object[]> getAdminMaj(String acaName) {
		System.out.println(acaName);
		String hql="select b.majNo,b.majName,a.acaName,b.majDesc"+
				 " from Academy a, Major b"+
				 " where b.acaNo=a.acaNo"+
				 " and a.acaName=?"; 
		List<Object[]> list=(List<Object[]>) ht.find(hql,new String[] {acaName});
		return list;
	}


	@Override
	public List<Object[]> getAdminTea(String acaName) {
	       String hql="select b.teaNo,b.teaName,b.teaPass,b.gender,a.acaName,b.birthdate,b.email"
	          		+ " from Academy a,Teacher b"
	          		+ " where a.acaNo=b.acaNo"
	          		+ " and a.acaName=?";
	       List<Object[]> list = (List<Object[]>) ht.find(hql, new String[] {acaName});
		return list;
	}

	@Override
	public List<Object[]> getAdminBat(String acaName, String majName) {
		System.out.println(acaName+"--"+majName);
       String hql="select c.batNo,c.batName,c.batNum,b.majName,a.acaName"
       		+ " from Academy a,Major b,Batch c"
       		+ " where c.majNo=b.majNo and b.acaNo=a.acaNo"
       		+ " and a.acaName=? and b.majName=?";
       List<Object[]> list=(List<Object[]>) ht.find(hql,new String[] {acaName,majName});
		return list;
	}

	@Override
	public List<Object[]> getAdminClass(String buliding) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Academy> getAdminAca() {
		List<Academy> list=	ht.loadAll(Academy.class);
		return list;
	}

	@Override
	public int deleAca(String acaNo) {
		Academy academy1=ht.get(Academy.class, acaNo);
		ht.delete(academy1);
		Academy academy2=ht.get(Academy.class, acaNo);
		if(academy2!=null) {
			return 0;
		}else {
			return 1;
		}
	}


	
	

}
