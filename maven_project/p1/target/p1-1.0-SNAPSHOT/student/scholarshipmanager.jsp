<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>奖学金信息</title>
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
		<h2>奖学金管理</h2>
		<div class="description"></div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm" action="${pageContext.request.contextPath}/admin/scholarshipmanager.do" method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>
							标题
							<input name="title" value="${title}" class="input-txt" type="text" id="title" />
							<input type="hidden" name="actiontype" value="search" />
							<input type="hidden" name="stno" value="${student.stno}" />
							<input type="hidden" name="forwardurl" value="/student/scholarshipmanager.jsp" />
							<button class="orange-button">搜索</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	
	<table id="scholarship" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>
					<b>标题</b>
				</th>
				<th>
					<b>类别</b>
				</th>
				<th>
					<b>获奖日期</b>
				</th>
				<th>
					<b>获奖人</b>
				</th>
				<th>
					<b>学生姓名</b>
				</th>
				<th>
					<b>学年</b>
				</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listscholarship== null || fn:length(listscholarship) == 0}">
				<tr>
					<td colspan="20">没有相关奖学金信息</td>
				</tr>
			</c:if>
			<%	
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listscholarship")!=null)
								      {
									  List<Scholarship> listscholarship=( List<Scholarship>)request.getAttribute("listscholarship");
								     for(Scholarship  temscholarship  :  listscholarship)
								      {
							%>
			<tr>
				
				<td><%=temscholarship.getTitle()%></td>
				<td><%=temscholarship.getXtype()%></td>
				<td><%=sdf.format(temscholarship.getHjdate())%></td>
				<td><%=temscholarship.getStno()%></td>
				<td><%=temscholarship.getStname()%></td>
				<td><%=temscholarship.getXuenian()%></td>
				<td>
					<a class="orange-href" href="${pageContext.request.contextPath}/student/scholarshipdetails.jsp?id=<%=temscholarship.getId()%>">查看</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
