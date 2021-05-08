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
       <h3>奖助帮扶管理</h3>
		<div class="leftMenus">

			<dl>


                 <dd>
                        <a  target="main" href="${pageContext.request.contextPath}/admin/tekunmanager.do?actiontype=load&forwardurl=/student/tekunadd.jsp">
                                                                               特困生申请
                          </a>
                        </dd>
                     
                       <dd>
                          <a  target="main" href="${pageContext.request.contextPath}/admin/tekunmanager.do?actiontype=get&applyor=${student.stno }&forwardurl=/student/tekunmanager.jsp">
                                                                                申请记录
                          </a>
                       </dd>
                        <dd>
                           <a  target="main" href="${pageContext.request.contextPath}/admin/scholarshipmanager.do?actiontype=get&stno=${student.stno}&forwardurl=/student/scholarshipmanager.jsp">
                              <i class="icon-list-alt"></i>我的奖学金
                           </a>
                        </dd>
                         <dd>
                           <a  target="main" href="${pageContext.request.contextPath}/admin/earlywarnmanager.do?actiontype=get&stno=${student.stno}&forwardurl=/student/earlywarnmanager.jsp">
                              <i class="icon-list-alt"></i>预警信息
                           </a>
                        </dd>
                        

			</dl>

		</div>
		
		
		
		 <h3>事务管理</h3>
		<div class="leftMenus">

			<dl>
			
			       <dd>
			            <a target="main" href="${pageContext.request.contextPath}/admin/leavesmanager.do?actiontype=load&forwardurl=/student/leavesadd.jsp">
			                                         在线请假
			            </a>
			       </dd>
			       
			         <dd>
			            <a target="main" href="${pageContext.request.contextPath}/admin/leavesmanager.do?actiontype=get&acocuntname=${student.stno}&forwardurl=/student/leavesmanager.jsp">
			                                         我的请假记录
			            </a>
			       </dd>
                   <dd>
			            <a target="main" href="${pageContext.request.contextPath}/admin/teachermanager.do?actiontype=get&forwardurl=/student/lwguide.jsp">
			                                         在线咨询
			            </a>
			         </dd>
			         <dd>
			            <a target="main" href="${pageContext.request.contextPath}/admin/leavewordmanager.do?actiontype=get&lyren=${student.stno}&forwardurl=/student/leavewordmanager.jsp">
			                                      我的留言列表
			            </a>
			         </dd>
			          <dd>
				            <a target="main" href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=get&forwardurl=/student/noticemanager.jsp">
				                                          系统公告管理
				            </a>
				      </dd>

			</dl>

		</div>


		
	
		<h3>账户管理</h3>
		<div class="leftMenus">
		
		  <dl>
		   <dd>
				<a target="main"  href="${pageContext.request.contextPath}/student/modifypw.jsp">修改密码</a>
			</dd>
			<dd>
				<a target="main"  href="${pageContext.request.contextPath}/student/accountinfo.jsp">账户信息</a>
			</dd>
			<dd>
				<a target="main"  href="${pageContext.request.contextPath}/student/modifyinfo.jsp">编辑信息</a>
			</dd>
		   </dl>
		</div>
		
		
	</div>
</div>
