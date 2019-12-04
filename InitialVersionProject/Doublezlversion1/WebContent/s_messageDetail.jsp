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
        <title>我要留言</title>
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
                   <div class="contentDiv">
                    <div class=" container">  
                    <h3 class="text-danger text-center"  style="margin-bottom: 5px">留言详情</h3>
                     <form action="/czjf_system/MessageServlet?method=XXX" name="formAdd" method="post">
				     <table class="table table-striped table-hover dataTable">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="/czjf_system/img/wbg.gif" class='title'><span>&nbsp;</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          信息内容：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        ${message.content}
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          发布时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        ${message.leaveWordTime}
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          回复内容：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        ${message.replay}
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         回复时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        ${message.replayTime}
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td  bgcolor="#FFFFFF" align="right" colspan="2" style="text-align: center">
								<a href="s_messagesshow">返回</a>					        
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
    <script language="javascript">
   function check(){
	   //获取学生录入的问题
	   var content=$("#content").val();
	   //做JS校验
	   var ct=$.trim(content);
	   if(null==ct||""==ct){
		   alert("请录入合法的问题");
		   return;
	   }
	   //利用JS的方式提交表单
	   document.getElementById("fm").submit();
   }
</script>
 <script>
    function logout(){
    	if(confirm("确定要退出吗?")){
    		location.href="${pageContext.request.contextPath}/student/logout";
    	}
    }
</script>
</html>