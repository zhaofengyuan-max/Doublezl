package com.niit.biz;

import java.util.List;

import com.niit.entity.Vedio;
import com.niit.util.PageModel;

public interface IVedioBiz {
	void saveVedio(Vedio v);
	
	List<Vedio> findAllVedio();
	
	Vedio findVedioById(Integer vedioId);
	
	PageModel findVediosWithPageByTeacher(int currentPageNum);
	
	PageModel findVedioWithPage(int num);
	
	void deleteVedioByTeacher(Integer vedioId);

}
