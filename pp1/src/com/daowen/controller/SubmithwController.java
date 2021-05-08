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
public class SubmithwController extends SimpleController {

	@Autowired
	private SubmithwService submithwSrv=null;
	@Autowired
	private  HomeworkService hwSrv=null;
	@Autowired
	private AttachementService attrSrv=null;
	@Override
	@RequestMapping("/admin/submithwmanager.do")
	public void mapping(HttpServletRequest req, HttpServletResponse reps) {
		
       mappingMethod(req,reps);
	}
	

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void piyue() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Submithw submithw =submithwSrv.load(new Integer(id));
		if (submithw == null)
			return;
		String defen = request.getParameter("defen");
		String piyue = request.getParameter("piyue");
		//已批阅
		submithw.setStatus(2);
		//得分
		if(defen!=null)
		   submithw.setDefen(new Integer(defen));
		//批阅
		submithw.setPiyue(piyue);
		//批阅时间
		submithw.setPytime(new Date());
		
		submithwSrv.update(submithw);
		
		if (forwardurl == null) {
			forwardurl = "/admin/submithwmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	
	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		submithwSrv.delete(" where id=" + id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String xuehao = request.getParameter("xuehao");
		String name = request.getParameter("name");
		String submittime = request.getParameter("submittime");
		String des = request.getParameter("des");
		String hwid = request.getParameter("hwid");
		String hwtitle = request.getParameter("hwtitle");
		String tno = request.getParameter("tno");
		String tname = request.getParameter("tname");

		SimpleDateFormat sdfsubmithw = new SimpleDateFormat("yyyy-MM-dd");
		Submithw submithw = new Submithw();
		submithw.setXuehao(xuehao == null ? "" : xuehao);
		submithw.setName(name == null ? "" : name);
		if (submittime != null) {
			try {
				submithw.setSubmittime(sdfsubmithw.parse(submittime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			submithw.setSubmittime(new Date());
		}
		submithw.setDes(des == null ? "" : des);
		submithw.setHwid(hwid == null ? 0 : new Integer(hwid));
		submithw.setHwtitle(hwtitle == null ? "" : hwtitle);
		submithw.setTno(tno == null ? "" : tno);
		submithw.setTname(tname == null ? "" : tname);
		submithw.setPiyue("");
		submithw.setPytime(new Date());
		// 等待批阅
		submithw.setStatus(1);
		submithwSrv.save(submithw);
		// 保存附件
		attachments(request, response, new Integer(submithw.getId()).toString());
		if (forwardurl == null) {
			forwardurl = "/admin/submithwmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 内部附件支持*********************
	 *******************************************************/
	public void attachments(HttpServletRequest request,
			HttpServletResponse response, String belongid) {
		attrSrv.delete(MessageFormat.format(
				" where belongid=''{0}'' and belongtable=''submithw'' ",
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
			a.setBelongtable("submithw");
			a.setUrl(request.getContextPath() + "/upload/temp/"
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
		Submithw submithw = submithwSrv.load(new Integer(id));
		if (submithw == null)
			return;
		String xuehao = request.getParameter("xuehao");
		String name = request.getParameter("name");
		String submittime = request.getParameter("submittime");
		String des = request.getParameter("des");
		String hwid = request.getParameter("hwid");
		SimpleDateFormat sdfsubmithw = new SimpleDateFormat("yyyy-MM-dd");
		submithw.setXuehao(xuehao);
		submithw.setName(name);
		if (submittime != null) {
			try {
				submithw.setSubmittime(sdfsubmithw.parse(submittime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		submithw.setDes(des);
		submithw.setHwid(hwid == null ? 0 : new Integer(hwid));
		submithwSrv.update(submithw);
		attachments(request, response, new Integer(submithw.getId()).toString());
		
		if (forwardurl == null) {
			forwardurl = "/admin/submithwmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		String hwid = request.getParameter("hwid");
		if (hwid != null) {
			Homework homework = hwSrv.load("where id="
					+ hwid);
			if (homework != null) {
				request.setAttribute("homework", homework);
			}
		}

		dispatchParams(request, response);

		if (id != null) {
			Submithw submithw = submithwSrv.load("where id="
					+ id);
			if (submithw != null) {
				request.setAttribute("submithw", submithw);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/submithwadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String xuehao = request.getParameter("xuehao");
		String hwtitle=request.getParameter("hwtitle");
		if (xuehao != null)
			filter += "  and xuehao like '%" + xuehao + "%'  ";
		//
		if(hwtitle!=null)
			filter+=" and hwtitle like '%"+hwtitle+"%'";
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
		List<Submithw> listsubmithw =submithwSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = submithwSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listsubmithw", listsubmithw);
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
			forwardurl = "/admin/submithwmanager.jsp";
		}
		forward(forwardurl);
	}

}
