<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录</title>
<style type="text/css">
    body{
       background-color:#3b5d88;
    }
</style>

      <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css">

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js" type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" type="text/javascript"></script>
  <script type="text/javascript"> 
  
      
       if(top.window!=window)
    	   top.location.href="login.jsp";
      
      $(function(){
      
    	  $("#btnReloadImage,#imgvc").on("click",function () {

              $("#imgvc").prop("src", "../plusin/image.jsp?time="+new Date().getMilliseconds());

          });
    	  
    	  var userType="${usertype}";
     		
     	  if(userType!=""){
     			
     			$("[name=usertype][value="+userType+"]").prop("checked",true);
     	  }
           $("#loginForm").submit(function(){
              
              //alert($("#txtUsername").val());
               if($("#txtUsername").val()=="")
               {
                  alert("用户名不能为空");
                  return false;
               }
               return true;
           
           });
          
      
      });
  
  </script>
							

</head>
<body>
  <form method="post" action="${pageContext.request.contextPath}/admin/login.do" id="loginForm">
           
           <input type="hidden" name="actiontype" value="login" />
           
           <input type="hidden" name="forwardurl"   value="/admin/index.jsp"/>
   <div class="header">

        <div class="logo-container">
            <div class="logo-font">

                <strong>学生管理信息系统</strong>

            </div>

        </div>




    </div>

    <div style="padding-right: 20px;">

        <div class="row">
            <div class="col-sm-4">
              
            </div>
            <div class="col-sm-4  form-box">

                <div id="login-loading" class="loading-mask">
                    <div class="loading-icon"></div>
                    <div class="loading-mask-body"></div>
                </div>

                <div class="form-top">
                    <div class="form-top-left">

                        <h3>
                            系统用户登录

                        </h3>

                    </div>

                </div>

                <div class="form-content">

                        <input type="hidden" name="actiontype" value="login" />
                        <div class="input-group">
                            <label class="input-group-addon dl-icon-left">
                                <i class="fa fa-user dl-icon"></i>
                            </label>
                            <input type="text" name="username"  style="font-size:18px;font-weight:600; "  placeholder="系统账号" value="${username}" class="form-control">
                        </div>
                        <div class="input-group">
                            <label class="input-group-addon dl-icon-left">
                                <i class="fa fa-lock dl-icon"></i>
                            </label>
                            <input type="password" name="password"  style="font-size:18px;font-weight:600; "  value="${password}" placeholder="登陆密码" class="form-control">
                        </div>
                        
                         <div class="input-group">
                            <label class="input-group-addon dl-icon-left">
                                                                                             用户类型:
                            </label>
                            
                             <input name="usertype" value="2" type="radio" checked="checked"/>学生
							   <input name="usertype" value="1" type="radio" />教师
							      <input name="usertype" value="0" type="radio" />管理员 
							
                        </div>

                        <div class="input-group">

                            <label style="padding:0px;" class="input-group-addon dl-icon-left">

                                <img id="imgvc" class='validatecode' src="../plusin/image.jsp" width="70" height="47" alt="图片看不清？点击重新得到验证码" style="cursor:pointer;" />
                            </label>
                            <input type="text" name="validcode"  style="font-size:18px;font-weight:600; " value="${validcode}" placeholder="验证码" class="form-input form-control">
                            <span id="btnReloadImage" style="cursor:pointer;" class="input-group-addon dl-icon-left">
                                看不清换一组
                            </span>
                        </div>
                        <div style="text-align: center;">
                            <button type="submit" id="btnLogin" class="login-button">登陆</button>
                        </div>
                        <div id="error-container">
                            ${errmsg}
                        </div>

                   

                </div>
                
                <div >
                   <div style="padding-left:200px;padding-top:80px;">
                        <a style="color:#fff;" href="${pageContext.request.contextPath}/admin/studentmanager.do?actiontype=load&forwardurl=/register.jsp">注册</a>
                   </div>
                  
                 </div>
                 
            </div>
        </div>

    </div>



</form>
</body>
</html>