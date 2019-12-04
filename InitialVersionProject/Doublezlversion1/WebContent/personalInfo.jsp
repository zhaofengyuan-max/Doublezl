<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
//     String path = request.getContextPath();
//     String basePath = request.getScheme() + "://"
//             + request.getServerName() + ":" + request.getServerPort()
//             + path + "/";
  --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <base href="<%=basePath%>"></base> --%>
<title>学生--个人信息</title>
</head>
<body>

<%@include  file="teachertemplate.jsp"%>
<div style="margin-top:-570px; ">
 
 <div class="main-panel" style=" margin-top:-70px">
   <nav class="navbar navbar-default" >
            <div class="container-fluid" >
				<div class="navbar-minimize">
					<button id="minimizeSidebar" class="btn btn-warning btn-fill btn-round btn-icon">
						<i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i>
						<i class="fa fa-navicon visible-on-sidebar-mini"></i>
					</button>
				</div>
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
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
                                <h4 class="title">个人信息</h4>
                            </div>
                            <div class="content">
                             
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>学工号</label>
                                                <input class="form-control" disabled  name="teaNo" type="text" id="teano" value="${teacher.teaNo}">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>姓名</label>
                                                <input  class="form-control" disabled name="teaName" type="text" id="teaname" value="${teacher.teaName}">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label >密码</label>
                                                <input class="form-control" disabled name="teaPass" type="text" id="teapass" value="${teacher.teaPass}" >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>出生年月</label>
                                                <input class="form-control" disabled  name="birthdate" type="text" id="birthdate" value="${teacher.birthdate}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>邮箱</label>
                                                <input class="form-control" disabled  name="email" type="text" id="email" value="${teacher.email}">
                                            </div>
                                        </div>
                                       
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>学院</label>
                                                <input class="form-control" disabled  name="acaNo" type="text" id="acaNo" value="${teacher.acaNo}" >
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>性别</label>
                                                <input class="form-control" disabled name="gender" type="text" id="gender" value="${teacher.gender}">
                                            </div>
                                        </div>
                                        
                                       
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>籍贯</label>
                                                <input type="text" class="form-control" disabled  value="山东">
                                            </div>
                                        </div>
                                    </div>
                             </div>
                          </div>
                        </div>
                    </div>
                </div>
             </div>
             
             <div class="col-md-4" style="float:right; margin-top:-440px; " >
                        <div class="card card-user">
                            <div class="image">
                                <img src="images/" alt="...">
                            </div>
                            <div class="content">
                                <div class="author">
                                     <a href="#">
                                    <img class="avatar border-gray" src="images/${teacher.gender}">
                                      <h4 class="title">个人照片
                                      </h4>
                                    </a>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>
             
    </div>
 
    
</div>


</body>
</html>