<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="law.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
   <link href="${pageContext.request.contextPath}/admin/css/main.css" rel="stylesheet" type="text/css" />
   <link href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
   <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js" type="text/javascript"></script>
   <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script type="text/javascript"> 
    $(function(){
         var icons = {
			    header: "ui-icon-circle-arrow-e",
			    activeHeader: "ui-icon-circle-arrow-s"
		 };
		 $("#loading").hide();
        $(".accordion-group .accordion-item" ).eq(0).show().accordion({
			    icons: icons
		})
		  var autoSize = function () {
				var _topheight=108;
               var _leftwidth=162;
               var height = document.documentElement.clientHeight - _topheight;
               var width = document.documentElement.clientWidth - _leftwidth;
               $('#main').css('height', height+ 'px');
           }
           autoSize();
           $(window).resize(autoSize);
		 $(".link").each(function(index,dom){
		      $(this).click(function(){
		          $("#nav a").removeClass("actived");
		          $( ".accordion-group .accordion-item" ).hide();
		          $( ".accordion-group .accordion-item" ).eq(index).show().accordion({
			         icons: icons
		          });
		          $(this).addClass("actived");
		      })
		 });
		 
})
    </script>
</head>
<body>
 <div id="head">
        <div id="logo">
            <span style="display: block; position: relative; width:660px; height: 68px;">
                <font style="position: absolute; top: 20px; font-family: 微软雅黑; font-weight: bold;
                    font-size: 30px; color: #1c7ec7; letter-spacing: 3px; border: 0px;">学生管理信息系统(管理员)
                </font>
            </span>
        </div>
        <div id="menu">
            <div class="wel">
                <label style='padding-bottom: 0px;'>
                    <img src="images/admin-ico.gif" /></label>
                <label>
                   ${users.username}
                </label>
                <a style="font-weight: bold" href="${pageContext.request.contextPath}/admin/login.jsp" >退出</a> 
            </div>
        </div>
       
        <div id="headBg">
        </div>
    </div>
    <div  id="content">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td width="170" style="background-color:#3baae3;" valign="top">
                    <jsp:include page="menu.jsp"></jsp:include> 
                </td>
                <td width="1" valign="top">
                    &nbsp;
                </td>
                <td valign="top">
                    <iframe src="${pageContext.request.contextPath}/admin/accountinfo.jsp" style="padding-bottom:30px;" frameborder="0" width="100%"  name="main"
                        id="main">
                    </iframe>
                </td>
            </tr>
        </table>
    </div>
    <div style="clear: both;">
    </div>
    <div style="width: 100%;">
        abc
    </div>
</body>
</html>
