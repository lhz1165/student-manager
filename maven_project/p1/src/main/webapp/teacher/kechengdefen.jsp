<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>课程信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js"
			type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
			   
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>课程得分</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/kechengmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>课程名 <input name="subname" value="${subname}"
							class="input-txt" type="text" id="subname" /> <input
							type="hidden" name="actiontype" value="search" /> <input
							type="hidden" name="seedid" value="${seedid}" />
							<input type="hidden" name="forwardurl" value="/teacher/kechengdefen.jsp"/>
							<button class="orange-button">
								搜索
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
   

		<table id="module" width="100%" border="0" cellspacing="0"
			cellpadding="0" class="ui-record-table">
			<thead>
				<tr>
					
					<th><b>课程名</b>
					</th>
					<th><b>任课教师</b>
					</th>
					<th><b>评教人数:</b>
					</th>
					<th><b>平均得分</b>
					</th>
					<th><b>操作</b>
					</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${listkecheng== null || fn:length(listkecheng) == 0}">
					<tr>
						<td colspan="20">没有相关课程信息</td>
					</tr>
				</c:if>
				<%	
									if(request.getAttribute("listkecheng")!=null)
								      {
									  List<Kecheng> listkecheng=( List<Kecheng>)request.getAttribute("listkecheng");
								     for(Kecheng  temkecheng  :  listkecheng)
								      {
							%>
				<tr>
					
					<td><%=temkecheng.getSubname()%>-<%=temkecheng.getSubno()%></td>
					
					<td><%=temkecheng.getTname()%>-<%=temkecheng.getTno()%></td>
					<td><span class="weight14font">
					     <%=temkecheng.getPjcount()%>人
					    </span>
					 </td>
					<td>
					     <span class="weight14font">
					         <%=temkecheng.getAvgscore()%>分
					     </span>
					
					</td>
					<td>
					
					      <a class="btn btn-success"
						href="${pageContext.request.contextPath}/teacher/kcvoteres.jsp?subno=<%=temkecheng.getSubno()%>"><i
							class="icon-zoom-in icon-white"></i>查看结果</a>
					</td>
					
					
				</tr>
				<%}}%>
			</tbody>
		</table>
	
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
