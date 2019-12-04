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
        <title>留言展示</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/teacher.css" rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
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
             <h3 class="text-danger text-center"  style="margin-bottom: 15px">留言展示</h3>
             <table class="table table-striped table-hover dataTable">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="/czjf_system/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="20%">信息内容</td>
					<td width="8%">发布时间</td>
					<td width="8%">回复信息</td>
					<td width="8%">回复时间</td>
					<td width="8%">操作</td>
		        </tr>	
			<c:forEach items="${page.list}" var="msg"  varStatus="status"> 
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${status.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${msg.content}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${msg.leaveWordTime }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${msg.replay}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${msg.replayTime}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <%--
						<input type="button" value="删除" onclick="messageDel('${msg.messageId}')"/>
						--%>
						<a href="${pageContext.request.contextPath}/messagetReplay.jsp?id=${msg.messageId}" target="I2">回复</a>
					</td>
				</tr>
			  </c:forEach>
			</table>
			<div style="text-align:center">
    		共${page.totalPageNum}页/第${page.currentPageNum}页
    		<a href="${pageContext.request.contextPath}/message/findMessageWithPageByTeacher?num=1">首页</a>
    		<a href="${pageContext.request.contextPath}/message/findMessageWithPageByTeacher?num=${page.prevPageNum}">上一页</a>
    	
    	
    		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="pagenum">
    			<a href="${pageContext.request.contextPath}/message/findMessageWithPageByTeacher?num=${pagenum}">${pagenum}</a>
    		</c:forEach>
    		
    		<a href="${pageContext.request.contextPath}/message/findMessageWithPageByTeacher?num=${page.nextPageNum}">下一页</a>
    		<a href="${pageContext.request.contextPath}/message/findMessageWithPageByTeacher?num=${page.totalPageNum}">末页</a>
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
    				window.location.href="${pageContext.request.contextPath}/message/findMessageWithPageByTeacher?num="+pagenum;
    			}
    		</script>
    	</div>
    	<div class="text-center">
    	      <form action="${pageContext.request.contextPath}/message/findMessageWithPageByTeacher?num=1"  method="post">
                 <input type="submit" value="留言展示" class="btn btn-small btn-danger">
              </form>
    	</div>
              
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