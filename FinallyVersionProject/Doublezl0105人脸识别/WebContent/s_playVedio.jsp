<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>视频播放</title>
         <base href="<%=basePath%>"></base>
        <link href="css/bootstrap.min.css"  rel="stylesheet" type="text/css" />
        <link href="css/tshowInfo.css"  rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" ></script>
    </head>
    <body>
        <div class="topDiv" style=" background:url(images/1002.jpg) ">
            <div id="navigation">
                 <div class="welcome">
	                <c:if test="${not empty student}">     
					    <br/>
					             欢迎您：${student.stuName} &nbsp;&nbsp;
					    <a href="javascript:void(0)" onclick="logout()">安全退出</a> 
					    <br/><br/><br/>
	 				</c:if>
            </div>
            </div>
        </div>  
        <div class="middleDiv" >
            <div style="width:100%; height:100%; margin-top:0px;border:0px solid green;padding:1px">
			  <video width="100%" height="100%" controls="controls">
				  <source type="video/mp4"
				  src="${pageContext.request.contextPath}/upload/${vedio.vedioAttachment}" 
				  />
			  </video>
		  </div>
        </div>
       <div class="bottomDiv">Copyright © 2018 All rights reserved. Doublezl 版权所有</div>
    </body>
    <script>
    function logout(){
    	if(confirm("确定要退出吗?")){
    		location.href="${pageContext.request.contextPath}/student/logout";
    	}
    }
</script>
</html>
