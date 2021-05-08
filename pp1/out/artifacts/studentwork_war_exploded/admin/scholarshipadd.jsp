<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>奖学金</title>
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
                    //结束绑定
                      $("#txtHjdate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
                   //开始绑定
	                 $("#stno").change(function(){
			        	  $("[name=stname]").val($("#stno option:selected").text());
			        	  $("#divStno").html($("#stno option:selected").val());
			          });
	                 $("[name=stname]").val($("#stno option:selected").text());
	                 $("#divStno").html($("#stno option:selected").val());
                    //结束绑定
                   //开始绑定
			
                    //结束绑定
        }
        $(function (){
            initControl();
            $.metadata.setType("attr","validate");
            $("#scholarshipForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>新建奖学金</h2>
		<div class="description"></div>
	</div>
	<form name="scholarshipform" method="post" action="${pageContext.request.contextPath}/admin/scholarshipmanager.do" id="scholarshipForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/scholarshipadd.jsp" />
			<input type="hidden" name="forwardurl" value="/admin/scholarshipmanager.do?actiontype=get&forwardurl=/admin/scholarshipmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">标题:</td>
				<td>
					<input name="title" placeholder="标题" validate="{required:true,messages:{required:'请输入标题'}}" value="${requestScope.scholarship.title}" class="input-txt" type="text" id="txtTitle" />
				</td>
			</tr>
			<tr>
				<td align="right">类别:</td>
				<td>
					<select name="xtype" id="ddlXtype" class="dropdown">
						<option value="校内奖学金">校内奖学金</option>
						<option value="国家奖学金">国家奖学金</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">获奖日期:</td>
				<td>
					<input name="hjdate" value="${requestScope.scholarship.hjdate}" type="text" id="txtHjdate" class="input-txt" validate="{required:true}" />
				</td>
			</tr>
			<tr>
				<td align="right">获奖人:</td>
				<td>
					<web:dropdownlist name="stno" id="stno" cssclass="dropdown" value="${requestScope.scholarship.stno}" datasource="${stno_datasource}" textfieldname="name" valuefieldname="stno">
					</web:dropdownlist>
					<input id="hidstname" name="stname" type="hidden" value="${requestScope.scholarship.stname}" />
				</td>
			</tr>
			<tr>
				<td align="right">学生姓名:</td>
				<td>
					<div id="divStno" style="font-size:18px;font-weight:600;">
					
					</div>
				</td>
			</tr>
			<tr>
				<td align="right">学年:</td>
				<td>
					<web:dropdownlist name="xuenian" id="xuenian" cssclass="dropdown" value="${requestScope.scholarship.xuenian}" datasource="${xuenian_datasource}" textfieldname="name" valuefieldname="name">
					</web:dropdownlist>
					<input id="hidname" name="name" type="hidden" vlaue="${requestScope.scholarship.name}" />
					
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
