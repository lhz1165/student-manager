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
 * 帮扶记录控制
 *
 */
@Controller
public class BfrecordController extends SimpleController {
	@Autowired
	private BfrecordService bfrecordSrv = null;
	@Autowired
	private PinkunService pinkunSrv = null;
	@Autowired
	private NianduService nianduSrv = null;

	@Override
	@RequestMapping("/admin/bfrecordmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
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
		bfrecordSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String stno = request.getParameter("stno");
		String stname = request.getParameter("stname");
		String xuenian = request.getParameter("xuenian");
		String bftype = request.getParameter("bftype");
		String bfdanwei = request.getParameter("bfdanwei");
		String begdate = request.getParameter("begdate");
		String des = request.getParameter("des");
		SimpleDateFormat sdfbfrecord = new SimpleDateFormat("yyyy-MM-dd");
		Bfrecord bfrecord = new Bfrecord();
		bfrecord.setStno(stno == null ? "" : stno);
		bfrecord.setStname(stname == null ? "" : stname);
		bfrecord.setXuenian(xuenian == null ? "" : xuenian);
		bfrecord.setBftype(bftype == null ? "" : bftype);
		bfrecord.setBfdanwei(bfdanwei == null ? "" : bfdanwei);
		if (begdate != null) {
			try {
				bfrecord.setBegdate(sdfbfrecord.parse(begdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			bfrecord.setBegdate(new Date());
		}
		bfrecord.setDes(des == null ? "" : des);
		bfrecordSrv.save(bfrecord);
		if (forwardurl == null) {
			forwardurl = "/admin/bfrecordmanager.do?actiontype=get";
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
		Bfrecord bfrecord = bfrecordSrv.load(new Integer(id));
		if (bfrecord == null)
			return;
		String stno = request.getParameter("stno");
		String stname = request.getParameter("stname");
		String xuenian = request.getParameter("xuenian");
		String bftype = request.getParameter("bftype");
		String bfdanwei = request.getParameter("bfdanwei");
		String begdate = request.getParameter("begdate");
		String des = request.getParameter("des");
		SimpleDateFormat sdfbfrecord = new SimpleDateFormat("yyyy-MM-dd");
		bfrecord.setStno(stno);
		bfrecord.setStname(stname);
		bfrecord.setXuenian(xuenian);
		bfrecord.setBftype(bftype);
		bfrecord.setBfdanwei(bfdanwei);
		if (begdate != null) {
			try {
				bfrecord.setBegdate(sdfbfrecord.parse(begdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		bfrecord.setDes(des);
		bfrecordSrv.update(bfrecord);
		if (forwardurl == null) {
			forwardurl = "/admin/bfrecordmanager.do?actiontype=get";
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
			Bfrecord bfrecord = bfrecordSrv.load("where id=" + id);
			if (bfrecord != null) {
				request.setAttribute("bfrecord", bfrecord);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> stno_datasource = pinkunSrv.getEntity("");
		request.setAttribute("stno_datasource", stno_datasource);
		List<Object> xuenian_datasource = nianduSrv.getEntity("");
		request.setAttribute("xuenian_datasource", xuenian_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/bfrecordadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String stno = request.getParameter("stno");
		if (stno != null)
			filter += "  and stno like '%" + stno + "%'  ";
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
		List<Bfrecord> listbfrecord = bfrecordSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = bfrecordSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listbfrecord", listbfrecord);
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
			forwardurl = "/admin/bfrecordmanager.jsp";
		}
		forward(forwardurl);
	}
}
