<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>学生信息</title>
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
		<h2>学生档案管理</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/studentmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>学号 <input name="stno" value="${stno}" class="input-txt"
							type="text" id="stno" /> <input type="hidden" name="actiontype"
							value="myStudent" /> <input type="hidden" name="tno"
							value="${teacher.tno}" /> <input type="hidden" name="forwardurl"
							value="/teacher/studentmanager.jsp" />
							<div class="ui-button">
								<button class="ui-button-text">搜索</button>
							</div></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	
	<table id="student" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th><b>学号</b>
				</th>
				<th><b>姓名</b>
				</th>
				<th><b>性别</b>
				</th>
				<th><b>专业</b>
				</th>
				<th><b>班级</b>
				</th>
				
				<th><b>籍贯</b>
				</th>
				<th><b>联系电话</b>
				</th>
				
				<th><b>面貌</b>
				</th>

				<th><b>民族</b>
				</th>

				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${liststudent== null || fn:length(liststudent) == 0}">
				<tr>
					<td colspan="20">没有相关学生信息</td>
				</tr>
			</c:if>
			<%	
									if(request.getAttribute("liststudent")!=null)
								      {
									  List<Student> liststudent=( List<Student>)request.getAttribute("liststudent");
								     for(Student  temstudent  :  liststudent)
								      {
							%>
			<tr>
				
				<td><%=temstudent.getStno()%></td>
				<td><%=temstudent.getName()%></td>
				<td><%=temstudent.getSex()%></td>
				<td><%=temstudent.getZhuanye()%></td>
				<td><%=temstudent.getBjname()%></td>
				<td><%=temstudent.getJiguan()%></td>
				<td><%=temstudent.getMobile()%></td>
				
				<td><%=temstudent.getMianmao()%></td>

				<td><%=temstudent.getNation()%></td>

				<td>
					 <a class="orange-href"
					href="${pageContext.request.contextPath}/teacher/scholarshipadd.jsp?stid=<%=temstudent.getId()%>">奖学金登记</a>
					
					
					 <a class="orange-href"
					href="${pageContext.request.contextPath}/teacher/studentdetails.jsp?id=<%=temstudent.getId()%>">查看</a>
					
					
					</td>
				   
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
</body>
</html>
