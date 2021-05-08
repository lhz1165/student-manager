package com.daowen.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Teacher;
import com.daowen.service.TeacherService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class TeacherController extends SimpleController {

	@Autowired
	private TeacherService teacherSrv=null;
	@Override
	@RequestMapping("/admin/teachermanager.do")
	public void mapping(HttpServletRequest req, HttpServletResponse reps) {
		
		mappingMethod(req,reps);
	}
	
	private void modifyPw() {
		String password1 = request.getParameter("password1");
		String repassword1 = request.getParameter("repassword1");
		String forwardurl = request.getParameter("forwardurl");
		String errorpageurl = request.getParameter("errorpageurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Teacher teacher = teacherSrv.load(new Integer(id));
		if(teacher==null)
			return;
		
		if (!teacher.getPassword().equals(password1)) {

			request.setAttribute("errormsg",
					"<label class='error'>原始密码不正确，不能修改</label>");
			forward(errorpageurl);
			return;
		} else {
			teacher.setPassword(repassword1);
			teacherSrv.update(teacher);
			request.getSession().setAttribute("teacher", teacher);
			forward(forwardurl);
		}
		
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		teacherSrv.delete(" where id=" + id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String tno = request.getParameter("tno");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String jiguan = request.getParameter("jiguan");
		String zhiwei = request.getParameter("zhiwei");
		String zhicheng = request.getParameter("zhicheng");
		String xueli = request.getParameter("xueli");
		String mianmao = request.getParameter("mianmao");
		String nation = request.getParameter("nation");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String jieshao = request.getParameter("jieshao");
		String name = request.getParameter("name");
		String gradschool = request.getParameter("gradschool");
		String major = request.getParameter("major");
		String photo = request.getParameter("photo");
		SimpleDateFormat sdfteacher = new SimpleDateFormat("yyyy-MM-dd");
		Teacher teacher = new Teacher();
		teacher.setTno(tno == null ? "" : tno);
		teacher.setPassword("123456");
		teacher.setSex(sex == null ? "" : sex);
		teacher.setJiguan(jiguan == null ? "" : jiguan);
		teacher.setZhiwei(zhiwei == null ? "" : zhiwei);
		teacher.setZhicheng(zhicheng == null ? "" : zhicheng);
		teacher.setXueli(xueli == null ? "" : xueli);
		teacher.setMianmao(mianmao == null ? "" : mianmao);
		teacher.setNation(nation == null ? "" : nation);
		teacher.setEmail(email == null ? "" : email);
		teacher.setTel(tel == null ? "" : tel);
		teacher.setJieshao(jieshao == null ? "" : jieshao);
		teacher.setName(name == null ? "" : name);
		teacher.setGradschool(gradschool == null ? "" : gradschool);
		teacher.setMajor(major == null ? "" : major);
		teacher.setPhoto(photo == null ? "" : photo);
		// 产生验证
		Boolean validateresult = teacherSrv.isExist("where tno='" + tno + "'");
		if (validateresult) {
			
			request.setAttribute("errormsg",
					"<label class='error'>已经存在工号</label>");
			request.setAttribute("teacher", teacher);
			request.setAttribute("actiontype", "save");
			forward(errorurl);
			return;
		}
		teacherSrv.save(teacher);
		
		if (forwardurl == null) {
			forwardurl = "/admin/teachermanager.do?actiontype=get";
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
		Teacher teacher = teacherSrv.load(new Integer(id));
		if (teacher == null)
			return;
		String tno = request.getParameter("tno");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String jiguan = request.getParameter("jiguan");
		String zhiwei = request.getParameter("zhiwei");
		String zhicheng = request.getParameter("zhicheng");
		String xueli = request.getParameter("xueli");
		String mianmao = request.getParameter("mianmao");
		String nation = request.getParameter("nation");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String jieshao = request.getParameter("jieshao");
		String name = request.getParameter("name");
		String gradschool = request.getParameter("gradschool");
		String major = request.getParameter("major");
		String photo = request.getParameter("photo");
		SimpleDateFormat sdfteacher = new SimpleDateFormat("yyyy-MM-dd");
		if(tno!=null)
		  teacher.setTno(tno);
		
		teacher.setSex(sex);
		teacher.setJiguan(jiguan);
		teacher.setZhiwei(zhiwei);
		teacher.setZhicheng(zhicheng);
		teacher.setXueli(xueli);
		teacher.setMianmao(mianmao);
		teacher.setNation(nation);
		teacher.setEmail(email);
		teacher.setTel(tel);
		teacher.setJieshao(jieshao);
		if(name!=null)
		  teacher.setName(name);
		teacher.setGradschool(gradschool);
		teacher.setMajor(major);
		teacher.setPhoto(photo);
		teacherSrv.update(teacher);
		
		if (forwardurl == null) {
			forwardurl = "/admin/teachermanager.do?actiontype=get";
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
			Teacher teacher = teacherSrv.load("where id="+ id);
			if (teacher != null) {
				request.setAttribute("teacher", teacher);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/teacheradd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String name = request.getParameter("name");
		if (name != null)
			filter += "  and name like '%" + name + "%'  ";
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
		List<Teacher> listteacher = teacherSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = teacherSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listteacher", listteacher);
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
			forwardurl = "/admin/teachermanager.jsp";
		}
		forward(forwardurl);
	}
	
	
	
	
	
	

}
