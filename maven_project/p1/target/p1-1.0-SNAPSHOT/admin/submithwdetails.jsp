<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    Submithw temobjsubmithw=null;
    AttachementService attrSrv=BeansUtil.getBean("attachementService", AttachementService.class);
    SubmithwService submithwSrv=BeansUtil.getBean("submithwService", SubmithwService.class);
    if( id!=null)
    {
      
      temobjsubmithw=submithwSrv.load(" where id="+ id);
      request.setAttribute("submithw",temobjsubmithw);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>提交作业信息查看</title>
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
			<td width="15%" align="right">题目:</td>
			<td>${requestScope.submithw.hwtitle}</td>
		</tr>
		<tr>
			<td width="15%" align="right">布置老师:</td>
			<td>${requestScope.submithw.tname}</td>
		</tr>

		<tr>
			<td width="10%" align="right">提交学生:</td>
			<td>

				${requestScope.submithw.xuehao}(${requestScope.submithw.name})</td>
		</tr>
		<tr>
			<td align="right">提交时间:</td>
			<td><fmt:formatDate value="${requestScope.submithw.submittime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		</tr>

		<tr>
			<td align="right">说明:</td>
			<td colspan="3">${requestScope.submithw.des}</td>
		</tr>
		<tr>
			<td align="right">作业上传文档</td>
			<td colspan="3">
				<%
									    if( id!=null)
									    {
									    %>
				<div class="uploadify-queue">
					<ul>
						<%
									                List<Attachement> submithwattachementlist=attrSrv.getEntity(MessageFormat.format(" where belongtable=''submithw'' and belongid=''{0}''",id));
									                for(Attachement tema : submithwattachementlist)
									                {
									            %>
						<li><a
							href="${pageContext.request.contextPath}/plusin/download.jsp?&dwid=<%=id %>&filename=<%=tema.getFilename()%>"><%=tema.getFilename() %></a>
						</li>
						<%
									            } %>
					</ul>
				</div> <%} %>
			</td>
		</tr>


		<tr>
			<td align="right">状态:</td>
			<td>
				<%if(temobjsubmithw.getStatus()==1){ %> 待批阅 <%} %> <%if(temobjsubmithw.getStatus()==2){ %>
				已批阅 <%} %>
			</td>
		</tr>


		<%if(temobjsubmithw.getStatus()==2){ %>
		<tr>
			<td align="right">作业评语:</td>
			<td>${requestScope.submithw.piyue}</td>
		</tr>
		<tr>
			<td align="right">批阅时间:</td>
			<td>${requestScope.submithw.pytime}</td>
		</tr>
		<tr>
			<td align="right">作业得分:</td>
			<td><span class="weight14font">${requestScope.submithw.defen}</span>分</td>
		</tr>
		<%} %>
	</table>

</body>
</html>
