<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%> 
<%
    String  id=request.getParameter("id");
    KechengService kechengSrv=BeansUtil.getBean("kechengService", KechengService.class);
    if( id!=null){
      Kecheng temobjkecheng=kechengSrv.load(" where id="+ id);
      request.setAttribute("kecheng",temobjkecheng);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>课程信息查看</title>
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.js"></script>
</head>
<body >
	<div>
		<ul class="breadcrumb">
			<li><a href="#">首页</a> <span class="divider">/</span></li>
			<li><a href="#">查看课程信息</a></li>
		</ul>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td align="right">课程名:</td>
			<td>${requestScope.kecheng.subname}</td>
		</tr>
		<tr>
			<td align="right">课程编号:</td>
			<td>${requestScope.kecheng.subno}</td>
		</tr>
		<tr>
			<td align="right">学分:</td>
			<td>${requestScope.kecheng.xuefen}</td>
		</tr>
		<tr>
			<td align="right">说明:</td>
			<td colspan="3">${requestScope.kecheng.des}</td>
		</tr>
	</table>
</body>
</html>
