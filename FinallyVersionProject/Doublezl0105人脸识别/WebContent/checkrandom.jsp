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
<title>前台登录</title>
  <base href="<%=basePath%>"></base>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <link href="css/demo.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/685fd913f1e14aebad0cc9d3713ee469.css" rel="stylesheet" type="text/css">
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">

	var ids="checkRandom,qq";
	var msg="请输入邮箱验证码";
	var r = '<%= session.getAttribute("random")%>';
		//非空验证
		function  checkNull(ids,msg){
			  var idArray=ids.split(",");
			   var msgArray=msg.split(",");
			   for(var i=0;i<idArray.length;i++){
				  var id= $("#"+idArray[i]).val();
				  //如果为空，给出错误提示
				  if(id==""){
					  $("#"+idArray[i]+"Error").html(msgArray[i]);
					  return false;
				  }
			   }
			   return true;
		 }
		
		//登录
		function checkfun(){
			   if(checkNull(ids,msg)){
				   
				   $("#checkForm").submit();
			   }
		}
			$(function(){
				//设置获取焦点触发的事件：错误提示消失
				$("#checkRandom").focus(function(){   
					$("#checkRandom").val("");
					$("#checkRandom").val(r);
					$("#checkRandomError").html("");
				});
				
				$("#checkRandom").blur(function(){
					var p=$("#checkRandom").val();
					if(p==""){
						$("#checkRandomError").html("邮箱验证码不能为空");
					}
				});
				
				//失去焦点触发的事件：判断内容是否为空，若为空给出错误提示
				$("#checkRandom").blur(function(){
					var u=$("#checkRandom").val();
					if(u!=r){
						$("#checkRandomError").html("验证码有误,请重新输入");
					}
				});
				
			});
</script>
</head>
<body>
<div class="wrapper wrapper-full-page">
    <div class="full-page login-page" data-color="orange" data-image="images/full-screen-image-1.jpg">   
        
    <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
        <div class="content">
            <div class="container">
                <div class="row">                   
                    <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
						 <form action="${pageContext.request.contextPath}/teacher/checkRandom"  method="post"  id="checkForm">
                            <div class="card ">
                                <div class="header text-center">邮箱验证</div>
                                <center>
                                  <span id="msgError"  style="color:red">${msg}</span>
                                  </center>
                                <div class="content">
                                    <div class="form-group">
                                        <label>验证码</label><span id="checkRandomError" style="color:red"></span>
                                        <input type="text" name="checkRandom" id="checkRandom" placeholder="邮箱验证码" class="form-control">
                                    </div>
                                 
                                </div>
                                <div class="footer text-center">
                                    <button type="button" value="验证" onclick="checkfun()" class="btn btn-fill btn-warning btn-wd">验证</button>
                                </div>
                            </div>
                        </form>
                    </div>                    
                </div>
            </div>
        </div>
    </div>                                   
</div>
</body>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script> 
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>