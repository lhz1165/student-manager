package com.daowen.controller;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Kecheng;
import com.daowen.service.KechengService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 课程控制
 *
 */
@Controller
public class KechengController extends SimpleController {
	@Autowired
	private KechengService kechengSrv = null;

	@Override
	@RequestMapping("/admin/kechengmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}
	
	
	
	private void waitXuanke() {
		String filter = "where status='选课中' ";
		String subname = request.getParameter("subname");
		if (subname != null)
			filter += "  and subname like '%" + subname + "%'  ";
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
		List<Kecheng> listkecheng = kechengSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = kechengSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listkecheng", listkecheng);
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
			forwardurl = "/admin/kechengmanager.jsp";
		}
		forward(forwardurl);
		
	}
	
private void endXuanke() {
		
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Kecheng kecheng = kechengSrv.load(new Integer(id));
		if (kecheng == null)
			return;
		
		kecheng.setStatus("选课结束");
		
		kechengSrv.update(kecheng);
		
		if (forwardurl == null) {
			forwardurl = "/admin/kechengmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	private void startXuanke() {
		
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Kecheng kecheng = kechengSrv.load(new Integer(id));
		if (kecheng == null)
			return;
		
		kecheng.setStatus("选课中");
		
		kechengSrv.update(kecheng);
		
		if (forwardurl == null) {
			forwardurl = "/admin/kechengmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids) + ")";
		System.out.println("sql=" + SQL);
		kechengSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String subname = request.getParameter("subname");
		String subno = request.getParameter("subno");
		String xuefen = request.getParameter("xuefen");
		String des = request.getParameter("des");
		String tno=request.getParameter("tno");
		String tname=request.getParameter("tname");
		SimpleDateFormat sdfkecheng = new SimpleDateFormat("yyyy-MM-dd");
		Kecheng kecheng = new Kecheng();
		kecheng.setSubname(subname == null ? "" : subname);
		kecheng.setSubno(subno == null ? "" : subno);
		kecheng.setXuefen(xuefen == null ? "" : xuefen);
		kecheng.setDes(des == null ? "" : des);
		kecheng.setTno(tno);
		kecheng.setTname(tname);
		kecheng.setStatus("选课中");
		kecheng.setPjcount(0);
		kecheng.setTotalscore(0);
		kecheng.setAvgscore(0);
		// 产生验证
		Boolean validateresult = kechengSrv.isExist(MessageFormat.format("where subname=''{0}'' or subno=''{1}''", subname,subno));
		if (validateresult) {
			try {
				request.setAttribute("errormsg",
						"<label class='error'>科目名称或编号重复</label>");
				request.setAttribute("kecheng", kecheng);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		kechengSrv.save(kecheng);
		if (forwardurl == null) {
			forwardurl = "/admin/kechengmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Kecheng kecheng = kechengSrv.load(new Integer(id));
		if (kecheng == null)
			return;
		String subname = request.getParameter("subname");
		String subno = request.getParameter("subno");
		String xuefen = request.getParameter("xuefen");
		String des = request.getParameter("des");
		SimpleDateFormat sdfkecheng = new SimpleDateFormat("yyyy-MM-dd");
		kecheng.setSubname(subname);
		kecheng.setSubno(subno);
		kecheng.setXuefen(xuefen);
		kecheng.setDes(des);
		kechengSrv.update(kecheng);
		if (forwardurl == null) {
			forwardurl = "/admin/kechengmanager.do?actiontype=get";
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
		dispatchParams(request, response);
		if (id != null) {
			Kecheng kecheng = kechengSrv.load("where id=" + id);
			if (kecheng != null) {
				request.setAttribute("kecheng", kecheng);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/kechengadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void getChoose() {
		String SQL = "";
		String stno = request.getParameter("stno");
		String subname = request.getParameter("subname");
		SQL="select kc.* from kecheng kc ,xuanke xk where kc.subno=xk.subno ";
		if (stno != null)
			SQL+=" and xk.stno='"+stno+"'";
		
		if (subname != null)
			SQL += "  and kc.subname like '%" + subname + "%'  ";
		//
		
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		
		List<Kecheng> listkecheng = kechengSrv.query(SQL);

		request.setAttribute("listkecheng", listkecheng);
//		
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/kechengmanager.jsp";
		}
		forward(forwardurl);
	}
	
	public void get() {
		String filter = "where 1=1 ";
		String subname = request.getParameter("subname");
		String tno=request.getParameter("tno");
		if (subname != null)
			filter += "  and subname like '%" + subname + "%'  ";
		if (tno != null)
			filter += "  and tno='" + tno + "'  ";
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
		List<Kecheng> listkecheng = kechengSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = kechengSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listkecheng", listkecheng);
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
			forwardurl = "/admin/kechengmanager.jsp";
		}
		forward(forwardurl);
	}
}
