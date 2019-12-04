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
        <title>上传视频</title>
         <base href="<%=basePath%>"></base>
        <link href="css/bootstrap.min.css"  rel="stylesheet" type="text/css" />
        <link href="css/tshowInfo.css"  rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" ></script>
    </head>
    <body>
        <!--<div class="container">-->
        <div class="topDiv" style=" background:url(images/1002.jpg) ">
            <div id="navigation">
                 <div class="welcome">
	                <c:if test="${not empty teacher}">     
					    <br/>
					             欢迎您：${teacher.teaName} &nbsp;&nbsp;
					    <a href="javascript:void(0)" onclick="logout()">安全退出</a> 
					    <br/><br/><br/>
	 				</c:if>
            </div>
            </div>
        </div>
        <div class="middleDiv" >
            <div class="leftDiv" style=" background:url(images/1001.jpg)">
               <div>  
                    <ul class="navMenu">
                        <li><a href="personalInfo.jsp">个人信息</a></li>
                        <li><a href="updatePass.jsp">修改密码</a></li>
                        <li><a href="vedioAdd.jsp">教学资料</a></li>
                        <li><a href="manageCourses.jsp">教学课程</a></li> 
                        <li><a href="manageGrade.jsp">成绩管理</a></li> 
                        <li><a href="messagetShow.jsp">师生交流</a></li> 
                    </ul> 
               </div>  
            </div>
            <div class="centerDiv"  style=" background:url(images/login_4.jpg)" >
                  <div class="contentDiv">
                  <h3 class="text-danger text-center"  style="margin-bottom: 15px">个人信息</h3>
                  <br>
                    <div class="perdiv">
                        <div class="div1">
                            <div class="btndiv">
                            </div>
                        </div>  
                        <div class="masdiv"> 
                           <div id="container">
                             <form action="${pageContext.request.contextPath}/vedio/saveVedio"  method="post">
                               <input type="submit" value="上传" >
                             </form>                                                         
                           </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <div class="bottomDiv">Copyright © 2018 All rights reserved. Doublezl 版权所有</div>
    </body>
    <script>
    function logout(){
    	if(confirm("确定要退出吗?")){
    		location.href="${pageContext.request.contextPath}/teacher/logout";
    	}
    }
</script>
</html>
