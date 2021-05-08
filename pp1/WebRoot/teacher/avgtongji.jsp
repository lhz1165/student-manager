<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>平均分统计</title>
     <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
	    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />    
	<script type="text/javascript">
	      $(function(){
	    	 
	      })
	 </script>
	</head>
<body>
	<div class="search-title">
		<h2>科目平均分统计</h2>
		<div class="description"></div>
	</div>

	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/tongjimanager.do"
			method="post">
			<input type="hidden" name="actiontype" value="avgTongji" /> <input
				type="hidden" name="forwardurl" value="/teacher/avgtongji.jsp" />
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>班级: <web:dropdownlist name="banji" id="banji"
								cssclass="dropdown" value="${banji}"
								datasource="${banji_datasource}" textfieldname="name"
								valuefieldname="name">
							</web:dropdownlist>


							<div class="ui-button">
								<button class="ui-button-text">搜索</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div style="height: 5px;"></div>
	<c:if test="${imageurl!= null }">
		<img src="${imageurl}" />
	</c:if>
</body>
</html>
