<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务系统--老师</title>
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
            <c:if test="${not empty teacher}">     
			   <br/>
				欢迎您：${teacher.teaName} &nbsp;&nbsp;
				<a href="javascript:void(0)" onclick="logout()">安全退出</a> 
				<br/><br/><br/>
	 		</c:if>
        </div>
  	<div class="sidebar-wrapper">
              <div class="user">
<div id="allmap"></div>
<div class="location" onclick="clickLoaction(this)">获取地理位置</div>
                <div class="info">
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
                            <li><a href="updatePass.jsp">修改密码</a></li>
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
                            <li><a href="manageCourses.jsp">教学课程</a></li>
                            <li><a href="vedioAdd.jsp">查看视频</a></li>
                            <li><a href="vedioDetailAdd.jsp">上传视频</a></li>
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
                            <li><a href="manageGrade.jsp">查看成绩</a></li>
                            <li><a href="inputGrade.jsp">录入成绩</a></li>
                        </ul>
                    </div>
                </li>
<!--                 <li class="active"> -->
<!--                     <a data-toggle="collapse" href="#tablesExamples"> -->
<!--                         <i class="pe-7s-news-paper"></i> -->
<!--                         <p>师生交流 -->
<!--                            <b class="caret"></b> -->
<!--                         </p> -->
<!--                     </a> -->
<!--                     <div class="collapse" id="tablesExamples"> -->
<!--                         <ul class="nav"> -->
<!--                             <li><a href="messagetShow.jsp">查看留言</a></li> -->
<!--                             <li><a href="messagetReplay.jsp">回复留言</a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </li> -->
                
                <li class="active">
                    <a data-toggle="collapse" href="#mapsExamples">
                        <i class="pe-7s-map-marker"></i>
                        <p>师生交流
                           <b class="caret"></b>
                        </p>
                    </a>
                    <div class="collapse" id="mapsExamples">
                        <ul class="nav">
                            <li><a href="messagetShow.jsp">查看留言</a></li> 
                            <li><a href="messagetReplay.jsp">回复留言</a></li>
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
	
	<script src="http://api.map.baidu.com/api?v=2.0&ak=PnkgkjYr5fVyKhQfjyTpv6kkc1YOvHBH"></script>
<script>
var local="kkk";
console.log(local);
var map = new BMap.Map("allmap");//创建Map实例，注意页面中一定要有个id为allmp的div
var point = new BMap.Point(116.331398,39.897445);//创建定坐标
map.centerAndZoom(point,12);// 初始化地图,设置中心点坐标和地图级别

var geolocation = new BMap.Geolocation();//获取经纬度
geolocation.getCurrentPosition(function(r){
    if(this.getStatus() == BMAP_STATUS_SUCCESS){
        var mk = new BMap.Marker(r.point);
        map.addOverlay(mk); 
        map.panTo(r.point);
        
        console.log('您的位置：'+r.point.lng+','+r.point.lat);
        console.log(this)
        
        var gc = new BMap.Geocoder();//地址解析
        var pointAdd = new BMap.Point(r.point.lng, r.point.lat);
        gc.getLocation(pointAdd, function(rs){
        	local=rs
        	
           console.log(rs)
        })
    }
    else {
        alert('获取地理位置失败'+this.getStatus());
    }        
}); 

function clickLoaction(obj){
	console.log(local)
	obj.innerHTML=local.address
}

</script>
	    <script>
    function logout(){
    	if(confirm("确定要退出吗?")){
    		location.href="${pageContext.request.contextPath}/teacher/logout";
    	}
    }
</script> 


</html>