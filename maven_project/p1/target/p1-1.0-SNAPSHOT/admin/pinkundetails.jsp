<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
     PinkunService pinkunSrv=BeansUtil.getBean("pinkunService",  PinkunService.class);
    if( id!=null)
    {
      Pinkun temobjpinkun=pinkunSrv.load(" where id="+ id);
      request.setAttribute("pinkun",temobjpinkun);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>贫困生信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看贫困生</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">学号:</td>
			<td>${requestScope.pinkun.stno}</td>
			<td colspan="2" rowspan="6">
			   <img src="${requestScope.pinkun.photo}" width="200" height="200"/>
			</td>
		</tr>
		<tr>
			<td width="10%" align="right">姓名:</td>
			<td>${requestScope.pinkun.stname}</td>
		</tr>
		
		<tr>
			<td width="10%" align="right">家庭户口:</td>
			<td>${requestScope.pinkun.jthukou}</td>
		</tr>
		
		<tr>
			<td width="10%" align="right">家庭地址:</td>
			<td>${requestScope.pinkun.homeaddress}</td>
		</tr>
		<tr>
			<td width="10%" align="right">联系方式:</td>
			<td>${requestScope.pinkun.moible}</td>
		</tr>
		<tr>
			<td width="10%" align="right">身份号:</td>
			<td>${requestScope.pinkun.idcardno}</td>
		</tr>
		<tr>
			<td width="10%" align="right">贫困原因:</td>
			<td>${requestScope.pinkun.reason}</td>
		
			<td width="10%" align="right">帮扶计划:</td>
			<td>${requestScope.pinkun.bfjh}</td>
		</tr>
		<tr>
			<td align="right">贫困类别:</td>
			<td>${requestScope.pinkun.pktype}</td>
		
			<td align="right">帮扶日期:</td>
			<td>
				<fmt:formatDate value="${requestScope.pinkun.begdate}" pattern="yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<td width="10%" align="right">籍贯:</td>
			<td>${requestScope.pinkun.jiguan}</td>
		
			<td width="10%" align="right">录入人:</td>
			<td>${requestScope.pinkun.lururen}</td>
		</tr>
		
		<tr>
			<td align="right">说明:</td>
			<td colspan="3">${requestScope.pinkun.des}</td>
		</tr>
	</table>
</body>
</html>
