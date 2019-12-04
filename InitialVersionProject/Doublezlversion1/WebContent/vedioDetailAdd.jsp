<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>上传视频</title>
        <base href="<%=basePath%>"></base>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <style type="text/css">
			.c1-bline{border-bottom:#999 1px dashed;border-top:1px;}
			.f-right{float:right}
			.f-left{float:left}
			.clear{clear:both}
       </style>
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
                   <div class="contentDiv">
                    <div class=" container">  
                    <h3 class="text-danger text-center"  style="margin-bottom: 5px">添加视频</h3>
                     <form action="${pageContext.request.contextPath}/vedio/saveVedio" name="formAdd" method="post" enctype="multipart/form-data"> 
                       <table class="table table-striped table-hover dataTable"  width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="/czjf_system/img/wbg.gif" class='title'><span>&nbsp;</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         视频标题：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="vedioName" name="vedioName" style="width: 360px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        附件上传：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="file" name="attachmentOldName" id="attachmentOldName" style="width: 360px;"/>
						        
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       视频介绍：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
	                             <textarea name="vedioPro" id="vedioPro" rows="" cols="" style="width: 360px;"></textarea>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						    </td>
						</tr>
					 </table>
					</form>
                    </div>                  
                    <br/>
                  <br/>
                </div>
            </div>
        </div>
        <div class="bottomDiv">Copyright © 2018 All rights reserved. Doublezl 版权所有</div>
    </body> 
    <script>
function check(){
	var name=$("#vedioName").val();		
	var pro=$("#vedioPro").val();
	var nm=$.trim(name);
	var pr=$.trim(pro);
	
	if(null==nm||""==nm){
		alert("标题不能为空");
		return false; //如果return false 会对表单进行提交
	}
	
	if(null==pr||""==pr){
		alert("介绍不能为空");
		return false; //如果return false 会对表单进行提交
	}
	return true;
}
function logout(){
	//用户确认提示
	if(confirm("确定要退出吗?")){
		location.href="${pageContext.request.contextPath}/teacher/logout";
	}
}
</script>

 
</html>