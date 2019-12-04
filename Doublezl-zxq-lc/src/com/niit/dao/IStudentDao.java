package com.niit.dao;

import java.util.List;

import com.niit.entity.Student;

public interface IStudentDao {

//    int insert(Student s);

    void update(Student s);
//    
//    int updateById(String rollno,String pass);
    
//    int delete(String rollno);
//    
    Student getOneById(String rollno);
    
   
    List<Object[]> getStudentScore(String srollno,String years,String term);

    List<Object[]> getTeacherByStuNo(String stuNo);

}
