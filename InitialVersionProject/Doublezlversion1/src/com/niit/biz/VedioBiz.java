package com.niit.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.niit.dao.IVedioDao;
import com.niit.entity.Vedio;
import com.niit.util.PageModel;

@Transactional
@Service
public class VedioBiz implements IVedioBiz {
	
	@Resource(name="vedioDao")  
	private IVedioDao vedioDao;

	@Override
	public void saveVedio(Vedio v) {
		vedioDao.saveVedio(v);

	}

	@Override
	public List<Vedio> findAllVedio() {
		return vedioDao.findAllVedio();
	}

	@Override
	public Vedio findVedioById(Integer vedioId) {
		return vedioDao.findVedioById(vedioId);
	}

	@Override
	public PageModel findVediosWithPageByTeacher(int currentPageNum) {
		int totalRecords=vedioDao.findAllRecords();
//		System.out.println("总记录数"+"----"+totalRecords);
		PageModel pm=new PageModel(currentPageNum, totalRecords, 5);
		List<Vedio> list=vedioDao.findVediosWithPageByTeacher(pm.getStartIndex(),pm.getPageSize());
//		System.out.println("根据页面查找的页面"+list);
		pm.setList(list);
//		System.out.println("页面对象"+"-----------------");
//		pm.setUrl("vedio/findVediosWithPageByTeacher");
		return pm;
	}

	@Override
	public PageModel findVedioWithPage(int num) {
		int totalRecords=vedioDao.findAllRecords(); 
		PageModel pm=new PageModel(num,totalRecords,5);
		List<Vedio> list=vedioDao.findVedioWithPage((num-1)*5,5);
		pm.setList(list);
		//3.为PageModel关联url属性
//		pm.setUrl("vedio?method=findVedioWithPage");
		return pm;
	}

	@Override
	public void deleteVedioByTeacher(Integer vedioId) {
		vedioDao.deleteVedioByTeacher(vedioId);
		
	}

}
