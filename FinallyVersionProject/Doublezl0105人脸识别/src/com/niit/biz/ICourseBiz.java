package com.niit.biz;

import java.util.List;

public interface ICourseBiz {
	List<Object[]> getCourses(String teaNo);
	
	List<Object[]> getBatchScore(String teaNo, String years);
	
	//李婵
	List<Object[]> personCourseListI(String srollno,String term,String years,int weeks);  

}
