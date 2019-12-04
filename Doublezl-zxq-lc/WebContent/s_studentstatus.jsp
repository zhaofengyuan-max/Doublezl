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
        <title>学籍信息</title>
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
        <style type="text/css">
           .btnn{
               border:0px;
               background-color:transparent;
               color:#fff
               
           }
        </style>
    </head>
    <body>
        <div class="topDiv" style=" background:url(images/1002.jpg) ">
            <div id="navigation">
	            <div class="welcome">
	                <c:if test="${not empty student}">     
					    <br/>
					             欢迎您：${student.stuName} &nbsp;&nbsp;
					    <a href="javascript:void(0)" onclick="logout()">安全退出</a> 
					    <br/><br/><br/>
	 				</c:if>
            </div>
            </div>
        </div>
        <div class="middleDiv" >
            <div class="leftDiv" style=" background:url(images/1001.jpg)">
               <div>
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
            </div>
            <div class="centerDiv">
                    <div class=" container">
                        <h3 class="text-danger text-center"
				style="color: red; text-align: center">学籍信息</h3>
			<hr />
                        <form
								action="${pageContext.request.contextPath}/student/studentstatus"
								style="background-color: #cccccc">
								<table class="table table-striped dataTable">
									<tr>
										<th width="12%" align="left">学号</th>
										<td>${student.stuNo}</td>
										<th width="12%" align="left">曾用名</th>
										<td><input type="hidden" name="oldRealName" value=" " />&nbsp;</td>
										<td width="5%"  rowspan="8" ><img src="images/${student.stuNo}.jpg"
											width="120" height="150" name="showimg" id="showimg" /></td>
									</tr>
									<tr>
										<th width="12%" align="left">姓名</th>
										<td>${student.stuName}</td>
										<th width="12%" align="left">姓名拼音</th>
										<td><input type="hidden" name="realNamePinYin" value="" />&nbsp;</td>
									</tr>
									<tr>
										<th width="12%" align="left">英文名</th>
										<td><input type="hidden" name="enname" value="" />&nbsp;</td>
										<th width="12%" align="left">性别</th>
										<td>${student.stuGender}</td>
									</tr>
									<tr>
										<th width="12%" align="left">出生日期</th>
										<td><input type="hidden" name="birthday" value=" " /></td>
										<th width="12%" align="left">出生地</th>
										<td><input type="hidden" name="birthplace" value="" />&nbsp;</td>
									</tr>
									<tr>
										<th width="12%" align="left">国籍</th>
										<td><input type="hidden" name="nationalityId"
											value="2014" />中国<em class="error"></em></td>
										<th width="12%" align="left">籍贯</th>
										<td>${student.addr}&nbsp;</td>
									</tr>
									<tr>
										<th width="12%" align="left">证件类型</th>
										<td><input type="hidden" name="cardtypeId" value="27" />身份证</td>
										<th width="12%" align="left">证件号码</th>
										<td><input type="hidden" name="idno" value=" " />37060266666666666</td>
									</tr>
									<tr>
										<th width="12%" align="left">民族</th>
										<td><input type="hidden" name="folkid" value="1972" />汉族</td>
										<th width="12%" align="left">政治面貌</th>
										<td>${student.politicalStatus}"</td>
									</tr>

									<tr>
										<th width="12%" align="left">是否本市户籍</th>
										<td><input type="hidden" name="portId" value="" />&nbsp;</td>

										<th>&nbsp;</th>
										<td>&nbsp;</td>
									</tr>

									<tr>
										<th width="12%" align="left">婚姻状况</th>
										<td><input type="hidden" name="marrageStatusId" value="0" /></td>
										<th width="12%" align="left">文化程度</th>
										<td colspan="2"><input type="hidden" name="literacyId"
											value="0" />未知</td>
									</tr>
									<tr>
										<th width="12%" align="left">外语语种</th>
										<td><input type="hidden" name="foreignLanguageId"
											value="2147" />英语</td>
										<th width="12%" align="left">外语水平</th>
										<td colspan="2"><input type="hidden"
											name="languageLevelId" value="" />&nbsp;</td>
									</tr>
									<tr>
										<th width="12%" align="left">健康状况</th>
										<td><input type="hidden" name="health" value="" />&nbsp;</td>
										<th width="12%" align="left">学生来源</th>
										<td colspan="2"><input type="hidden" name="stusourceId"
											value="0" />未知</td>
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
    		location.href="${pageContext.request.contextPath}/student/logout";
    	}
    }
</script>
</html>