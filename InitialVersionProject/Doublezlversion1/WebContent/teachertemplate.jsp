<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务系统--学生</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <link href="css/demo.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href='css/685fd913f1e14aebad0cc9d3713ee469.css' rel='stylesheet' type='text/css'>
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
</head>
<body>
<div class="wrapper" >
    <div class="sidebar" data-color="orange" data-image="student/assets/img/full-screen-image-3.jpg">
       
        <div class="logo">
<!--             <a href="#" class="logo-text"> -->
<!--                                        操作栏 -->
                                       
<!--             </a> -->
            欢迎您
            <c:if test="${not empty teacher}">     
			   <br/>
				欢迎您：${teacher.teaName} &nbsp;&nbsp;
				<a href="javascript:void(0)" onclick="logout()">安全退出</a> 
				<br/><br/><br/>
	 		</c:if>
        </div>
  	<div class="sidebar-wrapper">
              <div class="user">
                <div class="photo">
                    <img src="images/0.jpg" style="width:78px;height:73px"/>
                </div>
                <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                                                           Doublezl
                    </a>
                    
                </div>
            </div>

            <ul class="nav">
                <li class="active">
                    <a data-toggle="collapse" href="#componentsExamples">
                        <i class="pe-7s-plugin"></i>
                        <p>个人信息
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="componentsExamples">
                        <ul class="nav">
                            <li><a href="personalInfo.jsp">基本信息</a></li>
                            <li><a href="pages/changeStudentPwd.jsp">修改密码</a></li>
                        </ul>
                    </div>
                </li>
                <li class="active">
                    <a data-toggle="collapse" href="#formsExamples">
                        <i class="pe-7s-note2"></i>
                        <p>课程
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="formsExamples">
                        <ul class="nav">
                            <li><a href="studentAction_findNowCourse">教学课程</a></li>
                        </ul>
                    </div>
                </li>

                <li class="active">
                    <a data-toggle="collapse" href="#tablesExamples">
                        <i class="pe-7s-news-paper"></i>
                        <p>成绩
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="tablesExamples">
                        <ul class="nav">
                            <li><a href="studentAction_findMyExcourse">上传成绩</a></li>
                        </ul>
                    </div>
                </li>

                <li class="active">
                    <a data-toggle="collapse" href="#mapsExamples">
                        <i class="pe-7s-map-marker"></i>
                        <p>教学资料
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="mapsExamples">
                        <ul class="nav">
                            <li><a href="studentAction_findMyGrade?type=1">视频管理</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
    	</div>
    </div>
</div>
</body>
    <!--  菜单 -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script> 
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	    <script>
    function logout(){
    	if(confirm("确定要退出吗?")){
    		location.href="${pageContext.request.contextPath}/teacher/logout";
    	}
    }
</script> 


</html>