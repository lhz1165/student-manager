<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="law.jsp"%>
<%
 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>作业信息查看</title>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body >
	<div class="search-title">
		<h2>作业查看</h2>
		<div class="description"></div>
	</div>
			       <!-----开始---->
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					<tr>
						<td width="10%" align="right">题目:</td>
						<td>${requestScope.homework.title}</td>
					</tr>
					<tr>
						<td width="10%" align="right">布置教师:</td>
						<td>${requestScope.homework.tname}(${requestScope.homework.tno})</td>
					</tr>
					
					<tr>
						<td align="right">布置时间:</td>
						<td><fmt:formatDate value="${requestScope.homework.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
					</tr>
					<tr>
						<td align="right">作业说明:</td>
						<td colspan="3">${requestScope.homework.des}</td>
					</tr>
					
					
				</table>
				
				<table id="submithw" width="100%" border="0" cellspacing="0"
					cellpadding="0" class="ui-record-table">
					<thead>
						<tr>
						
							<th><b>作业题目</b>
							</th>
							<th><b>发布教师</b>
							</th>
							<th><b>学号</b>
							</th>
							<th><b>姓名</b>
							</th>
							<th><b>提交时间</b>
							</th>
							<th><b>作业状态</b>
							</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${listsubmithw== null || fn:length(listsubmithw) == 0}">
							<tr>
								<td colspan="20">没有相关提交作业信息</td>
							</tr>
						</c:if>
						<%	
						            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
									if(request.getAttribute("listsubmithw")!=null)
								      {
									  List<Submithw> listsubmithw=( List<Submithw>)request.getAttribute("listsubmithw");
								     for(Submithw  temsubmithw  :  listsubmithw)
								      {
							%>
						<tr>
						
							<td><%=temsubmithw.getHwtitle()%></td>
							<td><%=temsubmithw.getTname()%>(<%=temsubmithw.getTno()%>)</td>
							<td><%=temsubmithw.getXuehao()%></td>
							<td><%=temsubmithw.getName()%></td>
							<td><%=sdf.format(temsubmithw.getSubmittime())%></td>
							<td>
							   <%if(temsubmithw.getStatus()==1){%>
							                      等待教师批阅
							   <%} %>
							    <%if(temsubmithw.getStatus()==2){%>
							                      已批阅
							   <%} %>
							</td>
							<td>
							
								<a  class="orange-href"
								href="${pageContext.request.contextPath}/admin/submithwdetails.jsp?id=<%=temsubmithw.getId()%>">详细</a>
								</td>
						</tr>
						<%}}%>
					</tbody>
				</table>
				
		
</body>
</html>
