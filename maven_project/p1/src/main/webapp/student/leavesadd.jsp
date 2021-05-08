<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>请假</title>
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
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

   <script type="text/javascript">
        function initControl(){
	              var flag="${flag}"   
        	      if(flag!="1"){
        	         $("#txtBegdate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
                      $("#txtEnddate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
        	      }
			      editor = KindEditor.create('textarea[name="applydes"]', {
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
            $("#leavesForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>请假申请</h2>

	</div>

	<div class="box">

		<div class="box-content">
			<form name="leavesform" method="post"
				action="${pageContext.request.contextPath}/admin/leavesmanager.do"
				id="leavesForm">

				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input name="zgname" placeholder="申请人姓名"
						validate="{required:true,messages:{required:'请输入申请人姓名'}}"
						value="${student.name}" class="input-txt" type="hidden"
					 />
					<input name="accountname" placeholder="工号"
						validate="{required:true,messages:{required:'请输入工号'}}"
						value="${student.stno}" class="input-txt" type="hidden"
						id="txtAccountname" />
					<input type="hidden" name="actiontype" value="${actiontype}" />
					<input type="hidden" name="seedid" value="${seedid}" />
					<input type="hidden" name="errorurl" value="/student/leavesadd.jsp" />
					<input type="hidden" name="forwardurl"
						value="/admin/leavesmanager.do?actiontype=get&accountname=${student.stno }&forwardurl=/student/leavesmanager.jsp" />
					<tr>
						<td colspan="4">${errormsg}</td>
					</tr>

					<tr>
						<td width="12%" align="right">申请人姓名</td>
						<td width="20%">${student.name}</td>
						<td width="*" colspan="2" rowspan="4"><img
							src="${student.photo}" width="200" height="200" /></td>

					</tr>
					<tr>
						<td align="right">学号</td>
						<td>${student.stno }</td>
					</tr>

					<tr>
						<td align="right">开始日期:</td>
						<td><input name="begdate" value="${requestScope.begdate}"
							type="text" id="txtBegdate" class="input-txt"
							validate="{required:true}" /></td>
					</tr>
					<tr>
						<td align="right">结束日期:</td>
						<td><input name="enddate" value="${requestScope.enddate}"
							type="text" id="txtEnddate" class="input-txt"
							validate="{required:true}" /></td>
					</tr>
					<tr>
						<td align="right">分类:</td>
						<td><select name="xtype" class="dropdown" id="ddlXtype"
							ltype="select">
								<option value="病假">病假</option>
								
								<option value="突发事件">突发事件</option>
						</select></td>
					</tr>
					<tr>
						<td align="right">天数:</td>
						<td><input name="tianshu" placeholder="天数"
							style="width:80px;"
							validate="{required:true,digits:true,max:10,min:1,messages:{required:'请输入天数',digits:'请输入正确天数',max:'最多不能超过10天',min:'最小不能小于一天'}}"
							value="${requestScope.leaves.tianshu}" class="input-txt"
							type="text" id="txtTianshu" />天</td>
					</tr>
					<tr>
						<td align="right">说明:</td>
						<td colspan="3"><textarea name="applydes" id="txtApplydes"
								style="width:98%;height:200px;">${requestScope.leaves.applydes}</textarea>
						</td>
					</tr>

					<tr>
						<td colspan="4">
							<div class="ui-button">
								<button class="btn btn-large btn-primary">
									<i class="icon-ok icon-white"></i>提交
								</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>
</body>
</html>
