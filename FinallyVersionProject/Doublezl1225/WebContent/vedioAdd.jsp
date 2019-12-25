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
<!--                     <div class=" container"> -->
                        <table class="table table-striped table-hover dataTable">
						<tr align="center" bgcolor="#FAFAF1" height="22">
							<td width="4%">序号</td>
							<td width="25%">标题</td>
							<td width="10%">附件</td>
							<td width="10%">操作</td>
				        </tr>
					 <c:forEach items="${page.list}" var="v"  varStatus="status">
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
							<td bgcolor="#FFFFFF" align="center">
								${status.index+1}
							</td>
							<td bgcolor="#FFFFFF" align="center">
								${v.vedioName}
							</td>
							<td bgcolor="#FFFFFF" align="center">
								${v.vedioAttachment}
								&nbsp;&nbsp;&nbsp;
								<a href="#" onclick="down1('${v.vedioAttachment}','${v.attachmentOldName}')" style="font-size: 10px;color: red">down</a>
							</td>
							<td bgcolor="#FFFFFF" align="center">
							    <%--取消链接的默认行为 --%>
								<a href="javascript:void(0)" onclick="delVedio(${v.vedioId})"  class="pn-loperator">删除</a>
								
							</td>
						</tr>
					  </c:forEach>
			   </table>
		  <div style="text-align:center">
    		共${page.totalPageNum}页/第${page.currentPageNum}页
    		<a href="${pageContext.request.contextPath}/vedio/findVediosWithPageByTeacher?num=1">首页</a>
    		<a href="${pageContext.request.contextPath}/vedio/findVediosWithPageByTeacher?num=${page.prevPageNum}">上一页</a>
    		<!-- 遍历页码 -->
    		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="pagenum">
    			<a href="${pageContext.request.contextPath}/vedio/findVediosWithPageByTeacher?num=${pagenum}">${pagenum}</a>
    		</c:forEach> 
	    		<a href="${pageContext.request.contextPath}/vedio/findVediosWithPageByTeacher?num=${page.nextPageNum}">下一页</a>
    		<a href="${pageContext.request.contextPath}/vedio/findVediosWithPageByTeacher?num=${page.totalPageNum}">末页</a>
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
    				window.location.href="${pageContext.request.contextPath}/vedio/findVediosWithPageByTeacher?num="+pagenum;
    			}
    		</script>
    	    </div>
    	    <div class="text-center">
                           <form action="${pageContext.request.contextPath}/vedio/findVediosWithPageByTeacher?num=1"  method="post">
                              <input type="submit" value="显示分页视频" class="btn btn-small btn-danger">
                           </form>
<%--                            <form action="${pageContext.request.contextPath}/vedioDetailAdd.jsp"  method="post"> --%>
<!--                               <input type="submit" value="上传视频" class="btn btn-small btn-danger"> -->
<!--                            </form> -->
            </div>
<!--                     </div> -->
                 </div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
function delVedio(vId){
	//做删除视频之前的确认提示
	if(confirm("确认删除当前的视频吗?")){
		//向服务端发起请求，将当前正在删除的视频的编号发送到服务端
		location.href="${pageContext.request.contextPath}/vedio/deleteVedioByTeacher?id="+vId;
	}
}

function logout(){
	if(confirm("确定要退出吗?")){
		location.href="${pageContext.request.contextPath}/teacher/logout";
	}
}
</script>
</html>