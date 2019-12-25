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


			<div class="content">
				<div class="contentDiv">
                     <form
								action="${pageContext.request.contextPath}/student/studentstatus"
								style="background-color: #cccccc">
								<table class="table table-striped dataTable">
									<tr>
										<th width="12%" align="left">学号</th>
										<td>${student.stuNo}</td>
										<th width="12%" align="left">曾用名</th>
										<td><input type="hidden" name="oldRealName" value=" " />&nbsp;</td>
<%-- 										<td width="5%"  rowspan="8" ><img src="images/${student.stuNo}.jpg" --%>
<!-- 											width="120" height="150" name="showimg" id="showimg" /></td> -->
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