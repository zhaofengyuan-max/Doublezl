<%@page import="com.niit.entity.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<base href="<%=basePath%>"></base>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/teacher.css" rel="stylesheet" type="text/css" />
<link href="css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

</head>
<body>
<%@include  file="teachertemplate.jsp"%>
	<div style="margin-top: -570px;">

		<div class="main-panel">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-minimize">
					<button id="minimizeSidebar"
						class="btn btn-warning btn-fill btn-round btn-icon">
						<i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i> <i
							class="fa fa-navicon visible-on-sidebar-mini"></i>
					</button>
				</div>
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">教务系统</a>
				</div>
			</div>
			</nav>

			<div class="content">
				<div class="contentDiv">
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
		</div>
	</div>
</body>
</html>