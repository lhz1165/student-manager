package com.daowen.controller;

import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Attachement;
import com.daowen.entity.Homework;
import com.daowen.entity.Submithw;
import com.daowen.service.AttachementService;
import com.daowen.service.HomeworkService;
import com.daowen.service.SubmithwService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class HomeworkController extends SimpleController {

	@Autowired
	private HomeworkService hwSrv=null;
	@Autowired
	private SubmithwService submithwSrv=null;
	@Autowired
	private AttachementService attrSrv=null;
	@Override
	@RequestMapping("/admin/homeworkmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		
		mappingMethod(request,response);

	}
	
	public void getSubmit() {
		//
		String id = request.getParameter("id");
		
		if (id != null) {
			Homework homework = hwSrv.load("where id="
					+ id);
			if (homework != null) {
				request.setAttribute("homework", homework);
			}
			
		}
		dispatchParams(request, response);
		String filter=MessageFormat.format("where hwid={0} ",id);
		
		List<Submithw> listsubmithw =submithwSrv.getEntity(filter);
		
		request.setAttribute("listsubmithw", listsubmithw);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/homeworkdetails.jsp";
		}
		forward(forwardurl);
	}
	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		hwSrv.delete(" where id=" + id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String tno = request.getParameter("tno");
		String tname = request.getParameter("tname");
		String pubtime = request.getParameter("pubtime");
		String des = request.getParameter("des");
		SimpleDateFormat sdfhomework = new SimpleDateFormat("yyyy-MM-dd");
		Homework homework = new Homework();
		homework.setTitle(title == null ? "" : title);
		homework.setTno(tno == null ? "" : tno);
		homework.setTname(tname == null ? "" : tname);
		if (pubtime != null) {
			try {
				homework.setPubtime(sdfhomework.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			homework.setPubtime(new Date());
		}
		homework.setDes(des == null ? "" : des);
		hwSrv.save(homework);
		
		if (forwardurl == null) {
			forwardurl = "/admin/homeworkmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 内部附件支持*********************
	 *******************************************************/
	public void attachments(HttpServletRequest request,
			HttpServletResponse response, String belongid) {
		attrSrv.delete(MessageFormat.format(" where belongid=''{0}'' and belongtable=''homework'' ",
				belongid));
		String[] photos = request.getParameterValues("fileuploaded");
		if (photos == null)
			return;
		for (int i = 0; i < photos.length; i++) {
			Attachement a = new Attachement();
			a.setType("images");
			a.setPubtime(new Date());
			a.setBelongfileldname("id");
			a.setFilename(photos[i]);
			a.setBelongid(belongid);
			a.setBelongtable("homework");
			a.setUrl(request.getContextPath()+ "/upload/temp/"
					+ a.getFilename());
			a.setTitle(a.getFilename());
			attrSrv.save(a);
		}
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Homework homework = hwSrv.load(new Integer(id));
		if (homework == null)
			return;
		String title = request.getParameter("title");
		String tno = request.getParameter("tno");
		String tname = request.getParameter("tname");
		String pubtime = request.getParameter("pubtime");
		String des = request.getParameter("des");
		SimpleDateFormat sdfhomework = new SimpleDateFormat("yyyy-MM-dd");
		homework.setTitle(title);
		homework.setTno(tno);
		homework.setTname(tname);
		if (pubtime != null) {
			try {
				homework.setPubtime(sdfhomework.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		homework.setDes(des);
		hwSrv.update(homework);
		
		if (forwardurl == null) {
			forwardurl = "/admin/homeworkmanager.do?actiontype=get";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Homework homework =hwSrv.load("where id="
					+ id);
			if (homework != null) {
				request.setAttribute("homework", homework);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/homeworkadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String tno=request.getParameter("tno");
		String title = request.getParameter("title");
		
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		if(tno!=null)
			filter+=" and tno='"+tno+"'";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Homework> listhomework =hwSrv.getPageEntitys(filter,pageindex, pagesize);
		int recordscount = hwSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listhomework", listhomework);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/homeworkmanager.jsp";
		}
		forward(forwardurl);
	}
	
	
	

}
