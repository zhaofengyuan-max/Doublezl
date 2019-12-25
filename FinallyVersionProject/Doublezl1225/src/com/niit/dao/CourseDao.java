package com.niit.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CourseDao implements ICourseDao{
	
	@Resource(name="ht")
	private HibernateTemplate ht;

	@Override  
	public List<Object[]> getCourses(String teaNo) {
		String hql="select d.courseName,c.roomType,c.years,c.term,b.batName from Teacher a,Batch b,Totalcoursetable c,Course d" + 
				" where a.teaNo=c.teaNo and b.batNo=c.id.batNo and d.id.courseNo=c.id.courseNo" + 
				" and c.teaNo=?";
		@SuppressWarnings("unchecked")
		List<Object[]> list=(List<Object[]>) ht.find(hql,teaNo);
		return list;
	}

	@Override
	public List<Object[]> getBatchScore(String teaNo, String years) {
		String hql=" select a.stuNo,a.stuName,b.courseName,c.term,c.usualScore,c.finalScore,c.sumScore" +
	        	" from Student a,Course b,Grade c,Teacher d" +
	        	" where a.stuNo=c.id.stuNo and b.id.courseNo=c.id.courseNo and d.teaNo=c.teaNo" +
	        	" and d.teaNo=? and c.years=?";
	   @SuppressWarnings("unchecked")
	   List<Object[]> list=(List<Object[]>) ht.find(hql, new String[] {teaNo,years});
	   return list;
	}

	@Override
    public List<Object[]> getPersonKebiao(String srollno, String term, String years,int weeks) {
    	  String hql=" select a.stuNo,a.stuName,d.courseName,e.teaName,b.term,b.years,c.weeks,c.lseeionTime,c.jieshuType,c.classroomNo,f.building" +
        		" from Student a,Totalcoursetable b,DivideCourseTable c,Course d,Teacher e,Classroom f" +
        		" where a.batNo=b.id.batNo and b.id.courseNo=c.id.courseNo and d.id.courseNo=b.id.courseNo and e.teaNo=b.teaNo and c.classroomNo=f.roomNo" +
        		" and a.stuNo=? and b.term=? and b.years=? and c.weeks=?";
    	  @SuppressWarnings("unchecked")
    	  List<Object[]> list = (List<Object[]>)ht.find(hql,new Object[]{srollno,term,years,weeks});
    	  return list;
    }

}
