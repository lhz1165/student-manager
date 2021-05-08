<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>课程</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
			            editor = KindEditor.create('textarea[name="des"]', {
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
            $("#kechengForm").validate();
        });  
    </script>
</head>
<body>
	<div>
		<ul class="breadcrumb">
			<li><a href="#">课程管理</a> <span class="divider">/</span></li>
			<li><a href="#">新建课程</a></li>
		</ul>
	</div>
	<div class="row-fluid">
		<div class="box">
			<div class="box-header well">
				<h2>
					<i class="icon-th-large"></i> 新建课程
				</h2>
			</div>
			<div class="box-content">
				<form name="kechengform" class="form-horizontal" method="post"
					action="${pageContext.request.contextPath}/admin/kechengmanager.do"
					id="kechengForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="actiontype" value="${actiontype}" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input type="hidden" name="errorurl" value="/admin/kechengadd.jsp" />
						<tr>
						  <td colspan="2">
						  
						      ${errormsg}
						  </td>
						
						</tr>
						<tr>
							<td align="right">课程名:</td>
							<td><input name="subname"
								validate="{required:true,messages:{required:'请输入课程名'}}"
								value="${requestScope.kecheng.subname}" class="input-txt"
								type="text" id="txtSubname" /></td>
						</tr>
						<tr>
							<td align="right">课程编号:</td>
							<td><input name="subno"
								validate="{required:true,messages:{required:'请输入课程编号'}}"
								value="${requestScope.kecheng.subno}" class="input-txt"
								type="text" id="txtSubno" /></td>
						</tr>
						<tr>
							<td align="right">学分:</td>
							<td><input name="xuefen"
								validate="{required:true,digits:true,messages:{required:'请输入学分',digits:'请输入正确 学分'}}"
								value="${requestScope.kecheng.xuefen}" class="input-txt"
								type="text" id="txtXuefen" /></td>
						</tr>
						<tr>
							<td align="right">说明:</td>
							<td colspan="3"><textarea name="des" id="txtDes"
									style="width:98%;height:200px;">${requestScope.kecheng.des}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="ui-button">
									<button class="btn btn-large btn-primary">
										<i class="icon-ok icon-white"></i>提交
									</button>
								</div></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
