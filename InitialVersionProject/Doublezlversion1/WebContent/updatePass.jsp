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
                    <form  id="fm" action="${pageContext.request.contextPath}/teacher/updatePass"  name="formPw" method="post"> 
                            <table class="table table-striped table-hover dataTable" style="margin-bottom:8px">
								<tr bgcolor="#FFFFFF">
								    <td width="10%" bgcolor="#FFFFFF" align="right">
								         登录名：
								    </td>
								    <td width="90%" bgcolor="#FFFFFF">
								        <input type="text" value="${teacher.teaNo}" name="teaNo" style="width: 250px;" disabled="disabled"/>
								    </td>
								</tr>
								<br/>
								<tr bgcolor="#FFFFFF">
								    <td width="10%" bgcolor="#FFFFFF" align="right">
								        原密码：
								    </td>
								    <td width="90%" bgcolor="#FFFFFF">
								        <input type="password" name="teaPass1"  style="width: 250px;" disabled="disabled" value="${teacher.teaPass}"/>
								    </td>
								</tr>
								<br/>
								<tr bgcolor="#FFFFFF">
								    <td width="10%" bgcolor="#FFFFFF" align="right">
								         新密码：
								    </td>
								    <td width="90%" bgcolor="#FFFFFF">
								        <input type="password" id="teaPass" name="teaPass" style="width: 250px;"/>
								    </td>
								</tr>
								<tr bgcolor="#FFFFFF">
								    <td width="10%" bgcolor="#FFFFFF" align="right">
								        &nbsp;
								    </td>
							        <td width="90%" bgcolor="#FFFFFF">
							             <input type="button" value="修改" onclick="check()"/>
							             &nbsp;&nbsp;&nbsp;
							        </td>
								</tr>

			                </table>
                        </form> 
              
                 </div>
				</div>
			</div>
		</div>
	</div>
</body>
<script language="javascript">
            function check()
            {
                 if(document.formPw.teaPass.value =="")
                 {
                     alert("新密码不能空");
                     return ;
                 }
                 document.getElementById("fm").submit();
            }
</script>
<script type="text/javascript">
function logout(){
	if(confirm("确定要退出吗?")){
		location.href="${pageContext.request.contextPath}/teacher/logout";
	}
}
</script>
</html>