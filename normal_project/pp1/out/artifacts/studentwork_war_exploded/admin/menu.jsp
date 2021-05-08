<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
   $(function(){
	   $(".accordion-item .leftMenus dd").click(function(){
	    	  $(".accordion-item .leftMenus dd").removeClass("current");
	    	  $(this).addClass("current");
	   });
   })
</script>
<div class="accordion-group">
	<div
		style="height: 500px; background: url(images/content.gif) repeat-y; display: none;"
		class="accordion-item">
		<h3>奖助帮扶管理</h3>
		<div class="leftMenus">

			<dl>
		   
		             <dd>
                          <a target="main" href="${pageContext.request.contextPath}/admin/scholarshipmanager.do?actiontype=get">
                        
                              <i class="icon-list-alt"></i>奖学金管理
                          </a>
                        </dd>
                        
                       <dd>
                          <a target="main" href="${pageContext.request.contextPath}/admin/scholarshipmanager.do?actiontype=load">
                        
                              <i class="icon-list-alt"></i>奖学金登记
                          </a>
                        </dd>
                       <dd>
                         <a  target="main" href="${pageContext.request.contextPath}/admin/tekunmanager.do?actiontype=get&forwardurl=/admin/tekunsp.jsp">
                        
                              <i class="icon-list-alt"></i>特困生审核
                          </a>
                        </dd>
                         <dd>
                         <a  target="main" href="${pageContext.request.contextPath}/admin/pinkunmanager.do?actiontype=get&forwardurl=/admin/pinkunmanager.jsp">
                        
                              <i class="icon-list-alt"></i>贫困生档案管理
                          </a>
                        </dd>
                        
                        <dd>
                         <a  target="main" href="${pageContext.request.contextPath}/admin/bfrecordmanager.do?actiontype=get&forwardurl=/admin/bfrecordmanager.jsp">
                        
                              <i class="icon-list-alt"></i>帮扶跟踪管理
                          </a>
                        </dd>
                        
                        <dd>
                         <a  target="main" href="${pageContext.request.contextPath}/admin/earlywarnmanager.do?actiontype=get&forwardurl=/admin/earlywarnmanager.jsp">
                        
                              <i class="icon-list-alt"></i>预警管理
                          </a>
                        </dd>
                     
                     
              
		</dl>
		</div>
	  

		
	    <h3>基础信息管理</h3>
		<div class="leftMenus">
			
			
		   <dl>
              <dd>
				<a target="main"
				   href="${pageContext.request.contextPath}/admin/studentmanager.do?actiontype=get">
					学生管理 </a>
			</dd>
			
			
              <dd>
				<a target="main"
				   href="${pageContext.request.contextPath}/admin/banjimanager.do?actiontype=get">
					班级管理 </a>
			  </dd>
			  
			    <dd>
				<a target="main"
				   href="${pageContext.request.contextPath}/admin/sushemanager.do?actiontype=get">
					宿舍管理 </a>
			  </dd>
			  
			   <dd>
                         <a  target="main" href="${pageContext.request.contextPath}/admin/niandumanager.do?actiontype=get">
                        
                              <i class="icon-list-alt"></i>学年管理
                          </a>
                 </dd>
			
			  <dd>
				<a target="main"
				href="${pageContext.request.contextPath}/admin/teachermanager.do?actiontype=get">
					教师管理 </a>
			</dd>
			
			 <dd>
				<a target="main"
				href="${pageContext.request.contextPath}/admin/fudaomanager.do?actiontype=get">
					带班设置管理 </a>
			</dd>
			
			  <dd>
				<a target="main"
				href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get">
					后台用户管理 </a>
			  </dd>
			  
			   <dd>
				<a target="main"
				href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=get">
					系统公告管理 </a>
			  </dd>
			
			</dl>
		</div>
	
		<h3>账户设置</h3>
		<div class="leftMenus">
		<dl>
		
		
		<dd>
				<a  href="${pageContext.request.contextPath}/admin/modifypw.jsp"
					target="main">修改密码</a>
			</dd>
			<dd>
				<a  href="${pageContext.request.contextPath}/admin/accountinfo.jsp"
					target="main">我的账户信息</a>
			</dd>
			<dd>
				<a  href="${pageContext.request.contextPath}/admin/modifyinfo.jsp"
					target="main">修改账户信息</a>
			</dd>
			</dl>
		</div>
		
		
	</div>
</div>
