<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    Leaves temobjleaves=null;
    LeavesService leavesSrv=BeansUtil.getBean("leavesService", LeavesService.class);
    if( id!=null)
    {
       
          temobjleaves=leavesSrv.load(" where id="+ id);
         request.setAttribute("leaves",temobjleaves);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>请假信息查看</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
<div>
		<div class="search-title">
			<h2>请假详情</h2>
			<div class="description">
				
			</div>
		</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">姓名:</td>
			<td>${requestScope.leaves.zgname}</td>
		
			<td width="10%" align="right">学号:</td>
			<td>${requestScope.leaves.accountname}</td>
		</tr>
		<tr>
			<td align="right">分类:</td>
			<td>${requestScope.leaves.xtype}</td>
		
			<td width="10%" align="right">天数:</td>
			<td>${requestScope.leaves.tianshu}(天数)</td>
		</tr>
		
		<tr>
		<%SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); %>
			<td align="right">开始日期:</td>
			<td><%=sdf.format(temobjleaves.getBegdate()) %></td>
		
			<td align="right">结束日期:</td>
			<td><%=sdf.format(temobjleaves.getEnddate()) %></td>
		
		
		</tr>
		<tr>
			<td align="right">事由:</td>
			<td colspan="3">${requestScope.leaves.applydes}</td>
		</tr>
		<tr>
		 
		   	<td width="10%" align="right">状态:</td>
			<td colspan="3">
			    <%if(temobjleaves.getStatus()==1) {%>
			                     待审批
			    <%} %>
			     <%if(temobjleaves.getStatus()==2) {%>
			                    同意
			    <%} %>
			     <%if(temobjleaves.getStatus()==3) {%>
			                     拒绝
			    <%} %>
			</td>
		
		</tr>
		
		<tr>
			<td align="right">申请时间:</td>
			<td>${requestScope.leaves.applytime}</td>
		</tr>
		<%if(temobjleaves.getStatus()==2){ %>
		<tr>
			<td width="10%" align="right">审批人:</td>
			<td>${requestScope.leaves.shenpiren}</td>
		</tr>
		<tr>
			<td width="10%" align="right">审批时间:</td>
			<td>${requestScope.leaves.shenpitime}</td>
		</tr>
		
		<tr>
			<td align="right">审批回复:</td>
			<td colspan="3">${requestScope.leaves.reply}</td>
		</tr>
		<%} %>
	</table>
</body>
</html>
