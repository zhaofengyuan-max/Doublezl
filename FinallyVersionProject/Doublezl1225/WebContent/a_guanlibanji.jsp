<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <title>管理班级</title>
        <base href="<%=basePath%>"></base>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
        <link href="css/guanli.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="topDiv" style=" background:url(images/1002.jpg) ">
            
        </div>
        <div class="middleDiv" >
        <div class="leftDiv" style="background:url(images/1001.jpg)">
            <div>
	            <div>
                  <ul class="navMenu">     
	                <li><a href="a_guanlixueyuan.jsp">学院管理</a></li>
                        <li><a href="a_guanlizhuanye.jsp">专业管理</a></li>
                        <li><a href="a_guanlibanji.jsp">班级管理</a></li>
                        <li><a href="a_guanlixuesheng.jsp">学生管理</a></li> 
                        <li><a href="a_guanliTeacher.jsp">教师管理</a></li> 
                   </ul> 
               </div>
          </div>
       </div>
            <div class="centerDiv">  
                   <div class="contentDiv">
                    <h3 class="text-danger text-center"  style="margin-bottom: 15px">管理班级</h3>
                    <div class="text-center">
                           <form action="${pageContext.request.contextPath}/admin/adminBat"  method="post">
                                                            学院:<input type="text" name="acaName">	
                                                            
				 	    专业:<input type="text" name="majName">		
                             <input type="submit" value="查询" class="btn btn-small btn-danger">
                           </form>
                   </div>
                        <table class="table table-striped table-hover dataTable">
                                    <tr>
				 		 			<th>班级编号</th>
					            	<th>班级名称</th>
					            	<th>班级人数</th>				            
					            	<th>所属专业</th>				            
					            	<th>所属院系</th>			           
					            	<th>操作</th>
					            	</tr>
					            	<c:forEach items="${blist}"  var="s">
					            	<tr>
					            	<td class="stuNo">${s[0]} </td>
					            	<td>${s[1]}</td>
					            	<td>${s[2]}	</td>			            
					            	<td>${s[3]}	</td>		
					            	<td>${s[4]}	</td>			            
					            	<td class="dele">删除</td>		           
					            	</tr>
					            	 </c:forEach>
                        </table>
                       
                </div>
            </div>
        </div>
        <div class="bottomDiv">Copyright © 2018 All rights reserved. Doublezl 版权所有</div>
</body>
</html>