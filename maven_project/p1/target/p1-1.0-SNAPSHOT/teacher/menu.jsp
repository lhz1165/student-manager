<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		style="height:600px; background: url(../admin/images/content.gif) repeat-y; display: none;"
		class="accordion-item">
		
        
        <c:if test="${teacher.zhiwei=='辅导员' }">
       <h3>学生工作</h3>
		<div class="leftMenus">

			<dl>

           
				<dd>
                         <a target="main" href="${pageContext.request.contextPath}/admin/leavesmanager.do?actiontype=get&tno=${teacher.tno}&forwardurl=/teacher/leavessp.jsp">
                              <i class="icon-list-alt"></i>请假管理
                          </a>
                 </dd>
                 
                 <dd>
                         <a target="main" href="${pageContext.request.contextPath}/admin/fudaomanager.do?actiontype=get&tno=${teacher.tno}&forwardurl=/teacher/fudaomanager.jsp">
                              <i class="icon-list-alt"></i>辅导班级查询
                          </a>
                 </dd>
                      
                 <dd>
                         <a target="main" href="${pageContext.request.contextPath}/admin/studentmanager.do?actiontype=myStudent&tno=${teacher.tno}&forwardurl=/teacher/studentmanager.jsp">
                              <i class="icon-list-alt"></i>学生档案管理
                          </a>
                 </dd> 
                 
                  <dd>
                         <a target="main" href="${pageContext.request.contextPath}/admin/scholarshipmanager.do?actiontype=get&forwardurl=/teacher/scholarshipmanager.jsp">
                              <i class="icon-list-alt"></i>奖学金管理
                          </a>
                 </dd>       

				
			</dl>

		</div>
        </c:if>

		 <h3>咨询管理</h3>
		<div class="leftMenus">

			<dl>

				 <dd>
			            <a target="main" href="${pageContext.request.contextPath}/admin/leavewordmanager.do?actiontype=get&replyren=${teacher.tno}&forwardurl=/teacher/leavewordmanager.jsp">
			                                          留言管理
			            </a>
			         </dd>
			         
				    <dd>
			            <a target="main" href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=get&forwardurl=/teacher/noticemanager.jsp">
			                                          系统公告管理
			            </a>
			         </dd>
				
			</dl>

		</div>
	
		<h3>账户管理</h3>
		<div class="leftMenus">
		
		  <dl>
		    <dd>
				<a target="main"  href="${pageContext.request.contextPath}/teacher/modifypw.jsp">修改密码</a>
			</dd>
			<dd>
				<a target="main"  href="${pageContext.request.contextPath}/teacher/accountinfo.jsp">账户信息</a>
			</dd>
			<dd>
				<a target="main"  href="${pageContext.request.contextPath}/teacher/modifyinfo.jsp">编辑信息</a>
			</dd>
		   </dl>
		</div>
		
		
	</div>
</div>
