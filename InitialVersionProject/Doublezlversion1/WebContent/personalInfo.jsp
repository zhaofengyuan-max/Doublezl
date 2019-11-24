<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%> 
<html>
    <head>
        <title>教师个人信息</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <base href="<%=basePath%>"></base>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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
            <div class="centerDiv">
                    <div class=" container">
                        <h3 class="text-danger text-center"  style="margin-bottom: 5px">个人信息</h3>
                        <hr/>
                        <form action="${pageContext.request.contextPath}/teacher/updateInfo"  method="post">
			                <table class="table table-striped table-hover dataTable">
			                    <tr>
			                        <td><label for="teano">账号：</label></td>
			                        <td><input name="teaNo" type="text" id="teano" value="${teacher.teaNo}" readonly="readonly"></td>
			                    </tr>
			                    <tr>
			                        <td><label for="teaname">姓名：</label></td>
			                        <td><input name="teaName" type="text" id="teaname" value="${teacher.teaName}"  readonly="readonly"></td>
			                    </tr>
			                    <tr>
			                        <td><label for="teapass">密码：</label></td>
			                        <td><input name="teaPass" type="text" id="teapass" value="${teacher.teaPass}"></td>
			                    </tr>
			                    <tr>
			                        <td><label for="gender">性别：</label></td>
			                        <td><input name="gender" type="text" id="gender" value="${teacher.gender}" readonly="readonly"></td>
			                    </tr>
			                    <tr>
			                        <td><label for="birthdate">出生年月：</label></td>
			                        <td><input name="birthdate" type="text" id="birthdate" value="${teacher.birthdate}"  readonly="readonly"></td>
			                    </tr>
			                    <tr>
			                        <td><label for="email">邮箱：</label></td>
			                        <td><input name="email" type="text" id="email" value="${teacher.email}"></td>
			                    </tr>  
			                    <tr>
			                        <td><label for="acano">所属学院：</label></td>
			                        <td><input name="acaNo" type="text" id="acaNo" value="${teacher.acaNo}"  readonly="readonly"></td>
			                    </tr>
			                    <tr class="foot">
                                    <td colspan="2">
                                      <!--<input type="hidden" name="teaNo" value="${teacher.teaNo}"/>
                                      <input type="hidden" name="teaName" value="${teacher.teaName}"/>
                                      <input type="hidden" name="gender" value="${teacher.gender}"/>
                                      <input type="hidden" name="birthdate" value="${teacher.birthdate}"/> 
                                      <input type="hidden" name="acaNo" value="${teacher.acaNo}"/> -->
                                      <input type="submit" value="修改">
                                    </td>
                                </tr>
			                </table>
			               </form>
                                 
                    <br/>
                    <br/>
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