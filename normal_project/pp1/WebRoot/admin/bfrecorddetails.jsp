<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
     BfrecordService bfrecordSrv=BeansUtil.getBean("bfrecordService",  BfrecordService.class);
    if( id!=null)
    {
      Bfrecord temobjbfrecord=bfrecordSrv.load(" where id="+ id);
      request.setAttribute("bfrecord",temobjbfrecord);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>帮扶记录信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看帮扶记录</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td align="right">学号:</td>
			<td>${requestScope.bfrecord.stno}</td>
		</tr>
		<tr>
			<td width="10%" align="right">姓名:</td>
			<td>${requestScope.bfrecord.stname}</td>
		</tr>
		<tr>
			<td align="right">学年:</td>
			<td>${requestScope.bfrecord.xuenian}</td>
		</tr>
		<tr>
			<td align="right">帮扶类型:</td>
			<td>${requestScope.bfrecord.bftype}</td>
		</tr>
		<tr>
			<td width="10%" align="right">帮扶单位:</td>
			<td>${requestScope.bfrecord.bfdanwei}</td>
		</tr>
		<tr>
			<td width="10%" align="right">帮扶日期:</td>
			<td>${requestScope.bfrecord.begdate}</td>
		</tr>
		<tr>
			<td align="right">说明:</td>
			<td colspan="3">${requestScope.bfrecord.des}</td>
		</tr>
	</table>
</body>
</html>
