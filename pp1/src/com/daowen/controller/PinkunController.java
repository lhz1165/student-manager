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

import com.daowen.entity.Pinkun;
import com.daowen.entity.Student;
import com.daowen.entity.Tekun;
import com.daowen.service.PinkunService;
import com.daowen.service.StudentService;
import com.daowen.service.TekunService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 贫困生控制
 *
 */
@Controller
public class PinkunController extends SimpleController {
	@Autowired
	private PinkunService pinkunSrv = null;
	@Autowired
	private StudentService studentSrv=null;

	@Autowired
	private TekunService tekunSrv=null;
	
	@Override
	@RequestMapping("/admin/pinkunmanager.do")
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
		pinkunSrv.delete(SQL);
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
		String photo = request.getParameter("photo");
		String jthukou = request.getParameter("jthukou");
		String reason = request.getParameter("reason");
		String bfjh = request.getParameter("bfjh");
		String pktype = request.getParameter("pktype");
		String begdate = request.getParameter("begdate");
		String jiguan = request.getParameter("jiguan");
		String lururen = request.getParameter("lururen");
		String homeaddress = request.getParameter("homeaddress");
		String moible = request.getParameter("moible");
		String idcardno = request.getParameter("idcardno");
		String des = request.getParameter("des");
		String appid=request.getParameter("appid");
		SimpleDateFormat sdfpinkun = new SimpleDateFormat("yyyy-MM-dd");
		Pinkun pinkun = new Pinkun();
		pinkun.setStno(stno == null ? "" : stno);
		pinkun.setStname(stname == null ? "" : stname);
		pinkun.setPhoto(photo == null ? "" : photo);
		pinkun.setJthukou(jthukou == null ? "" : jthukou);
		pinkun.setReason(reason == null ? "" : reason);
		pinkun.setBfjh(bfjh == null ? "" : bfjh);
		pinkun.setPktype(pktype == null ? "" : pktype);
		if (begdate != null) {
			try {
				pinkun.setBegdate(sdfpinkun.parse(begdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			pinkun.setBegdate(new Date());
		}
		pinkun.setJiguan(jiguan == null ? "" : jiguan);
		pinkun.setLururen(lururen == null ? "" : lururen);
		pinkun.setHomeaddress(homeaddress == null ? "" : homeaddress);
		pinkun.setMoible(moible == null ? "" : moible);
		pinkun.setIdcardno(idcardno == null ? "" : idcardno);
		pinkun.setDes(des == null ? "" : des);
		if(appid!=null)
		  pinkun.setAppid(Integer.parseInt(appid));
		pinkunSrv.save(pinkun);
		if(appid!=null){
			
			Tekun tekun =tekunSrv.load("where id="+appid);
			if(tekun!=null){
				//已建档
				tekun.setArvid(pinkun.getId());
				tekun.setState(4);
				tekunSrv.update(tekun);
			}
		}
		
		if (forwardurl == null) {
			forwardurl = "/admin/pinkunmanager.do?actiontype=get";
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
		Pinkun pinkun = pinkunSrv.load(new Integer(id));
		if (pinkun == null)
			return;
		String stno = request.getParameter("stno");
		String stname = request.getParameter("stname");
		String photo = request.getParameter("photo");
		String jthukou = request.getParameter("jthukou");
		String reason = request.getParameter("reason");
		String bfjh = request.getParameter("bfjh");
		String pktype = request.getParameter("pktype");
		String begdate = request.getParameter("begdate");
		String jiguan = request.getParameter("jiguan");
		String lururen = request.getParameter("lururen");
		String homeaddress = request.getParameter("homeaddress");
		String moible = request.getParameter("moible");
		String idcardno = request.getParameter("idcardno");
		String des = request.getParameter("des");
		String appid=request.getParameter("appid");
		SimpleDateFormat sdfpinkun = new SimpleDateFormat("yyyy-MM-dd");
		pinkun.setStno(stno);
		pinkun.setStname(stname);
		pinkun.setPhoto(photo);
		pinkun.setJthukou(jthukou);
		pinkun.setReason(reason);
		pinkun.setBfjh(bfjh);
		pinkun.setPktype(pktype);
		if (begdate != null) {
			try {
				pinkun.setBegdate(sdfpinkun.parse(begdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		pinkun.setJiguan(jiguan);
		pinkun.setLururen(lururen);
		pinkun.setHomeaddress(homeaddress);
		pinkun.setMoible(moible);
		pinkun.setIdcardno(idcardno);
		pinkun.setDes(des);
		if(appid!=null)
			  pinkun.setAppid(Integer.parseInt(appid));
		pinkunSrv.update(pinkun);
		if (forwardurl == null) {
			forwardurl = "/admin/pinkunmanager.do?actiontype=get";
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
		String stno=request.getParameter("stno");
		if(stno!=null){
		   Student student=studentSrv.load("where stno='"+stno+"'");
		   if(student!=null)
			   request.setAttribute("student", student);
		}
		dispatchParams(request, response);
		if (id != null) {
			Pinkun pinkun = pinkunSrv.load("where id=" + id);
			if (pinkun != null) {
				request.setAttribute("pinkun", pinkun);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/pinkunadd.jsp";
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
		List<Pinkun> listpinkun = pinkunSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = pinkunSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listpinkun", listpinkun);
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
			forwardurl = "/admin/pinkunmanager.jsp";
		}
		forward(forwardurl);
	}
}
