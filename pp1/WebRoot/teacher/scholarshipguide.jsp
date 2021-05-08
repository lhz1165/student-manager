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
	</head>
	 <body >
	 	   <div class="search-title">
			<h2>奖学金录入</h2>
			<div class="description">
			</div>
		</div>
					<!-- 搜索控件开始 -->
		          <div class="search-options">
			        <form id="searchForm"  action="${pageContext.request.contextPath}/admin/studentmanager.do" method="post" >
					   <table  cellspacing="0" width="100%">
					        <tbody>
					          <tr>
					             <td>
                学号
                                            <input name="stno"  value="${stno}" class="input-txt" type="text" id="stno"  />
					                  <input type="hidden"   name="actiontype" value="search"/>
					                  <input type="hidden"   name="seedid" value="${seedid}"/>
					                  <input type="hidden"   name="forwardurl" value="/teacher/studentlist.jsp"/>
					                 <div class="ui-button">
					                    <button class="ui-button-text">
				                               搜索
				                          </button>
					                </div>
					             </td>
					          </tr>
					        </tbody>
					   </table>
					   </form>
					</div>
					<!-- 搜索控件结束 -->
					<div class="clear">
					</div>
<div class="picture-box2">
		                                <ul>
								<%	
									if(request.getAttribute("liststudent")!=null)
								      {
									  List<Student> liststudent=( List<Student>)request.getAttribute("liststudent");
								     for(Student  temstudent  :  liststudent)
								      {
						        %>	
								<li>
								  <a href="${pageContext.request.contextPath}/teacher/studentdetails.jsp?id=<%= temstudent.getId()%>">
										<img width="180" height="180" src="<%= temstudent.getPhoto()%>" />
								  </a> 
								    <span> <%= temstudent.getName()%></span> 
								     <div style="text-align:center;">
									        <a class="btn btn-info"  href="${pageContext.request.contextPath}/admin/studentmanager.do?actiontype=load&id=<%= temstudent.getId()%>&forwardurl=/teacher/studentlistnext.jsp">
											设置工资
										</a> 
									</div>
							   </li>
							<%}}%>
					</li>
					</ul>
				</div>
				<!--end  picture-box-->
				<div class="clear"></div>
				<daowen:pager id="pager1"  attcheform="searchForm" />
	</body>
</html>
