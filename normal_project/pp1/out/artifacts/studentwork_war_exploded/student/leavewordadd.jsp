﻿<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>

<%

String  tno=request.getParameter("tno");
TeacherService teacherSrv=BeansUtil.getBean("teacherService", TeacherService.class);

if( tno!=null){
 
  Teacher temobjteacher=teacherSrv.load(" where tno='"+ tno+"'");
  request.setAttribute("teacher",temobjteacher);
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>留言</title>
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
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
			            editor = KindEditor.create('textarea[name="dcontent"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
		$("#txtCreatetime").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
                      $("#txtReplytime").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
			            editor = KindEditor.create('textarea[name="replycontent"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#leavewordForm").validate();
        });  
    </script>
    
  
    
</head>
<body>
	<div class="search-title">
		<h2>新建留言</h2>
		<div class="description"></div>
	</div>
	<form name="leavewordform" method="post"
		action="${pageContext.request.contextPath}/admin/leavewordmanager.do"
		id="leavewordForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden"  name="replyren" value="${teacher.tno}"/>
			<input type="hidden"  name="replyren" value="${teacher.tno}"/>
			<input type="hidden"  name="lyren" value="${student.stno}"/>
			<input type="hidden"  name="stname" value="${student.name}"/>
			
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl"
				value="/student/leavewordadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/leavewordmanager.do?actiontype=get&lyren=${student.stno}&forwardurl=/student/leavewordmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
			<td width="10%" align="right">工号:</td>
			<td>${requestScope.teacher.tno}</td>
			<td colspan="2" rowspan="6"><img id="imgPhoto" width="200px" height="200px"
				src="${requestScope.teacher.photo}" /></td>
		</tr>
		<tr>
			<td width="10%" align="right">姓名:</td>
			<td>${requestScope.teacher.name}</td>
		</tr>
		
		<tr>
			<td align="right">性别:</td>
			<td>${requestScope.teacher.sex}</td>
		</tr>
		<tr>
			<td width="10%" align="right">籍贯:</td>
			<td>${requestScope.teacher.jiguan}</td>
		</tr>
		<tr>
			<td width="10%" align="right">职位:</td>
			<td>${requestScope.teacher.zhiwei}</td>
		</tr>
		<tr>
			<td width="10%" align="right">职称:</td>
			<td>${requestScope.teacher.zhicheng}</td>
		</tr>
		
		<tr>
				<td align="right">咨询标题:</td>
				<td colspan="3"><input name="title" placeholder="标题"
					validate="{required:true,messages:{required:'请输入标题'}}"
					value="${requestScope.leaveword.title}" class="input-txt"
					type="text" id="txtTitle" />
				</td>
			</tr>
		
			<tr>
				<td align="right">内容:</td>
				<td colspan="3"><textarea name="dcontent" id="txtDcontent"
						style="width:98%;height:200px;">${requestScope.leaveword.dcontent}</textarea>
				</td>
			</tr>			
			<tr>
				<td colspan="4">
					<div class="ui-button">
						<button class="ui-button-text">
							<i class="icon-ok icon-white"></i>提交
						</button>
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
