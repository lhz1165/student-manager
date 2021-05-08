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
 * 奖学金控制
 *
 */
 @Controller
public class ScholarshipController extends  SimpleController{
     @Autowired
       private ScholarshipService  scholarshipSrv=null;
						@Autowired
						private  StudentService studentSrv=null;
						@Autowired
						private  NianduService nianduSrv=null;
       @Override
	@RequestMapping("/admin/scholarshipmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);
	}
    /********************************************************
    ******************信息注销监听支持*****************************
    *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids)
				+ ")";
		System.out.println("sql=" + SQL);
		scholarshipSrv.delete(SQL);
	}
    /*************************************************************
     ****************保存动作监听支持******************************
    **************************************************************/
	public void save() {
			String forwardurl=request.getParameter("forwardurl");
			//验证错误url
			String errorurl=request.getParameter("errorurl");
				        String title=request.getParameter("title");
				        String xtype=request.getParameter("xtype");
				        String hjdate=request.getParameter("hjdate");
				        String stno=request.getParameter("stno");
				        String stname=request.getParameter("stname");
				        String xuenian=request.getParameter("xuenian");
	    SimpleDateFormat  sdfscholarship=new SimpleDateFormat("yyyy-MM-dd");
             Scholarship scholarship=new Scholarship();
				        scholarship.setTitle(title==null?"":title);
				        scholarship.setXtype(xtype==null?"":xtype);
					          if(hjdate!=null)
					          {
							        try {
										scholarship.setHjdate(sdfscholarship.parse(hjdate));
									} catch (ParseException e) {
										e.printStackTrace();
									}
								}else{
								   scholarship.setHjdate(new Date());
								}
				        scholarship.setStno(stno==null?"":stno);
				        scholarship.setStname(stname==null?"":stname);
				        scholarship.setXuenian(xuenian==null?"":xuenian);
		    //产生验证
		     Boolean validateresult=scholarshipSrv.isExist( "where stno='"+stno+"'");
		     if(validateresult){
			 try {
					request.setAttribute("errormsg","<label class='error'>已经登记了奖学金</label>");
					request.setAttribute("scholarship", scholarship);
					request.setAttribute("actiontype", "save");
					request.getRequestDispatcher(errorurl).forward(request, response);
				} catch (Exception e) {
						e.printStackTrace();
				}
				return;
			}
		  scholarshipSrv.save(scholarship);
		 if(forwardurl==null){
			forwardurl="/admin/scholarshipmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}
   	/******************************************************
	***********************更新内部支持*********************
	*******************************************************/
	public void update() {
           String forwardurl=request.getParameter("forwardurl");
		   String id=request.getParameter("id");
		   if(id==null)
			   return;
		   Scholarship  scholarship=scholarshipSrv.load(new Integer(id));
		    if(scholarship==null)
			   return;
				       String title=request.getParameter("title");
				       String xtype=request.getParameter("xtype");
				       String hjdate=request.getParameter("hjdate");
				       String stno=request.getParameter("stno");
				       String stname=request.getParameter("stname");
				       String xuenian=request.getParameter("xuenian");
			  SimpleDateFormat  sdfscholarship=new SimpleDateFormat("yyyy-MM-dd");
					        scholarship.setTitle(title);
					        scholarship.setXtype(xtype);
					           if(hjdate!=null)
					           {
							        try {
										scholarship.setHjdate(sdfscholarship.parse(hjdate));
									} catch (ParseException e) {
										e.printStackTrace();
									}
								}
					        scholarship.setStno(stno);
					        scholarship.setStname(stname);
					        scholarship.setXuenian(xuenian);
		    scholarshipSrv.update(scholarship);
			 if(forwardurl==null){
				forwardurl="/admin/scholarshipmanager.do?actiontype=get";
			}
			redirect(forwardurl);
	}
   	/******************************************************
	***********************加载内部支持*********************
	*******************************************************/
	public void load() {
	        //
		    String id=request.getParameter("id");
		    String actiontype="save";
		    dispatchParams(request, response);
			if(id!=null) 
			{
			   Scholarship  scholarship=scholarshipSrv.load("where id="+id);
				if(scholarship!=null) 
				{
				    request.setAttribute("scholarship", scholarship);
				}
				actiontype="update";
				request.setAttribute("id", id);
			}
		    request.setAttribute("actiontype", actiontype);
						       List<Object> stno_datasource=studentSrv.getEntity("");
request.setAttribute("stno_datasource",stno_datasource);
						       List<Object> xuenian_datasource=nianduSrv.getEntity("");
request.setAttribute("xuenian_datasource",xuenian_datasource);
		    String forwardurl=request.getParameter("forwardurl");
		    System.out.println("forwardurl="+forwardurl);
		    if(forwardurl==null){
		     	forwardurl="/admin/scholarshipadd.jsp";
		   }
		   forward(forwardurl);
	}
   	/******************************************************
	***********************数据绑定内部支持*********************
	*******************************************************/
	public void   get(){
		 String filter="where 1=1 ";
String title=request.getParameter("title");
	              if(title!=null)
	                     filter+="  and title like '%"+title+"%'  ";
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
		List<Scholarship> listscholarship = scholarshipSrv.getPageEntitys( filter,pageindex, pagesize);
		int recordscount = scholarshipSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listscholarship", listscholarship);
		PagerMetal pm = new PagerMetal(recordscount);
		//设置尺寸
		pm.setPagesize(pagesize);
		//设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		//分发请求参数
		dispatchParams(request, response);
		String forwardurl=request.getParameter("forwardurl");
		System.out.println("forwardurl="+forwardurl);
		if(forwardurl==null){
			forwardurl="/admin/scholarshipmanager.jsp";
		}
forward(forwardurl);
	}
}
