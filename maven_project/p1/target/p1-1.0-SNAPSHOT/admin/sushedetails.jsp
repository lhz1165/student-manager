<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
     SusheService susheSrv=BeansUtil.getBean("susheService",  SusheService.class);
    if( id!=null)
    {
      Sushe temobjsushe=susheSrv.load(" where id="+ id);
      request.setAttribute("sushe",temobjsushe);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>宿舍信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看宿舍
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >宿舍号:</td>
											   <td>
												   ${requestScope.sushe.ssno}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >说明:</td>
											   <td>
												   ${requestScope.sushe.des}
												</td>
											   </tr>
				        </table>
</body>
</html>
