package com.niit.dao;

import java.util.List;

import com.niit.entity.Vedio;
import com.niit.util.PageModel;

public interface IVedioDao {
	void saveVedio(Vedio v);
	
	List<Vedio> findAllVedio();
	
	Vedio findVedioById(Integer vedioId);
	
	int findAllRecords();
	
	List<Vedio> findVediosWithPageByTeacher(int startIndex, int pageSize);
	
	List<Vedio> findVedioWithPage(int i, int j);
	
	void deleteVedioByTeacher(Integer vedioId);  
	
  
}
