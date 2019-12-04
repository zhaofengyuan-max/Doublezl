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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理学生</title>
        <base href="<%=basePath%>"></base>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
        <link href="css/guanli.css" rel="stylesheet" type="text/css" />
        
        <style>
        .dele{
        color: #FF0000;
        text-decoration:underline;
        cursor: pointer;
        
        }
        </style>
    </head>
    <body>
        <div class="topDiv" style=" background:url(images/1002.jpg) ">
            
        </div>
        <div class="middleDiv" >
        <div class="leftDiv" style="background:url(images/1001.jpg)">
            <div>
	            <div>
                  <ul class="navMenu">     
	                <li><a href="a_guanlixueyuan.jsp">学院管理</a></li>
                        <li><a href="a_guanlizhuanye.jsp">专业管理</a></li>
                        <li><a href="a_guanlibanji.jsp">班级管理</a></li>
                        <li><a href="a_guanlixuesheng.jsp">学生管理</a></li> 
                        <li><a href="a_guanliTeacher.jsp">教师管理</a></li> 
                   </ul> 
               </div>
          </div>
       </div>
            <div class="centerDiv">  
                   <div class="contentDiv">
                    <h3 class="text-danger text-center"  style="margin-bottom: 15px">管理学生</h3>
                    <div class="text-center">
                           <form action="${pageContext.request.contextPath}/admin/adminStu"  method="post">
                                                            学院:<input type="text" name="acaName"   >	
				 		专业:<input type="text" name="majName"    >
				 		班级:<input type="text" name="batName"   >	
				 		学号:<input type="text" name="stuNo"    >
                             <input type="submit" value="查询" class="btn btn-small btn-danger">
                           </form>
                   </div>
                        <table class="table table-striped table-hover dataTable">
                                    <tr>
				 		 			<th>学号</th>
					            	<th>姓名</th>
					            	<th>性别</th>				            
					            	<th>班级</th>				            
					            	<th>专业</th>			           
					            	<th>学院</th>
					            	<th>政治面貌</th>
					            	<th>操作</th>
					            	</tr>
					            	<c:forEach items="${slist}"  var="s">
					            	<tr>
					            	<td class="stuNo">${s[0]} </td>
					            	<td>${s[1]}</td>
					            	<td>${s[2]}	</td>			            
					            	<td>${s[3]}	</td>		
					            	<td>${s[4]}	</td>			            
					            	<td>${s[5]}	</td>				            
					            	<td>${s[6]}	</td>		
					            	<td class="dele">删除</td>		           
					            	</tr>
					            	 </c:forEach>
                        </table>
                       
                </div>
            </div>
        </div>
        <div class="bottomDiv">Copyright © 2018 All rights reserved. Doublezl 版权所有</div>
    <script>
     var list_dele=document.getElementsByClassName("dele"),
          list_stuNo=document.getElementsByClassName("stuNo");
     for(var i=0;i<list_dele.length;i++){
    	    list_dele[i]._index=i;   
    	    list_dele[i].onclick=function(){
    	        dele(this._index);      
    	    }  
    	 }
     function dele(i){
         var xhr = null;
         if(window.XMLHttpRequest){
             xhr = new XMLHttpRequest();
         }else{
             xhr = new ActiveXObject('Microsoft.XMLHttp');
         }
         xhr.open('GET','admin/deleStu?stuNo='+list_stuNo[i].innerHTML,true);

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
        	 alert("删除学生成功！");
        	 //console.log("选课成功！");
         }else{
        	  //console.log("选课人数已达上限，选课失败");
        	 alert("删除学生失败！");
         }
     }

    </script>
    
    
    </body>
</html>