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
        <title>课程管理</title>   
        <base href="<%=basePath%>"></base>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/teacher.css" rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
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
	        <div class="leftDiv" style="background:url(images/1001.jpg)">
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
            <div class="centerDiv">  
                   <div class="contentDiv">
                    <h3 class="text-danger text-center"  style="margin-bottom: 15px">教学课程</h3>
                    <div class="text-center">
                           <form action="${pageContext.request.contextPath}/course/findcourses"  method="post">
                              <input type="hidden" name="teaNo" value="${teacher.teaNo}">
                              <input type="submit" value="查询" class="btn btn-small btn-danger">
                           </form>
                   </div>
                        <table class="table table-striped table-hover dataTable">
                            <tr>
	                            <th>课程名称</th>
	                            <th>教室类型</th>
	                            <th>学年</th>
	                            <th>学期</th>
	                            <th>班级</th>
                            </tr>
                            <c:forEach items="${courseList}"  var="c">
	                            <tr>
		                            <td>${c[0]}</td>
		                            <td>${c[1]}</td>
		                            <td>${c[2]}</td>
		                            <td>${c[3]}</td>
		                            <td>${c[4]}</td>
	                            </tr>
						   </c:forEach>
                        </table>
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
