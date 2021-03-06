<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>帮扶记录</title>
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
	  //开始绑定
	                 $("#stno").change(function(){
			        	 $("[name=stname]").val($("#stno option:selected").text());
			        	 $("#divStno").html($("#stno option:selected").val());
			         });
	                 $("[name=stname]").val($("#stno option:selected").text());
		        	 $("#divStno").html($("#stno option:selected").val());
		        	 $("#txtBegdate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
			            editor = KindEditor.create('textarea[name="des"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function () {
            initControl();
            $.metadata.setType("attr","validate");
            $("#bfrecordForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>新建帮扶记录</h2>
		<div class="description"></div>
	</div>
	<form name="bfrecordform" method="post" action="${pageContext.request.contextPath}/admin/bfrecordmanager.do" id="bfrecordForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/bfrecordadd.jsp" />
			<input type="hidden" name="forwardurl" value="/admin/bfrecordmanager.do?actiontype=get&forwardurl=/admin/bfrecordmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">姓名:</td>
				<td>
					<web:dropdownlist name="stno" id="stno" cssclass="dropdown" value="${requestScope.bfrecord.stno}" datasource="${stno_datasource}" textfieldname="stname" valuefieldname="stno">
					</web:dropdownlist>
					<input id="hidstname" name="stname" type="hidden" vlaue="${requestScope.bfrecord.stname}" />
				</td>
			</tr>
			<tr>
				<td align="right">学号:</td>
				<td>
				    <div id="divStno" style="font-size:18px;font-weight:600;"></div>
				</td>
			</tr>
			<tr>
				<td align="right">学年:</td>
				<td>
					<web:dropdownlist name="xuenian" id="xuenian" cssclass="dropdown" value="${requestScope.bfrecord.xuenian}" datasource="${xuenian_datasource}" textfieldname="name" valuefieldname="name">
					</web:dropdownlist>
				</td>
			</tr>
			<tr>
				<td align="right">帮扶类型:</td>
				<td>
					<select name="bftype" id="ddlBftype" class="dropdown">
						<option value="勤工助学">勤工助学</option>
						<option value="爱心救助">爱心救助</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">帮扶单位:</td>
				<td>
					<input name="bfdanwei" placeholder="帮扶单位" validate="{required:true,messages:{required:'请输入帮扶单位'}}" value="${requestScope.bfrecord.bfdanwei}" class="input-txt" type="text" id="txtBfdanwei" />
				</td>
			</tr>
			<tr>
				<td align="right">帮扶日期:</td>
				<td>
					<input name="begdate" placeholder="帮扶日期" validate="{required:true,messages:{required:'请输入帮扶日期'}}" value="${requestScope.bfrecord.begdate}" class="input-txt" type="text" id="txtBegdate" />
				</td>
			</tr>
			<tr>
				<td align="right">说明:</td>
				<td colspan="3">
					<textarea name="des" id="txtDes" style="width: 98%; height: 200px;">${requestScope.bfrecord.des}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button class="orange-button">
						<i class="icon-ok icon-white"></i>
						提交
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
