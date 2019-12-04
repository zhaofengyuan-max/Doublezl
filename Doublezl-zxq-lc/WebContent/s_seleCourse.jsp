<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>选课</title>
<style>
    body{
    background-image:url(images/login_4.jpg);
    filter:alpha(Opacity=80);
    -moz-opacity:0.8;
    opacity: 0.8;
    }
 #seled{
         /* display: inline-block; */
         width: 100px;
         height: 30px;
         text-align: center;
         line-height: 30px;
         background-color: #7FFFD4;
         color:#000;
         /* color:#fff; */
         /* margin: 0 auto; */
         border-radius: 5px;
         cursor: pointer;
    }
 
    .container{
    margin-top:20px;
        display: grid;
		width:2000px;
         height:3000px;
        grid: repeat(98, 1fr)/repeat(17, 1fr);
        grid-auto-flow: row;
        border:1px solid #000;
        font-size: 14px;
        /*margin-top: 10px;*/
    }
    .item{
    border:1px solid #000;
    }
    .btn_a{
      font-style: normal;
      color: #FF0000;
      text-decoration:underline;
      cursor: pointer;
    }
 </style> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

</head>
<body>
<form action="demo09">
<input id="seled" type="submit" value="已选课程">
<input type="hidden" name="stuNo" value="${student.stuNo}">
<!-- <div id="seled">已选课程</div> -->
</form>

<div class="container">
<div class="item item_head">开课学院</div>
<div class="item item_head">课程号</div>
<div class="item item_head">课序号</div>
<div class="item item_head">课程名</div>
<div class="item item_head">课程学分</div>
<div class="item item_head">课容量</div>
<div class="item item_head">主讲教师号</div>
<div class="item item_head">主讲教师姓名</div>
<div class="item item_head">主讲教师职称</div>
<div class="item item_head">合讲教师</div>
<div class="item item_head">周次分布</div>
<div class="item item_head">周学时</div>
<div class="item item_head">星期</div>
<div class="item item_head">节次</div>
<div class="item item_head">教室类型</div>
<div class="item item_head">教室</div>
<div class="item item_head">备注</div>
<c:forEach items="${requestScope.seleList}" var="s">
	<div class="item">${s.acaName }</div>
       <div class="item item_id">${s.id.courseNo}</div>
        <div class="item item_no">${s.id.couOrder}</div>
        <div class="item item_name">${s.courseName}</div>
        <div class="item">${s.courseCredit}</div>
        <div class="item">${s.couVolume}</div> 
        <div class="item">${s.teaNo}</div>
        <div class="item">${s.teaName}</div>
        <div class="item">${s.teaType}</div>
        <div class="item">${s.teaSecond}</div>
        <div class="item">${s.couPlan}</div>
       <div class="item">${s.weekPlan}</div>
       <div class="item">${s.week}</div>
       <div class="item">${s.time}</div>
       <div class="item">${s.roomType}</div>
		<div class="item">${s.roomName}</div>
		<div class="item"><i class="btn_a" >选课</i></div> 
</c:forEach>
</div>
<script>
var list_a=document.getElementsByClassName("btn_a"),
    list_id=document.getElementsByClassName("item_id"),
    list_no=document.getElementsByClassName("item_no"),
    list_name=document.getElementsByClassName("item_name"),
    seled=document.getElementById("seled");
for(var i=0;i<list_a.length;i++){
    list_a[i]._index=i;   
    list_a[i].onclick=function(){
        dele(this._index);      
    }  
 }
 function dele(i){
     console.log(list_id[i].innerHTML);
     console.log(list_no[i].innerHTML);
     var xhr = null;
     if(window.XMLHttpRequest){
         xhr = new XMLHttpRequest();
     }else{
         xhr = new ActiveXObject('Microsoft.XMLHttp');
     }
     xhr.open('GET','demo06?stuNo='+${student.stuNo}+'&courseNo='+list_id[i].innerHTML+'&couOrder='+list_no[i].innerHTML+'&courseName='+list_name[i].innerHTML,true);

     xhr.send();
     
     xhr.onreadystatechange=function(){ //监听各阶段的状态的变化
         if(xhr.readyState == 4){
             if(xhr.status == 200){
                 // var data = xhr.responseText;
                 showList(xhr.responseText);
             }
         }

     }
 }

 function showList(data){
     var value = JSON.parse(data);
     //console.log(value);
     if(value==1){
    	 alert("选课成功！");
    	 //console.log("选课成功！");
     }else{
    	  //console.log("选课人数已达上限，选课失败");
    	 alert("选课人数已达上限，选课失败");
     }
 }

 
</script>
</body>
</html>