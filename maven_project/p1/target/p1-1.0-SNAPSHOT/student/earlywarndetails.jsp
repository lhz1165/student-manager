<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	String id = request.getParameter("id");
	EarlywarnService earlywarnSrv = BeansUtil.getBean(
			"earlywarnService", EarlywarnService.class);
	if (id != null) {
		Earlywarn temobjearlywarn = earlywarnSrv.load(" where id=" + id);
		if(temobjearlywarn!=null){
		    temobjearlywarn.setState(2);
		    earlywarnSrv.update(temobjearlywarn);
			request.setAttribute("earlywarn", temobjearlywarn);
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>学生预警信息查看</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="search-title">
		<h2>查看学生预警</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td align="right">学号:</td>
			<td>${requestScope.earlywarn.stno}</td>
		</tr>
		<tr>
			<td width="10%" align="right">姓名:</td>
			<td>${requestScope.earlywarn.stname}</td>
		</tr>
		<tr>
			<td align="right">预警类型:</td>
			<td>${requestScope.earlywarn.yjtype}</td>
		</tr>
		<tr>
			<td width="10%" align="right">标题:</td>
			<td>${requestScope.earlywarn.title}</td>
		</tr>
		<tr>
			<td align="right">内容:</td>
			<td colspan="3">${requestScope.earlywarn.content}</td>
		</tr>
		
		
		
	</table>
</body>
</html>
