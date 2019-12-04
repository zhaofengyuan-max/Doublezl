package com.niit.dao;

import java.util.List;

public interface ICourseDao {
//	List<Object[]> getCoursesByyear(String teaNo, String years);
	List<Object[]> getCourses(String teaNo);
	List<Object[]> getBatchScore(String teaNo, String years);
	
	//李婵
	List<Object[]> getPersonKebiao(String srollno,String term,String years,int weeks);

}
