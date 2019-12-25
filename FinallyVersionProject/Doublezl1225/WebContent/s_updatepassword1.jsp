<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<base href="<%=basePath%>"></base>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/tshowInfo.css" rel="stylesheet" type="text/css" />
<link href="css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript"></script>

</head>
<body>
	<!--<div class="container">-->
	<div class="topDiv" style="background: url(images/1002.jpg)">
		<div id="navigation"></div>
		 <div class="welcome">
                <c:if test="${not empty student}">     
				    <br/>
				             欢迎您：${student.stuName} &nbsp;&nbsp;
				    <a href="javascript:void(0)" onclick="logout()">安全退出</a> 
				    <br/><br/><br/>
 				</c:if>
            </div>
	</div>
	<div class="middleDiv">
		<div class="leftDiv" style="background: url(images/1001.jpg)">
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
			<div class="container">
				<h3 style="color: red; text-align: center">修改密码</h3>
				<hr />
				<form id="fm" style="background-color: #cccccc"
					action="${pageContext.request.contextPath}/student/updatepassword"
					method="post">
					<table
						class="table table-striped table-bordered table-hover table-condensed dataTable"
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
	
	<div class="bottomDiv">Copyright © 2018 All rights
				reserved.Doublezl 版权所有</div>

</body>

</html>

