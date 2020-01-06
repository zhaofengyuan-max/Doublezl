<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>修改密码</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                        <h3 class="text-danger text-center"  style="margin-bottom: 5px">修改密码</h3>
                        <hr/>
                        <form  id="fm" action="${pageContext.request.contextPath}/teacher/updatePass"  name="formPw" method="post"> 
                            <table class="table table-striped table-hover dataTable" style="margin-bottom:8px">
								<tr bgcolor="#EEF4EA">
								    <td colspan="2" background="/czjf_system/images/wbg.gif" class='title'><span>&nbsp;</span></td>
								</tr>
								<br/>
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
                                 
                    <br/>
                    <br/>
                </div>
            </div>
        </div>
        <div class="bottomDiv">Copyright © 2018 All rights reserved. Doublezl 版权所有</div>
    </body>
        <script>
	        function logout(){
	        	//用户确认提示
	        	if(confirm("确定要退出吗?")){
	        		location.href="${pageContext.request.contextPath}/teacher/logout";
	        	}
	        }
        </script>  
</html>