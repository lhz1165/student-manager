package com.daowen.controller;

import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.daowen.entity.*;
import com.daowen.service.*;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 特困申请控制
 *
 */
@Controller
public class TekunController extends SimpleController {
	@Autowired
	private TekunService tekunSrv = null;

	@Override
	@RequestMapping("/admin/tekunmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	public void shenpi() {
		String id = request.getParameter("id");
		String forwardurl = request.getParameter("forwardurl");
		String status = request.getParameter("state");
		String reply = request.getParameter("reply");
		String shenpiren = request.getParameter("shenpiren");
		int statuscode = 3;
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		if (id == null)
			return;
		Tekun tekun = tekunSrv.load(" where id=" + id);
		if (tekun == null)
			return;
		if (status != null)
			statuscode = Integer.parseInt(status);
		tekun.setState(statuscode);
		tekunSrv.update(tekun);
		if (forwardurl == null) {
			forwardurl = "/admin/tekunmanager.do?actiontype=get";
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
		tekunSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String applytime = request.getParameter("applytime");
		String state = request.getParameter("state");
		String applyor = request.getParameter("applyor");
		String appname = request.getParameter("appname");
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdftekun = new SimpleDateFormat("yyyy-MM-dd");
		Tekun tekun = new Tekun();
		tekun.setTitle(title == null ? "" : title);
		if (applytime != null) {
			try {
				tekun.setApplytime(sdftekun.parse(applytime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			tekun.setApplytime(new Date());
		}
		tekun.setState(1);
		tekun.setApplyor(applyor == null ? "" : applyor);
		tekun.setAppname(appname == null ? "" : appname);
		tekun.setDcontent(dcontent == null ? "" : dcontent);
		tekun.setArvid(0);
		tekunSrv.save(tekun);
		if (forwardurl == null) {
			forwardurl = "/admin/tekunmanager.do?actiontype=get";
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
		Tekun tekun = tekunSrv.load(new Integer(id));
		if (tekun == null)
			return;
		String title = request.getParameter("title");
		String applytime = request.getParameter("applytime");
		String applyor = request.getParameter("applyor");
		String appname = request.getParameter("appname");
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdftekun = new SimpleDateFormat("yyyy-MM-dd");
		tekun.setTitle(title);
		if (applytime != null) {
			try {
				tekun.setApplytime(sdftekun.parse(applytime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		tekun.setApplyor(applyor);
		tekun.setAppname(appname);
		tekun.setDcontent(dcontent);
		tekunSrv.update(tekun);
		if (forwardurl == null) {
			forwardurl = "/admin/tekunmanager.do?actiontype=get";
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
			Tekun tekun = tekunSrv.load("where id=" + id);
			if (tekun != null) {
				request.setAttribute("tekun", tekun);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/tekunadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		String applyor = request.getParameter("applyor");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		if (applyor != null)
			filter += " and applyor='" + applyor + "'";
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
		List<Tekun> listtekun = tekunSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = tekunSrv
				.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listtekun", listtekun);
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
			forwardurl = "/admin/tekunmanager.jsp";
		}
		forward(forwardurl);
	}
}
