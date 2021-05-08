package com.daowen.controller;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Earlywarn;
import com.daowen.service.EarlywarnService;
import com.daowen.service.StudentService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 *
 * 学生预警控制
 *
 */
@Controller
public class EarlywarnController extends SimpleController {
	@Autowired
	private EarlywarnService earlywarnSrv = null;
	@Autowired
	private StudentService studentSrv = null;

	@Override
	@RequestMapping("/admin/earlywarnmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	public static void main(String[] args) {
		System.out.println("222");
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
		earlywarnSrv.delete(SQL);
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
		String yjtype = request.getParameter("yjtype");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		SimpleDateFormat sdfearlywarn = new SimpleDateFormat("yyyy-MM-dd");
		Earlywarn earlywarn = new Earlywarn();
		earlywarn.setStno(stno == null ? "" : stno);
		earlywarn.setStname(stname == null ? "" : stname);
		earlywarn.setYjtype(yjtype == null ? "" : yjtype);
		earlywarn.setTitle(title == null ? "" : title);
		earlywarn.setContent(content == null ? "" : content);
		earlywarn.setCreatetime(new Date());
		earlywarn.setState(1);
		earlywarnSrv.save(earlywarn);
		if (forwardurl == null) {
			forwardurl = "/admin/earlywarnmanager.do?actiontype=get";
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
		Earlywarn earlywarn = earlywarnSrv.load(new Integer(id));
		if (earlywarn == null)
			return;
		String stno = request.getParameter("stno");
		String stname = request.getParameter("stname");
		String yjtype = request.getParameter("yjtype");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		SimpleDateFormat sdfearlywarn = new SimpleDateFormat("yyyy-MM-dd");
		earlywarn.setStno(stno);
		earlywarn.setStname(stname);
		earlywarn.setYjtype(yjtype);
		earlywarn.setTitle(title);
		earlywarn.setContent(content);
		earlywarnSrv.update(earlywarn);
		if (forwardurl == null) {
			forwardurl = "/admin/earlywarnmanager.do?actiontype=get";
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
			Earlywarn earlywarn = earlywarnSrv.load("where id=" + id);
			if (earlywarn != null) {
				request.setAttribute("earlywarn", earlywarn);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> stno_datasource = studentSrv.getEntity("");
		request.setAttribute("stno_datasource", stno_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/earlywarnadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "  where 1=1 ";
		String title = request.getParameter("title");
		String state=request.getParameter("state");
		String stno=request.getParameter("stno");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		if(stno!=null)
			filter+=MessageFormat.format(" and stno=''{0}'' ",stno);
		if(state!=null)
			filter+=MessageFormat.format(" and state=''{0}'' ", state);

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
		List<Earlywarn> listearlywarn = earlywarnSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = earlywarnSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listearlywarn", listearlywarn);
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
			forwardurl = "/admin/earlywarnmanager.jsp";
		}
		forward(forwardurl);
	}

}
