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
        <title>教学视频</title>
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
                        <h3 class="text-danger text-center"  style="margin-bottom: 15px">查看视频</h3>
                       <!--  <hr/> -->
                        <table class="table table-striped table-hover dataTable">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="7" background="/czjf_system/img/tbg.gif">&nbsp;</td>
						</tr>
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
                           <form action="${pageContext.request.contextPath}/vedioDetailAdd.jsp"  method="post">
                              <input type="submit" value="上传视频" class="btn btn-small btn-danger">
                           </form>
            </div>
                    </div>                  
                    <br/>
                  <br/>
                </div>  
            </div>
        </div>
        <div class="bottomDiv">Copyright © 2018 All rights reserved. Doublezl 版权所有</div>
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
	//用户确认提示
	if(confirm("确定要退出吗?")){
		location.href="${pageContext.request.contextPath}/teacher/logout";
	}
}
</script>

</html>