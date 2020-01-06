<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
    body{
    background-image:url(images/login_4.jpg);
    filter:alpha(Opacity=80);
    -moz-opacity:0.8;
    opacity: 0.8;
    }
.container{
       margin:50px auto;
        display: grid;
		width:1000px;
         height:500px;
        grid: repeat(13, 1fr)/repeat(7, 1fr);
        grid-auto-flow: row;
        /*border:1px solid #000;*/
        font-size: 14px;
       
    }
    .item{
    border:1px solid #000;
    }
    .btn_t{
      font-style: normal;
      color: #FF0000;
      text-decoration:underline;
      cursor: pointer;
    }
    .hid{
    display:none;
    }
</style>
</head>
<body>
<div class="container">
<div class="item">课程号</div>
<div class="item">课程序号</div>
<div class="item">课程名</div>
<div class="item">年度</div>
<div class="item">学期</div>
<div class="item">课程类型</div>
<div class="item">编辑</div>
<c:forEach items="${requestScope.stuSeledCourseList}" var="c">
<div class="hid" >${c.id.stuNo}</div>
<div class="item item_id">${c.id.courseNo}</div>
<div class="item item_no">${c.id.couOrder}</div>
<div class="item item_name">${c.courseName}</div>
<div class="item item_year">${c.id.years}</div>
<div class="item item_term">${c.id.term}</div>
<div class="item item_courseType">${c.courseType}</div>
<div class="item"><i class="btn_t" >退课</i></div>
</c:forEach>

<script>
var list_t=document.getElementsByClassName("btn_t"),
    list_hid=document.getElementsByClassName("hid"),
    list_id=document.getElementsByClassName("item_id"),
    list_no=document.getElementsByClassName("item_no"),
    list_name=document.getElementsByClassName("item_name"),
    list_year=document.getElementsByClassName("item_year"),
    list_term=document.getElementsByClassName("item_term"),
    list_courseType=document.getElementsByClassName("item_courseType");
for(var i=0;i<list_t.length;i++){
    list_t[i]._index=i;     
    list_t[i].onclick=function(){
        dele(this._index);      
    }  
 }
 function dele(i){
     //console.log(list_hid[i].innerHTML);
     //console.log(list_no[i].innerHTML);
     var xhr = null;
     if(window.XMLHttpRequest){
         xhr = new XMLHttpRequest();
     }else{
         xhr = new ActiveXObject('Microsoft.XMLHttp'); 
     }
     xhr.open('GET','demo10?stuNo='+list_hid[i].innerHTML+"&courseNo="+list_id[i].innerHTML+"&couOrder="+list_no[i].innerHTML+"&year="+list_year[i].innerHTML+"&term="+list_term[i].innerHTML,true);
	
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
    	 alert("退课成功！");
    	 //console.log("选课成功！");
     }else{
    	  //console.log("选课人数已达上限，选课失败");
    	 alert("退课失败！你以错过退课时间！");
     }
 }
</script>
</div>
</body>
</html>