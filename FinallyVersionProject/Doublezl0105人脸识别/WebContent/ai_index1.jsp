<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人脸登录</title>
  
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <link href="css/demo.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/685fd913f1e14aebad0cc9d3713ee469.css" rel="stylesheet" type="text/css">
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<style>
canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js"></script>
<script src="js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  //测试提交，对接程序删除即可
  $(".submit_btn").click(function(){
	  localhost.href="index.jsp";
	  });
});
</script>

</head>
<body>
<nav class="navbar navbar-transparent navbar-absolute">
    <div class="container">    
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse">       
     
        </div>
    </div>
</nav>


<div class="wrapper wrapper-full-page">
    <div class="full-page login-page" data-color="orange" data-image="images/full-screen-image-1.jpg">   
        
    <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
        <div class="content">
            <div class="container">
                <div class="row">                   
                    <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                       <form action="${pageContext.request.contextPath}/facelogin.action" method="get">
		<dl class="admin_login">    
			<dt>
				 <strong>请把你的脸放摄像头面前</strong>
			</dt>
			<div id="media">
				<video id="video" width="530" height="300" autoplay></video>
				<canvas id="canvas" width="400" height="300"></canvas>
			</div>
			<dd>
				<input type="button" onclick="query()" value="立即登录"
					class="submit_btn" />
			</dd>

		</dl>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">
  		//var 是定义变量
  		var video = document.getElementById("video"); //获取video标签
  		var context = canvas.getContext("2d");
  		var con  ={
  			audio:false,
  			video:{
  			width:1980,
  			height:1024,
  			}
  		};	
  			
  			//导航 获取用户媒体对象
  			navigator.mediaDevices.getUserMedia(con)
  			.then(function(stream){
  				video.src = window.URL.createObjectURL(stream);
  				video.onloadmetadate = function(e){
  					video.play();
  				}
  			});
  			
  	
  			function query(){
  				
  				//把流媒体数据画到convas画布上去
  				context.drawImage(video,0,0,400,300);
  				var base = getBase64();
  				
  				
  				$.ajax({
  					type:"post",
  					url:"${pageContext.request.contextPath}/facelogin.action",
  					data:{"base":base},
  					success:function(data){
  						
  						/* alert(data) */
							var result = eval(data);

							if(result){
								

								// location.replace("/www.baidu.com");
								 //location.href='text.jsp';//此处跳转页面
								 
								 alert("登录成功")
								 //location.href="/localhost:8180/ssh-five/putong.jsp";
								 
								} else {
									alert("面容识别失败,请继续验证");
								}
								;
							}
						});

			}
			function getBase64() {
				var imgSrc = document.getElementById("canvas").toDataURL(
						"image/png");
				alert(imgSrc);
				return imgSrc.split("base64,")[1];   

			};
		</script>
	</form>
                    </div>                    
                </div>
            </div>
        </div>
    </div>                             
       
</div>
</body>
   <!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script> 
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>