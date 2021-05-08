<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>学生预警信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			   
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>我的预警管理</h2>
		<div class="description"></div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm" action="${pageContext.request.contextPath}/admin/earlywarnmanager.do" method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>
							标题
							<input name="title" value="${title}" class="input-txt" type="text"  />
							<input type="hidden" name="actiontype" value="search" />
							<input type="hidden" name="stno" value="${stno}" />
							<input type="hidden" name="forwardurl" value="/student/earlywarnmanager.jsp" />
							<button class="orange-button">搜索</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>

	<table id="earlywarn" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>
					<b>标题</b>
				</th>
				<th>
					<b>预警类型</b>
				</th>
				
				<th>
					<b>预警时间</b>
				</th>
				
				<th>
					<b>状态</b>
				</th>


				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listearlywarn== null || fn:length(listearlywarn) == 0}">
				<tr>
					<td colspan="20">没有相关学生预警信息</td>
				</tr>
			</c:if>
			<%	
								     SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
									if(request.getAttribute("listearlywarn")!=null)
								      {
									  List<Earlywarn> listearlywarn=( List<Earlywarn>)request.getAttribute("listearlywarn");
								     for(Earlywarn  temearlywarn  :  listearlywarn)
								      {
							%>
			<tr>
				
				<td><%=temearlywarn.getTitle()%></td>
				<td><%=temearlywarn.getYjtype()%></td>
				<td><%=sdf.format(temearlywarn.getCreatetime())%></td>
				<td>
				   <%if(temearlywarn.getState()==1){ %>
				                待读取
				   <%} %>
				   <%if(temearlywarn.getState()==2){ %>
				                已读取
				   <%} %>
				</td>
				<td>
					<a class="orange-href" href="${pageContext.request.contextPath}/student/earlywarndetails.jsp?id=<%=temearlywarn.getId()%>">查看</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
