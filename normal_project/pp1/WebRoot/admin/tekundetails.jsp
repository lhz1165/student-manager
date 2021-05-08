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
      Tekun temobjtekun=tekunSrv.load(" where id="+ id);
      request.setAttribute("tekun",temobjtekun);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>特困申请信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看特困申请</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">标题:</td>
			<td>${requestScope.tekun.title}</td>
		</tr>
		<tr>
			<td align="right">申请时间:</td>
			<td>
				<fmt:formatDate value="${requestScope.tekun.applytime}" pattern="yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<td width="10%" align="right">状态:</td>
			<td>
			    <c:if test="${requestScope.tekun.state==1}">
			                  等待审批
			    </c:if>
			    <c:if test="${requestScope.tekun.state==2}">
			                  已同意
			    </c:if>
			    <c:if test="${requestScope.tekun.state==3}">
			                  已拒绝
			    </c:if>
			    <c:if test="${requestScope.tekun.state==4}">
			                  已建档
			    </c:if>
			
			
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
	</table>
</body>
</html>
