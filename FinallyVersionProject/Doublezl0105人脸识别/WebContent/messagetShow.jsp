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
<title>查看视频资料</title>
<base href="<%=basePath%>"></base>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/teacher.css" rel="stylesheet" type="text/css" />
<link href="css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

</head>
<body>
<%@include  file="teachertemplate.jsp"%>
	<div style="margin-top: -570px;">

		<div class="main-panel">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-minimize">
					<button id="minimizeSidebar"
						class="btn btn-warning btn-fill btn-round btn-icon">
						<i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i> <i
							class="fa fa-navicon visible-on-sidebar-mini"></i>
					</button>
				</div>
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">教务系统</a>
				</div>
			</div>
			</nav>

			<div class="content">
				<div class="contentDiv">
                   <table class="table table-striped table-hover dataTable">
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
		</div>
	</div>
</body>
</html>