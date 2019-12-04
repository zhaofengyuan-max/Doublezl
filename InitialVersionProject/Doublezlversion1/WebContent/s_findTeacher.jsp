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
        <title>课表查询</title>
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
		                <li><a href="s_studentstatus.jsp">学籍信息</a></li>
		                <li><a href="s_updatepassword.jsp">修改密码</a></li>
		                <li><a href="s_chengjichaxun.jsp">个人成绩查询</a></li>
		                <li><a href="s_findTeacher.jsp">教师查询</a></li>
		                <form action="demo05">
		                   <input type="submit" value="学生选课" style="border:0px; background-color:transparent; color:#fff">
		                </form>
		                <li><a href="s_kebiaochaxun.jsp">查看课表</a></li>
		                <li><a href="s_showVedio.jsp">学生教学资料</a></li>
	                   <li><a href="s_messagesShow.jsp">学生留言展示</a></li> 
                   </ul> 
          </div>
       </div>
            <div class="centerDiv">  
                   <div class="contentDiv">
                    <h3 class="text-danger text-center"  style="margin-bottom: 15px">课表查询</h3>
                    <div class="text-center">
                           <form action="${pageContext.request.contextPath}/student/findTeacher"  method="post">
                        <input type="hidden" name="stuNo" value="${student.stuNo}">	 		 
                             <input type="submit" value="查询" class="btn btn-small btn-danger">
                           </form>
                   </div>
                        <table class="table table-striped table-hover dataTable">
                                    <tr>
					            		<th>教师姓名</th>
					            		<th>性别</th>			            
					            		<th>出生日期</th>				            
					            		<th>电子邮箱</th>				          
					            		<th>学院编号</th>				            
					            	</tr>
					            	<c:forEach items="${teacherList}"  var="t">
					            		<tr>
					            			<td>${t[0]} </td>
					            			<td>${t[1]}</td>
					            			<td>${t[2]}	</td>			            
					            			<td>${t[3]}	</td>		
					            			<td>${t[4]}	</td>			            				            
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
    		location.href="${pageContext.request.contextPath}/student/logout";
    	}
    }
</script>
</html>