package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Fudao;
import com.daowen.jdbc.simplecrud.DataTable;
import com.daowen.service.BanjiService;
import com.daowen.service.ComplexQueryService;
import com.daowen.service.FudaoService;
import com.daowen.service.TeacherService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 辅导班级控制
 *
 */
@Controller
public class FudaoController extends SimpleController {
	@Autowired
	private FudaoService fudaoSrv = null;
	@Autowired
	private TeacherService teacherSrv = null;
	@Autowired
	private BanjiService banjiSrv = null;

	@Override
	@RequestMapping("/admin/fudaomanager.do")
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
		fudaoSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String tid = request.getParameter("tid");
		String bjid = request.getParameter("bjid");
		SimpleDateFormat sdffudao = new SimpleDateFormat("yyyy-MM-dd");
		Fudao fudao = new Fudao();
		fudao.setTid(tid == null ? 0 : new Integer(tid));
		fudao.setBjid(bjid == null ? "" : bjid);
		// 产生验证
		Boolean validateresult = fudaoSrv.isExist("where bjid='" + bjid + "'");
		if (validateresult) {

			request.setAttribute("errormsg",
					"<label class='error'>该班级已经设置了辅导员</label>");
			request.setAttribute("fudao", fudao);
			request.setAttribute("actiontype", "save");
			List<Object> tid_datasource = teacherSrv.getEntity("");
			request.setAttribute("tid_datasource", tid_datasource);
			List<Object> bjid_datasource = banjiSrv.getEntity("");
			request.setAttribute("bjid_datasource", bjid_datasource);
			forward(errorurl);

			return;
		}
		fudaoSrv.save(fudao);
		if (forwardurl == null) {
			forwardurl = "/admin/fudaomanager.do?actiontype=get";
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
		Fudao fudao = fudaoSrv.load(new Integer(id));
		if (fudao == null)
			return;
		String tid = request.getParameter("tid");
		String bjid = request.getParameter("bjid");
		SimpleDateFormat sdffudao = new SimpleDateFormat("yyyy-MM-dd");
		fudao.setTid(tid == null ? 0 : new Integer(tid));
		fudao.setBjid(bjid);
		fudaoSrv.update(fudao);
		if (forwardurl == null) {
			forwardurl = "/admin/fudaomanager.do?actiontype=get";
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
			Fudao fudao = fudaoSrv.load("where id=" + id);
			if (fudao != null) {
				request.setAttribute("fudao", fudao);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> tid_datasource = teacherSrv
				.getEntity("where zhiwei='辅导员'");
		request.setAttribute("tid_datasource", tid_datasource);
		List<Object> bjid_datasource = banjiSrv.getEntity("");
		request.setAttribute("bjid_datasource", bjid_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/fudaoadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {

		ComplexQueryService cqSrv = new ComplexQueryService();

		String tno = request.getParameter("tno");

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
		String sql = " select fd.id, t.tno,t.name as tname,b.name as bname from fudao fd ,banji b,teacher t where fd.bjid=b.id and fd.tid=t.id   ";
		if (tno != null)
			sql += " and t.tno='" + tno + "'";

		DataTable dt = cqSrv.query(sql, pageindex, pagesize);
		int recordscount = cqSrv.queryRecordCount(sql);

		request.setAttribute("listFudao", dt);
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
			forwardurl = "/admin/fudaomanager.jsp";
		}
		forward(forwardurl);
	}
}
