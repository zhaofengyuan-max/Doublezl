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
        <title>我的资料</title>
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
                        <h3 class="text-danger text-center"  style="margin-bottom: 15px">最新教学视频</h3>
                        <hr/>
                        <div class="text-center">
                            <form action="${pageContext.request.contextPath}/vedio/findAllVedio"  method="post">
                              <input type="submit" value="显示所有视频" class="btn btn-small btn-danger">
                           </form>
                        </div>
                      <c:forEach items="${vedioList}"  var="v">
		                    <div class="c1-bline" style="padding:7px 0px;">
				                    <div class="f-left">
				                          <img src="images/arr3.gif"
				                               align="middle"  
				                               class="img-vm" border="0"/> 
				                               <!-- href="${pageContext.request.contextPath}/VedioServlet?method=playVedioById&id=${v.vedioId}"-----注释到这-->
				                          <a href="${pageContext.request.contextPath}/vedio/findVedioById?vedioId=${v.vedioId}" class="pn-loperator" style="color:red">
				                             ${v.vedioName}
				                          </a>
				                     </div>
				                   <div class="f-right">${v.uploadTime}</div>
				                  <div class="clear"></div>
			                </div>
		              </c:forEach>
		              
                    </div>                  
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