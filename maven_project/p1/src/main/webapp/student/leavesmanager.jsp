<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>请假信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js"
			type="text/javascript"></script>
    
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   
		<script type="text/javascript">
			$(function() {
			    
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>请假记录管理</h2>
		
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/leavesmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>请假分类<input name="xtype" value="${xtype}"
							class="input-txt" type="text" id="xtype" /> 
							<input
							type="hidden" name="actiontype" value="search" /> 
							<input
							type="hidden" name="accountname" value="${zhiyuan.accountname}" /> 
							<input
							type="hidden" name="seedid" value="${seedid}" /> <input
							type="hidden" name="forwardurl"
							value="/student/leavesmanager.jsp" />
							<button class="orange-button">
								<i class="icon-search icon-white"></i>搜索
							</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	
	<div class="box">
		
		<table id="leaves" width="100%" border="0" cellspacing="0"
			cellpadding="0" class="ui-record-table">
			<thead>
				<tr>
					
					<th><b>申请人姓名</b>
					</th>
					
					<th><b>分类</b>
					</th>
					<th><b>开始日期</b>
					</th>
					<th><b>结束日期</b>
					</th>
					<th><b>状态</b></th>
					
					<th><b>申请时间</b>
					</th>
					
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${listleaves== null || fn:length(listleaves) == 0}">
					<tr>
						<td colspan="20">没有相关请假信息</td>
					</tr>
				</c:if>
				<%	
									if(request.getAttribute("listleaves")!=null)
								      {
									  List<Leaves> listleaves=( List<Leaves>)request.getAttribute("listleaves");
								     for(Leaves  temleaves  :  listleaves)
								      {
							%>
				<tr>
					
					<td><%=temleaves.getZgname()%>(<%=temleaves.getAccountname()%>)</td>
					<td><%=temleaves.getXtype()%></td>
					<%
					  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					
					%>
					<td><%=sdf.format(temleaves.getBegdate())%></td>
					<td><%=sdf.format(temleaves.getEnddate())%></td>
					<td>
					    <%if(temleaves.getStatus()==1){%>
					                     待审批
					    <%} %>
					     <%if(temleaves.getStatus()==2){%>
					                     同意
					    <%} %>
					     <%if(temleaves.getStatus()==3){%>
					                     拒绝 
					    <%} %>
					</td>
					    
					<td>
					
					   <%=sdf.format(temleaves.getApplytime())%>
					
					   
					</td>
					
					<td>
					   <a class="orange-href"
						href="${pageContext.request.contextPath}/admin/leavesmanager.do?actiontype=load&id=<%=temleaves.getId()%>&forwardurl=/student/leavesadd.jsp">修改</a>
						 <a class="orange-href"
						href="${pageContext.request.contextPath}/student/leavesdetails.jsp?id=<%=temleaves.getId()%>">查看</a>
					</td>
				</tr>
				<%}}%>
			</tbody>
		</table>
	</div>
	<!--end box-->
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
