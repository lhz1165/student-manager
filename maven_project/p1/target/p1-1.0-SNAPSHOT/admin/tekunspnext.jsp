<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    TekunService tekunSrv=BeansUtil.getBean("tekunService",  TekunService.class);
    if( id!=null)
    {
         Tekun temobjtekun= tekunSrv.load(" where id="+ id);
          request.setAttribute("tekun",temobjtekun);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>特困申请审批</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>特困申请审批</h2>
		<div class="description"></div>
	</div>
	<form name="tekunform" method="post" action="${pageContext.request.contextPath}/admin/tekunmanager.do" id="tekunForm">
		<input type="hidden" name="id" value="<%=id%>" />
		<input type="hidden" name="actiontype" value="shenpi" />
		<input type="hidden" name="errorurl" value="/admin/tekunadd.jsp" />
		<input type="hidden" name="forwardurl" value="/admin/tekunmanager.do?actiontype=get&forwardurl=/admin/tekunsp.jsp" />
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">标题:</td>
				<td>${requestScope.tekun.title}</td>
			</tr>
			<tr>
				<td align="right">申请时间:</td>
				<td><fmt:formatDate value="${requestScope.tekun.applytime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
				<td align="right">处理结果</td>
				<td>
					<input type="radio" value="2" name="state" checked="checked" />
					审批通过
					<input type="radio" value="3" name="state" />
					拒绝
				</td>
			</tr>
			<tr>
				<td width="10%" align="right">申请人:</td>
				<td>${requestScope.tekun.applyor}-${requestScope.tekun.appname}</td>
			</tr>
			
			<tr>
				<td align="right">内容:</td>
				<td colspan="3">${requestScope.tekun.dcontent}</td>
			</tr>
			<tr>
				<td align="right">处理说明:</td>
				<td colspan="3">
					<textarea name="reply" id="txtReply" style="width: 48%; height: 80px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button class="orange-button">提交审批</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
