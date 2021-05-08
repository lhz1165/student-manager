package com.daowen.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Leaves;
import com.daowen.service.LeavesService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 控制
 *
 */
@Controller
public class LeavesController extends SimpleController {
	@Autowired
	private LeavesService leavesSrv = null;

	@Override
	@RequestMapping("/admin/leavesmanager.do")
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
		leavesSrv.delete(SQL);
	}

	public void shenpi() {
        String id=request.getParameter("id");
	   String forwardurl=request.getParameter("forwardurl");
	   String  reply=request.getParameter("reply");
	   String  shenpiren=request.getParameter("shenpiren");
       String  status =request.getParameter("status");
       int statuscode=3;
	    //验证错误url
	  String errorurl=request.getParameter("errorurl");  
	   if(id==null)
		   return;
	   Leaves  leaves=leavesSrv.load(" where id="+ id);
	    if(leaves==null)
		   return;
	   if(status!=null)
	          statuscode=Integer.parseInt(status);
	   leaves.setStatus(statuscode);
	   leaves.setReply(reply);
	   leaves.setShenpiren(shenpiren);
	   leavesSrv.update(leaves);
	    if (forwardurl == null) {
			forwardurl = "/admin/leavesmanager.do?actiontype=get";
		}
		redirect(forwardurl);
    }
    

	
	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String zgname = request.getParameter("zgname");
		String accountname = request.getParameter("accountname");
		String begdate = request.getParameter("begdate");
		String enddate = request.getParameter("enddate");
		String status = request.getParameter("status");
		String applydes = request.getParameter("applydes");
		String reply = request.getParameter("reply");
		String shenpiren = request.getParameter("shenpiren");
		String applytime = request.getParameter("applytime");
		String shenpitime = request.getParameter("shenpitime");
		String xtype = request.getParameter("xtype");
		String tianshu = request.getParameter("tianshu");
		SimpleDateFormat sdfleaves = new SimpleDateFormat("yyyy-MM-dd");
		Leaves leaves = new Leaves();
		leaves.setZgname(zgname == null ? "" : zgname);
		leaves.setAccountname(accountname == null ? "" : accountname);
		if (begdate != null) {
			try {
				leaves.setBegdate(sdfleaves.parse(begdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			leaves.setBegdate(new Date());
		}
		if (enddate != null) {
			try {
				leaves.setEnddate(sdfleaves.parse(enddate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			leaves.setEnddate(new Date());
		}
		leaves.setStatus(1);
		leaves.setApplydes(applydes == null ? "" : applydes);
		leaves.setReply(reply == null ? "" : reply);
		leaves.setShenpiren(shenpiren == null ? "" : shenpiren);
		if (applytime != null) {
			try {
				leaves.setApplytime(sdfleaves.parse(applytime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			leaves.setApplytime(new Date());
		}
		if (shenpitime != null) {
			try {
				leaves.setShenpitime(sdfleaves.parse(shenpitime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			leaves.setShenpitime(new Date());
		}
		leaves.setXtype(xtype == null ? "" : xtype);
		leaves.setTianshu(tianshu == null ? 0 : new Integer(tianshu));
		boolean validateresult=leaves.getEnddate().before(leaves.getBegdate());
		if (validateresult) {
			try {
				request.setAttribute("errormsg",
						"<label class='error'>请假结束日期不能早于开始日期</label>");
				request.setAttribute("leaves", leaves);
				request.setAttribute("actiontype", "save");
				request.setAttribute("flag", "1");
				dispatchParams(request, response);
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		
		
		leavesSrv.save(leaves);
		
		 if (forwardurl == null) {
				forwardurl = "/admin/leavesmanager.do?actiontype=get";
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
		Leaves leaves =leavesSrv.load(new Integer(id));
		if (leaves == null)
			return;
		String zgname = request.getParameter("zgname");
		String accountname = request.getParameter("accountname");
		String begdate = request.getParameter("begdate");
		String enddate = request.getParameter("enddate");
		String applydes = request.getParameter("applydes");
		String reply = request.getParameter("reply");
		String xtype = request.getParameter("xtype");
		String tianshu = request.getParameter("tianshu");
		SimpleDateFormat sdfleaves = new SimpleDateFormat("yyyy-MM-dd");
		leaves.setZgname(zgname);
		leaves.setAccountname(accountname);
		if (begdate != null) {
			try {
				leaves.setBegdate(sdfleaves.parse(begdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (enddate != null) {
			try {
				leaves.setEnddate(sdfleaves.parse(enddate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		leaves.setApplydes(applydes);
		leaves.setReply(reply);
		leaves.setXtype(xtype);
		leaves.setTianshu(tianshu == null ? 0 : new Integer(tianshu));
		leavesSrv.update(leaves);
		 if (forwardurl == null) {
				forwardurl = "/admin/leavesmanager.do?actiontype=get";
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
			Leaves leaves =leavesSrv.load("where id=" + id);
			if (leaves != null) {
				request.setAttribute("leaves", leaves);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/leavesadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String zgname = request.getParameter("zgname");
		if (zgname != null)
			filter += "  and zgname like '%" + zgname + "%'  ";
		String accountname = request.getParameter("accountname");
		if (accountname != null)
			filter += "  and accountname ='" + accountname + "'  ";
		String xtype = request.getParameter("xtype");
		if (xtype != null)
			filter += "  and xtype ='" + xtype + "'  ";
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
		List<Leaves> listleaves = leavesSrv.getPageEntitys( filter,
				pageindex, pagesize);
		int recordscount = leavesSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listleaves", listleaves);
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
			forwardurl = "/admin/leavesmanager.jsp";
		}
		forward(forwardurl);
	}
}
