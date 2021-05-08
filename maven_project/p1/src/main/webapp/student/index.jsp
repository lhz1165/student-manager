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
		 

		 <%
		          
		           List<Earlywarn> listaimessage=null;
		           int  readcount=0;
		           EarlywarnService aimessageSrv=BeansUtil.getBean("earlywarnService", EarlywarnService.class);
		           if(tem_student!=null){
		              listaimessage=aimessageSrv.query(MessageFormat.format("select * from earlywarn aim  where state=1  and stno=''{0}'' ",tem_student.getStno()));
		              readcount= listaimessage.size();
		           }
		    
		    %>
		   

		            var waitcount=<%=readcount%>;
		            if(waitcount>0){
			            art.dialog.notice({
			                title: '预警信息推送',
			                width: 220, // 必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致artDialog收缩
			                content: '你有 '+waitcount+'条预警信息待读取<a target="main" href="${pageContext.request.contextPath}/admin/earlywarnmanager.do?actiontype=get&&stno=${student.stno}&state=1&forwardurl=/student/earlywarnmanager.jsp">查看</a>',
			                icon: 'face-sad',
			                time: 20
			            });
		            }
		           
		        });
		    
		    </script>
		 

</head>
<body>
 <div id="head">
        <div id="logo">
            <span style="display: block; position: relative; width:660px; height: 68px;">
                <font style="position: absolute; top: 20px; font-family: 微软雅黑; font-weight: bold;
                    font-size: 30px; color: #1c7ec7; letter-spacing: 3px; border: 0px;">学生管理信息系统(学生)
                </font>
            </span>
        </div>
        <div id="menu">
            <div class="wel">
                <label style='padding-bottom: 0px;'>
                    <img src="${pageContext.request.contextPath}/admin/images/admin-ico.gif" /></label>
                <label>
                   ${student.stno}-${student.name}
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
                    <iframe src="${pageContext.request.contextPath}/student/accountinfo.jsp" style="padding-bottom:30px;" frameborder="0" width="100%"  name="main"
                        id="main">
                    </iframe>
                </td>
            </tr>
        </table>
    </div>
    <div style="clear: both;">
    </div>
    <div style="width: 100%;">
                      课程管理
    </div>
</body>
</html>
