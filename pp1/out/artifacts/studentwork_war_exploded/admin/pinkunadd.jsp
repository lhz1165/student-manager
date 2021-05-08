﻿<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>贫困生</title>
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
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#pinkunForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>新建贫困生</h2>
		<div class="description"></div>
	</div>
	<form name="pinkunform" method="post" action="${pageContext.request.contextPath}/admin/pinkunmanager.do" id="pinkunForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="appid" value="${appid}"/>
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/pinkunadd.jsp" />
			<input type="hidden" name="forwardurl" value="/admin/pinkunmanager.do?actiontype=get&forwardurl=/admin/pinkunmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">学号:</td>
				<td>
					${student.stno }
					<input name="stno" placeholder="学号" validate="{required:true,messages:{required:'请输入学号'}}" value="${student.stno}" class="input-txt" type="hidden" />
				</td>
				<td colspan="2" rowspan="6">
				    <img src="${student.photo }" width="200" height="200"/>
				    <input name="photo" placeholder="相片" validate="{required:true,messages:{required:'请输入相片'}}" value="${student.photo}" class="input-txt" type="hidden"  />
				</td>
			</tr>
			<tr>
				<td align="right">姓名:</td>
				<td>
				    ${student.name }
					<input name="stname" placeholder="姓名" validate="{required:true,messages:{required:'请输入姓名'}}" value="${student.name}" class="input-txt" type="hidden"  />
				</td>
			</tr>
			<tr>
				<td align="right">联系方式:</td>
				<td>
					<input name="moible" placeholder="联系方式" validate="{required:true,mobile:true,messages:{required:'请输入联系方式',mobile:'请输入正确的联系方式'}}" value="${student.mobile}" class="input-txt" type="text" id="txtMoible" />
				</td>
			</tr>
			<tr>
				<td align="right">身份号:</td>
				<td>
					<input name="idcardno" placeholder="身份号" validate="{required:true,idcardno:true,messages:{required:'请输入身份号',idcardno:'请输入正确身份证号'}}" value="${requestScope.pinkun.idcardno}" class="input-txt" type="text" id="txtIdcardno" />
				</td>
			</tr>
			<tr>
				<td align="right">家庭户口:</td>
				<td>
				    <select style="width:120px;height:44px;" name="jthukou">
				        <option value="农村户口">农村户口</option>
				        <option value="城镇户口">城镇户口</option>
				    </select>
				</td>
			</tr>
			<tr>
				<td align="right">贫困原因:</td>
				<td>
					<input name="reason" placeholder="贫困原因" validate="{required:true,messages:{required:'请输入贫困原因'}}" value="${requestScope.pinkun.reason}" class="input-txt" type="text" id="txtReason" />
				</td>
			</tr>
			<tr>
				<td align="right">籍贯:</td>
				<td>
					<input name="jiguan" placeholder="籍贯" validate="{required:true,messages:{required:'请输入籍贯'}}" value="${student.jiguan}" class="input-txt" type="text"  />
				</td>
			
				<td align="right">帮扶日期:</td>
				<td>
					<input name="begdate" value="${requestScope.pinkun.begdate}" type="text" id="txtBegdate" class="input-txt" validate="{required:true}" />
				</td>
			</tr>
			<tr>
				<td align="right">帮扶计划:</td>
				<td>
					<input name="bfjh" placeholder="帮扶计划" validate="{required:true,messages:{required:'请输入帮扶计划'}}" value="${requestScope.pinkun.bfjh}" class="input-txt" type="text" id="txtBfjh" />
				</td>
			
				<td align="right">贫困类别:</td>
				<td>
					<select name="pktype" id="ddlPktype" class="dropdown">
						<option value="一般贫困">一般贫困</option>
						<option value="特别贫困">特别贫困</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td align="right">录入人:</td>
				<td>
					<input name="lururen" placeholder="录入人" validate="{required:true,messages:{required:'请输入录入人'}}" value="${requestScope.pinkun.lururen}" class="input-txt" type="text" id="txtLururen" />
				</td>
			
				<td align="right">家庭地址:</td>
				<td>
					<input name="homeaddress" placeholder="家庭地址" validate="{required:true,messages:{required:'请输入家庭地址'}}" value="${requestScope.pinkun.homeaddress}" class="input-txt" type="text" id="txtHomeaddress" />
				</td>
			</tr>
			
			<tr>
				<td align="right">说明:</td>
				<td colspan="3">
					<textarea name="des" id="txtDes" style="width: 98%; height: 200px;">${requestScope.pinkun.des}</textarea>
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
