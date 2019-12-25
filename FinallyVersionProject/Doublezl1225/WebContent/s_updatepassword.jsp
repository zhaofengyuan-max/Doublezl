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
<title>成绩管理</title>
<base href="<%=basePath%>"></base>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/teacher.css" rel="stylesheet" type="text/css" />
<link href="css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

</head>
<body>
<%@include  file="studenttemplate.jsp"%>
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
				<form id="fm" style="background-color: #cccccc"
					action="${pageContext.request.contextPath}/student/updatepassword"
					method="post">
					<table
						class="table  table-bordered table-hover table-condensed dataTable"
						style="margin-bottom: 8px">
						<tr>
							<td width="10%" align="right">原密码</td>
							<td width="90%"><input type="password" placeholder="请输入原密码"
								name="apPass" value="${student.stuPwd}" /></td>
						</tr>

						<tr>
							<td width="10%" align="right">新密码</td>
							<td width="90%"><input type="password" placeholder="请输入新密码"
								name="stuPwd" /></td>
						</tr>

						<tr>
							<td width="10%" align="right">确认新密码</td>
							<td width="90%"><input type="password"
								placeholder="请再次输入新密码" name="newPass2" /></td>
						</tr>
					</table>

					<div>
						<button class="btn btn-sm btn-primary" style="text-align: right"
							onclick="check()">确认修改</button>
					</div>  
				</form>
			</div>
			<br /> <br />
				<div class="explain_tab">
				<div id="explain_title">说明：</div>
				<div id="explain_content">密码不能包含大于符号、小于符号、引号、中文、全角字符，前后也不能有空格！密码必须大于等于6个字符，并且包含字母和数字！</div>

			</div>
                  </div>
				</div>
			</div>
		</div>
	</div>
</body>
   <script>
    function logout(){
    	if(confirm("确定要退出吗?")){
    		location.href="${pageContext.request.contextPath}/student/logout";
    	}
    }
</script>
</html>