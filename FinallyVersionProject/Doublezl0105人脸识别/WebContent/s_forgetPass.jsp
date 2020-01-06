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
        <title>初始化密码</title>
        <base href="<%=basePath%>"></base>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
        <link href="css/guanli.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="topDiv" style=" background:url(images/1002.jpg) ">
            <div id="navigation">
                <div class="welcome">
                <c:if test="${not empty student}">     
				    <br/>
				             欢迎您： &nbsp;&nbsp;
				    <a href="javascript:void(0)" onclick="logout()">安全退出</a> 
				    <br/><br/><br/>
 				</c:if>
            </div>
            </div>
        </div>
        <div class="middleDiv" >
        <div class="leftDiv" style="background:url(images/1001.jpg)">
            <div>
	            <ul class="navMenu">
	                <ul class="navMenu">
 <!--                     <li><a href="s_gerenkebiao.jsp">查看个人课表</a></li> 
                        <li><a href="s_kebiaochaxun.jsp">查看课表</a></li>
		                <li><a href="s_chengjichaxun.jsp">个人成绩查询</a></li>  -->   
                    </ul>   
	            </ul> 
          </div>
       </div>
            <div class="centerDiv">  
                   <div class="contentDiv">
                    <h3 class="text-danger text-center"  style="margin-bottom: 15px">初始化密码</h3>
                    <div class="text-center">
                           <form action="${pageContext.request.contextPath}/student/forgetPass"  method="post">
							    </br>
							          学号:<input name="stuNo" type="text">
							    </br></br>
							           姓名:<input name="stuName" type="text" > 
							    </br></br>
							         新密码: <input name="stuPass" type="text" >
							     </br> </br>
							      <input type="submit" value="修改">
						   </form>
                     </div>
                       
                </div>
            </div>
        </div>
        <div class="bottomDiv">Copyright © 2018 All rights reserved. Doublezl 版权所有</div>
    </body>
</html>