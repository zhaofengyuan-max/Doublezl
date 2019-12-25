<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form id="fm" action="${pageContext.request.contextPath}/student/login" name="ThisForm" method="post">
				      <table border="0" cellSpacing="0" cellPadding="0" width="100%">
				          <tr>
					          <td style="HEIGHT:18px"><span id="msg" style="color:red;font-size:15px">${msg}</span></td>
				          </tr>
				          <tr>
					          <td style="HEIGHT: 30px">
					              <span style="font-family: 微软雅黑;font-size: 18px;">账号：</span>
					              <input type="text" name="stuNo" style="width: 110px;">
					          </td>
				          </tr>
				          <tr>
					          <td style="HEIGHT: 30px">
					              <span style="font-family: 微软雅黑;font-size: 18px;">密码：</span>
					              <input type="password" name="stuPwd" style="width:110px;">
					          </td>
				          </tr>
				          <tr>
					          <td style="height: 50px">
					              <input type="submit" value="登录"> 
					              <a href="s_forgetPass.jsp">忘记密码</a>
					          </td>
				          </tr>   
					  </table>
					 </form>

</body>
</html>