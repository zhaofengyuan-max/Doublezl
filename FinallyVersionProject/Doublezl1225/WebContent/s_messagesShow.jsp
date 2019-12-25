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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <base href="<%=basePath%>"></base>
        <title>我的留言</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/teacher.css" rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
			.c1-bline{border-bottom:#999 1px dashed;border-top:1px;}
			.f-right{float:right}
			.f-left{float:left}
			.clear{clear:both}
       </style>
       <script type="text/javascript">

        function messageDetail(id)
        {
             var strUrl = "${pageContext.request.contextPath}/message/findMessageById?id="+id;
             //var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
             var ret = window.open(strUrl,"_self","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
        }
    </script>  
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
             <h3 class="text-danger text-center"  style="margin-bottom: 15px">师生交流</h3>
             <div class="text-center">
	            <form action="${pageContext.request.contextPath}/message/findMessagesWithPage?stuNo=${student.stuNo}&num=1"  method="post">
	                <input type="submit" value="我的留言" class="btn btn-small btn-danger">
	            </form>
            </div>
             <c:forEach items="${page.list}" var="message" varStatus="sta">
                       <div class="c1-bline" style="padding:7px 0px;">
                        <div class="f-left">
                             <img src="images/arr3.gif"
				                               align="middle"    
				                               class="img-vm" border="0"/>
                             <a href="javascript:void(0)"  onclick="messageDetail(${message.messageId})">${message.content}</a>
                        </div>
                        <div class="f-right" style="color:red">${message.leaveWordTime}</div>
                        <div class="clear"></div>
                       </div>
            </c:forEach>   
            <div class="text-center">
                 <form action="${pageContext.request.contextPath}/s_messageDetailsAdd.jsp"  method="post">
                      <input type="submit" value="我要留言" style="border:0px; background-color:transparent;" >
                 </form>
                <!-- <a class="text-center" href="${pageContext.request.contextPath}/s_messageDetailsAdd.jsp" style="color: black">发布留言</a> -->
			</div>
			<div style="text-align:center">
    		共${page.totalPageNum}页/第${page.currentPageNum}页
    		<a href="${pageContext.request.contextPath}/message/findMessagesWithPage?stuNo=${student.stuNo}&num=1">首页</a>
    		<a href="${pageContext.request.contextPath}/message/findMessagesWithPage?stuNo=${student.stuNo}&num=${page.prevPageNum}">上一页</a>
    	
    	
    		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="pagenum">
    			<a href="${pageContext.request.contextPath}/message/findMessagesWithPage?stuNo=${student.stuNo}&num=${pagenum}">${pagenum}</a>
    		</c:forEach>
    		
    		<a href="${pageContext.request.contextPath}/message/findMessagesWithPage?stuNo=${student.stuNo}&num=${page.nextPageNum}">下一页</a>
    		<a href="${pageContext.request.contextPath}/message/findMessagesWithPage?stuNo=${student.stuNo}&num=${page.totalPageNum}">末页</a>
    		<input type="text" id="pagenum" name="pagenum" size="1"/>
    		<input type="button" value="前往" onclick="jump()" />
    		<script type="text/javascript">
    			function jump(){
    				var totalpage = ${page.totalPageNum};
    				var pagenum = document.getElementById("pagenum").value;
    				var reg =/^[1-9][0-9]{0,1}$/;
    				if(!reg.test(pagenum)){
    					alert("请输入符合规定的数字");
    					return ;
    				}
    				if(parseInt(pagenum)>parseInt(totalpage)){
    					alert("不能大于总页数");
    					return;
    				}
    				window.location.href="${pageContext.request.contextPath}/message/findMessagesWithPage?stuNo=${student.stuNo}&num="+pagenum;
    			}
    		</script>
    	  </div>
    	  
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