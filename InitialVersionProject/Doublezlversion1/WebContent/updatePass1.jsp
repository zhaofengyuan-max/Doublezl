<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">


	var ids = "pwd,repwd,teaPass";
	var msg = "请输入原密码,请输入新密码,请确认密码";

	//非空验证
	function checkNull(ids, msg) {
		var idArray = ids.split(",");
		var msgArray = msg.split(",");
		for ( var i = 0; i < idArray.length; i++) {
			var id = $("#" + idArray[i]).val();
			//如果为空，给出错误提示
			if (id == "") {
				$("#" + idArray[i] + "Error").html(msgArray[i]);
				return false;
			}
		}
		return true;
	}
	
<%-- 	<% User user=(User) session.getAttribute("user"); %> --%>
	//验证输入的原密码是否和数据库里面的一致
	function checkPwd() {
		var teaPass1=${teacher.teaPass};//原密码
		//alert(teaPass1);
		var pwd = $("#pwd").val();//输入的原密码
		// alert(pwd); 
		if (teaPass1 == pwd) {
			return true;
		} else {
			//alert("输入的原密码错误，请重新输入！")
			$("#pwdError").html("输入的原密码错误，请重新输入！");
			return false;
		}

	} 

    //验证两次修改的密码是否一致
	function inputPwd() {
		var repwd = $("#repwd").val();
		var teaPass = $("#teaPass").val();
		if (repwd == teaPass) {
			return true;
		} else {
			//alert("两次输入的密码不一致");
			$("#repwdError").html("两次输入的密码不一致");
			return false;
		}
	}

    //确认修改
	function changePwd() {
    	//alert(checkNull(ids,msg));
    	//alert(inputPwd());
    	if (checkNull(ids,msg) && checkPwd() && inputPwd()) {
			//alert(1);
			$("#changePwdForm").submit();
		} 
	}
    
	
	 //页面加载完成触发的事件
	$(document).ready(function(){
		//设置获取焦点触发的事件：错误提示消失
		$("#pwd").focus(function(){
			$("#pwd").val("");
			$("#pwdError").html("");
		});
		$("#repwd").focus(function(){
			$("#repwd").val("");
			$("#repwdError").html("");
		});
		$("#teaPass").focus(function(){
			$("#teaPass").val("");
			$("#repwdError").html("");
		});
		
		//失去焦点触发的事件：判断内容是否为空，若为空给出错误提示
		$("#pwd").blur(function(){
			var p=$("#pwd").val();
			if(p==""){
				$("#pwdError").html("原密码不能为空");
			}
		});
		$("#repwd").blur(function(){
			var re=$("#repwd").val();
			if(re==""){
				$("#repwdError").html("新密码不能为空");
			}
		});
		$("#teaPass").blur(function(){
			var res=$("#teaPass").val();
			if(res==""){
				$("#repwdError").html("确认密码不能为空");
			}
		});
	});

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
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8">
							<div class="card">
								<div class="header">
									<h4 class="title">修改密码</h4>
								</div>
								<form action="${pageContext.request.contextPath}/teacher/updatePass" method="post" id="changePwdForm">
									<div class="content">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>请输入原密码</label> 
													<input type="text" name="teaPass1" class="form-control" id="pwd">
<%-- 													<input type="password" name="teaPass1"  style="width: 250px;" disabled="disabled" value="${teacher.teaPass}"/>  --%>
													<span id="pwdError" style="color: red"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>请输入新密码</label> 
													<input type="password" name="repwd" class="form-control" id="repwd"> <span
														id="repwdError" style="color: red"></span>
													<input type="password" id="teaPass" name="teaPass" style="width: 250px;"/>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>请输入确认密码</label>
													 <input type="password"  name="teaPass" class="form-control" id="teaPass"> <span
														id="repwdError" style="color: red"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<input type="button" onclick="changePwd();"
														class="form-control" value="保存">
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>