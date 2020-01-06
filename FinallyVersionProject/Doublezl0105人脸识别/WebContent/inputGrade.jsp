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
<script type="text/javascript">
$(function(){
	$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/teacher/selectAllCourses",
			datatype:"json",
			success:function(coList){
				if(coList.length==0){
					alert("本学期没有您的课程，不需要录入成绩");
				}else{
					var str="<select id='coid' onchange='findSclass()' name='grList[0].coName'>";
					   str+="<option value='undefined' >"+"请选择课程"+"</option>"; 
					for(var i=0;i<coList.length;i++){
						str+="<option value="+"C001"+">"+"16Java(04)班"+"</option>";
					}
					str+="</selsect>";
					$("#content").html(str);
				}
				
			},
			error:function(){
				alert("失败");
			}
			
		});
	});


function findSclass(){
	var min = $("#coid>option:selected").val();
	
	$(function(){
		$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/teacher/selectAllSclass?coid="+min,
				async:false,
				success:function(scList){
					
					var str="<select id='clid' onchange='findStudents()'>";
					    
					   str+="<option value='undefined' >"+"请选择班级"+"</option>";
					for(var i=0;i<scList.length;i++){
						str+="<option value="+scList[i].clId+">"+scList[i].clName+"</option>";
					}
					str+="</selsect>";
					$("#contentSclass").html(str);
				},
				error:function(){
					alert("失败");
				}
				
			});
		});
}

function findStudents(){
	var man = $("#clid>option:selected").val();
	
	$(function(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/teacherAction_selectAllStudents?clid="+man,
			async:false,
			success:function(students){
				var str1 = "";
				/* var str2 = ""; */
				for(var i=0;i<students.length;i++){
					 
					var str="<tr>";
					str+="<td>"+students[i].stNum+"</span></td>";
					str+="<td>"+students[i].stName+"</td>";
					str+="<td><input type='text' id='scores"+i+"' name='grList["+i+"].score'></td>";
					str+="</tr>";
					str+="<input type='hidden' name='grList["+i+"].stNum' value='"+students[i].stNum+"'>";
					$("#t").after(str);
					str1 += students[i].stNum+",";
				}
			/* 	document.getElementById("stNum").value=str1; *///给隐藏的学号文本域赋值
			},
			error:function(){
				alert("失败");
			}
			
		});
	});
}





function save(){
	$("#gradeForm").submit();
	/* var coid =  $("#coid>option:selected").val();
	var stnum = $("#stNum").val();
	
	var st=stnum.split(",");
		for(var i =0;i<st.length-1;i++){
			 var num = st[i];
			 var score=$("#scores"+i).val();
			$(function(){
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/teacherAction_saveGrades?grade.coName="+coid+"&grade.stNum="+num+"&grade.score="+score,
					async:false,
					success:function(msg){
						if(msg=="该班级已经录入成绩,请选择其它班级"){  */
							 /* alert(msg);  */
							/*  $("#msg").val(msg);  */
						   /*  history.go(0); */
						 /* setTimeout(function(){$("#msg").val(msg)}, 3000); */
							 
								/*   if(confirm("确认删除吗?")){
									  location.href="${pageContext.request.contextPath}/pages/teacherInputGrades.jsp";
								  } */
							

							/*  return false;

						}
						
             
					},
					error:function(){  
						alert("失败");
		
					}
					
				});
			});
		}
		 */
		/* window.location.href="${pageContext.request.contextPath}/teacherAction_pageGrades";  */

	
}

</script>
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
                     
                     <div class="content">
					<div class="toolbar">
						<!--        Here you can write extra buttons/actions for the toolbar              -->
					</div>
					<div class="fresh-datatables">
					    <label> 课程：<span id="content"></span></label>
					    <label> 班级：<span id="contentSclass"></span></label>
						<br>
						<span style="color: red">${m}</span>
						
						<table id="datatables"
							class="table table-striped table-no-bordered table-hover"
							cellspacing="0" width="100%" style="width: 100%">
							<thead>
								<tr id="t">
									<th>学号</th>
									<th>姓名</th>
									<th>成绩</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>学号</th>
									<th>姓名</th>
									<th>成绩</th>
								</tr>
							</tfoot>
						</table>
						
					            <input type="button" value="保存" onclick="save();" style="border-style: none; color: blue; border-radius: 20px; height: 35px; width: 50px;">
					           

					</div>
				</div>
                     
                     
                     
                 </div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function logout(){
	if(confirm("确定要退出吗?")){  
		location.href="${pageContext.request.contextPath}/teacher/logout";
	}
}
</script>
</html>