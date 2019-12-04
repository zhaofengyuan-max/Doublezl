package com.niit.dao;

import com.niit.dao.IStudentDao;
import com.niit.entity.Student;
import com.niit.entity.Teacher;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDao implements IStudentDao { 
	
	@Resource(name="ht")
	private HibernateTemplate ht;
	
	@Override
    public Student getOneById(String rollno) {
    	Student s = (Student) ht.get(Student.class,rollno);
		return s;
    }  
	
	@Override
    public void update(Student s) {
	    ht.update(s);
   }
	
	   @Override
	    public List<Object[]> getStudentScore(String srollno, String years, String term) { 
	    	 String hql=" select a.stuNo,a.stuName,b.courseName,d.teaName,c.years,c.term,c.usualScore,c.finalScore,c.sumScore" +
	          		" from Student a,Course b,Grade c,Teacher d" +
	          		" where a.stuNo=c.id.stuNo and b.id.courseNo=c.id.courseNo and d.teaNo=c.teaNo" +
	          		" and a.stuNo=? and  c.years=? and c.term=?";
	         @SuppressWarnings("unchecked")
	         List<Object[]> list=(List<Object[]>) ht.find(hql, new Object[]{srollno,years,term});
	         return list;
	    }
	    
	    @Override
	    public List<Object[]> getTeacherByStuNo(String stuNo) { 
	    	String hql=" select distinct a.teaName,a.gender,a.birthdate,a.email,a.acaNo from Teacher a,Student b,Totalcoursetable c" + 
			 		" where a.teaNo=c.teaNo and b.batNo=c.id.batNo and b.stuNo=:stuNo";
	         SessionFactory  sf=ht.getSessionFactory();
	 		 Session s=sf.getCurrentSession();
	 		 Query query = s.createQuery(hql);
	 		 query.setParameter("stuNo", stuNo);
	 	     @SuppressWarnings("unchecked")
	         List<Object[]> list=(List<Object[]>) query.list();
	         System.out.println(list+"----------------");
	         return list;
	    }


//  @Override 
//  public int updateById(String rollno,String stuPwd) {
//      Session session = null;
//      int rows = 0;
//      try {
//          session = HibernateUtil.getSession();
//          Transaction tran = session.beginTransaction();
//          Student s=(Student)session.get(Student.class, rollno);
//          s.setStuPwd(stuPwd); 
//          session.update(s); 
//          tran.commit(); 
//          rows = 1;
//      } catch (Exception e) {
//          e.printStackTrace();
//      } finally {
//          HibernateUtil.close(session); //关闭会话
//      }
//      return rows;
//  }


//    @Override
//    public int update(Student s) {
//        Session session = null;
//        int rows = 0;
//        try {
//            session = HibernateUtil.getSession();
//            Transaction tran = session.beginTransaction();
//            session.update(s); 
//            tran.commit(); 
//            rows = 1;
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            HibernateUtil.close(session); //关闭会话
//        }
//        return rows;
//    }

    


//    @Override 
//    public int updateById(String rollno,String stuPwd) {
//        Session session = null;
//        int rows = 0;
//        try {
//            session = HibernateUtil.getSession();
//            Transaction tran = session.beginTransaction();
//            Student s=(Student)session.get(Student.class, rollno);
//            s.setStuPwd(stuPwd); 
//            session.update(s); 
//            tran.commit(); 
//            rows = 1;
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            HibernateUtil.close(session); //关闭会话
//        }
//        return rows;
//    }
//
 

//    @Override 
//    public List<Object[]> getStudentScoreCr(String srollno, String years, String term) {
//        Session session = HibernateUtil.getSession();
//        Query query = session.createQuery(" select a.stuNo,a.stuName,b.courseName,d.teaName,c.years,c.term,c.usualScore,c.finalScore,c.sumScore" +
//" from Student a,Course b,Grade c,Teacher d" +
//" where a.stuNo=c.id.stuNo and b.courseNo=c.id.courseNo and d.teaNo=c.teaNo" +
//" and a.stuNo=:stuNo and  c.years=:years and c.term=:term and c.sumScore<60");
//        query.setParameter("stuNo", srollno);   
//        query.setParameter("years", years);
//        query.setParameter("term",  term);
//        List<Object[]> list = query.list();   
//        for(Object[] o:list)
//            System.out.println(o[0]+"------"+o[1]);
//        HibernateUtil.close(session);
//        return list;
//    }
//    
//     @Override
//    public List<Object[]> getByStuNo(String stuNo) {
//        Session session = HibernateUtil.getSession();
//        Query query=session.createQuery("select a.stuNo,a.stuName,a.stuGender,b.batName,c.majName,d.acaName,a.addr,a.politicalStatus" +
//" from Student a,Batch b,Major c,Academy d where a.batNo=b.batNo and b.majNo=c.majNo and c.acaNo=d.acaNo and a.stuNo = :stuNo");
//        query.setParameter("stuNo",stuNo);
//        List<Object[]> list = query.list();
//        HibernateUtil.close(session);
//        return list;
//    }
//
//    @Override
//    public int delete(Object[] o) {
//        Session session = null;
//        int rows = 0;
//        try {
//            session = HibernateUtil.getSession();
//            Transaction tran = session.beginTransaction();
//            String stuNo=(String)o[0];
//            Student s = (Student) session.get(Student.class, stuNo);
//            if (o != null) {
//                session.delete(s);
//                tran.commit();
//                rows = 1; 
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            HibernateUtil.close(session);
//        }
//        return rows;
//    }
}

