<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    LeavesService leavesSrv=BeansUtil.getBean("leavesService", LeavesService.class);
    if( id!=null){
         Leaves temobjleaves=leavesSrv.load(" where id="+ id);
         request.setAttribute("leaves",temobjleaves);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>请假审批</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
			<h2>请假审批</h2>
			
		</div>
	<form name="leavesform" method="post"
		action="${pageContext.request.contextPath}/admin/leavesmanager.do"
		id="leavesForm">
		<input type="hidden" name="id" value="<%=id %>" /> 
		<input
			type="hidden" name="actiontype" value="shenpi" />
		 <input
			type="hidden" name="errorurl" value="/teacher/leavessp.jsp" />
		 <input
			type="hidden" name="shenpiren" value="${zhiyuan.accountname}" />
		 <input
			type="hidden" name="forwardurl"
			value="/admin/leavesmanager.do?actiontype=get&forwardurl=/teacher/leavessp.jsp" />
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">申请人姓名:</td>
				<td>${requestScope.leaves.zgname}</td>
			</tr>
			<tr>
				<td width="10%" align="right">工号:</td>
				<td>${requestScope.leaves.accountname}</td>
			</tr>
			<tr>
				<td align="right">开始日期:</td>
				<td><fmt:formatDate value="${requestScope.leaves.begdate}" pattern="yyyy-MM-dd"/>
				
				</td>
			</tr>
			<tr>
				<td align="right">结束日期:</td>
				<td><fmt:formatDate value="${requestScope.leaves.enddate}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="right">处理结果</td>
				<td><input type="radio" value="2" name="status"
					checked="checked" />审批通过 <input type="radio" value="3"
					name="status" />拒绝</td>
			</tr>
			<tr>
				<td align="right">申请时间:</td>
				<td><fmt:formatDate value="${requestScope.leaves.applytime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
				<td align="right">分类:</td>
				<td>${requestScope.leaves.xtype}</td>
			</tr>
			<tr>
				<td width="10%" align="right">天数:</td>
				<td>${requestScope.leaves.tianshu}天</td>
			</tr>
			<tr>
				<td align="right">事由:</td>
				<td colspan="3">${requestScope.leaves.applydes}</td>
			</tr>
	
			<tr>
				<td align="right">处理说明:</td>
				<td colspan="3"><textarea name="reply" id="txtReply"
						style="width:48%;height:80px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<button class="btn btn-large btn-primary">
						<i class="fa fa-plus"></i>提交
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
