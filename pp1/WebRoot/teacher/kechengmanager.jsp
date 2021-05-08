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
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           top.$.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             top.$.dialog.confirm("你确定要注销课程信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/kechengmanager.do?actiontype=delete&forwardurl=/teacher/kechengmanager.jsp&tno=${teacher.tno}&id='+id);
				         });
			        });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>课程管理</h2>
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
							<input type="hidden" name="forwardurl" value="/teacher/kechengmanager.jsp"/>
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
   <div class="action-details">
		<span class="orange-href" id="btnCheckAll">选择</span>
		<span id="btnDelete" class="orange-href">删除 </span>
	</div>

		<table id="module" width="100%" border="0" cellspacing="0"
			cellpadding="0" class="ui-record-table">
			<thead>
				<tr>
					<th>选择</th>
					<th><b>课程名</b>
					</th>
					<th><b>课程编号</b>
					</th>
					<th><b>学分</b>
					</th>
					<th><b>课程状态</b>
					</th>
					<th><b>开课教师</b>
					</th>
					<th>操作</th>
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
					<td>&nbsp<input id="chk<%=temkecheng.getId()%>" class="check"
						name="chk<%=temkecheng.getId()%>" type="checkbox"
						value='<%=temkecheng.getId()%>'>
					</td>
					<td><%=temkecheng.getSubname()%></td>
					<td><%=temkecheng.getSubno()%></td>
					<td><%=temkecheng.getXuefen()%></td>
					<td><%=temkecheng.getStatus()%></td>
					<td><%=temkecheng.getTname()%>(<%=temkecheng.getTno() %>)</td>
					<td>
					   <%if(temkecheng!=null&&temkecheng.getStatus()!=null&&temkecheng.getStatus().equals("选课结束")){ %>
					      <form style="display: inline" action="${pageContext.request.contextPath}/admin/kechengmanager.do">
					            <input type="hidden" name="actiontype" value="startXuanke"/>
					            <input type="hidden" name="id" value="<%=temkecheng.getId()%>"/>
					            <input type="hidden" name="forwardurl" value="/admin/kechengmanager.do?actiontype=get&forwardurl=/teacher/kechengmanager.jsp"/>
					            <button class="btn btn-success"><i
							            class="icon-zoom-in icon-white"></i>启动选课
							    </button>
					      </form>
					       
					   <%} %>
					   <%if(temkecheng!=null&&temkecheng.getStatus()!=null&&temkecheng.getStatus().equals("选课中")){ %>
					      <form style="display: inline" action="${pageContext.request.contextPath}/admin/kechengmanager.do">
					            <input type="hidden" name="actiontype" value="endXuanke"/>
					            <input type="hidden" name="id" value="<%=temkecheng.getId()%>"/>
					            <input type="hidden" name="forwardurl" value="/admin/kechengmanager.do?actiontype=get&forwardurl=/teacher/kechengmanager.jsp"/>
					            <button class="btn btn-danger"><i
							            class="icon-zoom-in icon-white"></i>结束选课
							    </button>
					      </form>
					   <%} %>
					  <a class="btn btn-success"
						href="${pageContext.request.contextPath}/teacher/kechengdetails.jsp?id=<%=temkecheng.getId()%>"><i
							class="icon-zoom-in icon-white"></i>查看</a></td>
				</tr>
				<%}}%>
			</tbody>
		</table>
	
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
