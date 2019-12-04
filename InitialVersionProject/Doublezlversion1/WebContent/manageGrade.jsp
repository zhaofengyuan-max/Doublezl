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
         <base href="<%=basePath%>"></base>
        <title>成绩管理</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/teacher.css" rel="stylesheet" type="text/css" />
        <link href="css/template.css" rel="stylesheet" type="text/css" />
    </head>
     <body>
         <div class="topDiv" style=" background:url(images/1002.jpg) ">
            <div id="navigation">
                <div class="welcome">
                <c:if test="${not empty teacher}">     
				    <br/>
				             欢迎您：${teacher.teaName} &nbsp;&nbsp;
				    <a href="javascript:void(0)" onclick="logout()">安全退出</a> 
				    <br/><br/><br/>
 				</c:if>
            </div>
           </div>
        </div>
        <div class="middleDiv" >
          <div class="leftDiv" style=" background:url(images/1001.jpg)">
            <div>
                  <ul class="navMenu">
                        <li><a href="personalInfo.jsp">个人信息</a></li>
                        <li><a href="updatePass.jsp">修改密码</a></li>
                        <li><a href="vedioAdd.jsp">教学资料</a></li>
                        <li><a href="manageCourses.jsp">教学课程</a></li> 
                        <li><a href="manageGrade.jsp">成绩管理</a></li> 
                        <li><a href="messagetShow.jsp">师生交流</a></li> 
                    </ul>  
          </div>
       </div>
       <div class="centerDiv">
          <div class="contentDiv">
          <div class="text-center">
              <form action="${pageContext.request.contextPath}/course/findScore" method="post">
					         <input type="hidden" name="teaNo" value="${teacher.teaNo}">
					            年份：<input text="text" name="years" >
					         <input type="submit" value="提交" class="btn btn-small btn-danger">
              </form>
           </div>
              <table class="table table-striped table-hover dataTable">
                            <tr>
	                            <th>学号</th>
	                            <th>姓名</th>
	                            <th>课程名称</th>
	                            <th>学期</th>
	                            <th>平时分</th>
	                            <th>考试分</th>
	                            <th>总分</th>
                            </tr>
                            <c:forEach items="${gradeList}"  var="g">
	                            <tr>
		                            <td>${g[0]}</td>
		                            <td>${g[1]}</td>
		                            <td>${g[2]}</td>
		                            <td>${g[3]}</td>
		                            <td>${g[4]}</td>
		                            <td>${g[5]}</td>
		                            <td>${g[6]}</td>  
	                            </tr>
						   </c:forEach>
                    </table>
                    <!--  <h:form>  
                        <!--columnClasses="col1,col2"
                        <h:panelGrid class="grid1"
                                     columns="4" 
                                     frame="hsides" 
                                     rowClasses="row1,row2"
                                   
                                     >
                        <h:panelGroup>
                            <h:outputText value="请选择学院"/>&nbsp;
                            <h:selectOneMenu >
                                <f:selectItem itemLabel="数据科学与软件工程学院" itemValue="数据科学与软件工程学院" />
                                <f:selectItem itemLabel="医学院" itemValue="医学院" />
                                <f:selectItem itemLabel="商学院" itemValue="商学院" />
                            </h:selectOneMenu>
                       </h:panelGroup>
                        <h:panelGroup>
                                <h:outputText value="请选择专业"/>&nbsp;
                            <h:selectOneMenu>
                                <f:selectItem itemLabel="软件工程" itemValue="软件工程" />
                                <f:selectItem itemLabel="aaa" itemValue="aaa" />
                                <f:selectItem itemLabel="bbb" itemValue="bbb" />
                            </h:selectOneMenu> 
                        </h:panelGroup>
                       <h:panelGroup>
                                <h:outputText  value="请选择学年"/>&nbsp;
                            <h:selectOneMenu >
                                <f:selectItem itemLabel="2018" itemValue="2018" />
                                <f:selectItem itemLabel="2019" itemValue="2019" />
                                <f:selectItem itemLabel="2020" itemValue="2020" />
                            </h:selectOneMenu> 
                        </h:panelGroup>
                        <h:panelGroup>
                                <h:outputText  value="请选择学期"/>&nbsp;
                            <h:selectOneMenu >
                                <f:selectItem itemLabel="春" itemValue="" />
                                <f:selectItem itemLabel="夏" itemValue="" />
                                <f:selectItem itemLabel="秋" itemValue="" />
                            </h:selectOneMenu> 
                        </h:panelGroup>
                            <h:panelGroup>
                                <h:outputText  value="请选择课程编号"/>&nbsp;
                            <h:selectOneMenu >
                                <f:selectItem itemLabel="00001" itemValue="" />
                                <f:selectItem itemLabel="00002" itemValue="" />
                                <f:selectItem itemLabel="00003" itemValue="" />
                            </h:selectOneMenu> 
                        </h:panelGroup>
                        <h:panelGroup>
                                <h:outputText  value="请选择班级"/>&nbsp;
                            <h:selectOneMenu >
                                <f:selectItem itemLabel="00001" itemValue="00001" />
                                <f:selectItem itemLabel="00002" itemValue="00002" />
                                <f:selectItem itemLabel="00003" itemValue="00003" />
                            </h:selectOneMenu> 
                        </h:panelGroup>
                            <h:outputText value=""/>
                            <h:outputText value=""/>
                        </h:panelGrid>
                    <div class="tsdiv">
                        <!--非本学期的成绩教师不可修改，教师仅可以录入本学期成绩,在按钮上限制
                     <f:ajax render="dataForm">
                        
                        <h:commandButton action="#batchBean.edit}" rendered="#!batchBean.show}"
                                         class="btn btn-sm btn-primary" value="查询" />
                    </f:ajax>
                    &nbsp;&nbsp;&nbsp;
                    <f:ajax render="dataForm">
                        
                        <h:commandButton action="#batchBean.edit}" rendered="#!batchBean.show}"
                                         class="btn btn-sm btn-primary" value="使用Excel上传成绩" />
                    </f:ajax>
                    &nbsp;&nbsp;&nbsp;
                    <f:ajax render="dataForm">
                        
                        <h:commandButton action="#batchBean.edit}" rendered="#!batchBean.show}"
                                         class="btn btn-sm btn-primary" value="导出成绩至Excel" />
                    </f:ajax>
                    &nbsp;&nbsp;&nbsp;
                    <f:ajax render="dataForm">
                        <h:commandButton action="#Bean.edit}" rendered="#!Bean.show}"
                                         class="btn btn-sm btn-primary" value="手动录入" />
                    </f:ajax>
                    &nbsp;
                    <!--点击保存按钮，需要重新提交整个表单的数据，更新数据库后，更改show的值，刷新表单内容，让该显示的显示
                        提交整个表单，修改后的学生信息自动存入列表的学生对象中。
                    
                    <f:ajax execute="dataForm" render="dataForm">
                        <h:commandButton action="#Bean.save}"  rendered="#Bean.show}"
                                         class="btn btn-sm btn-success" value="保存" />
                    </f:ajax>
                    </div>-->
                    
                        <!--  <h:dataTable 
                            class="table table-striped table-hover dataTable">
                            <h:column>
                                <f:facet name="header">
                                    <h5 >学生学号</h5>
                                </f:facet>
                                
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h5>学生姓名</h5>
                                </f:facet>

                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h5>班级名称</h5>
                                </f:facet>

                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h5>课程编号</h5>
                                </f:facet>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h5>课程名称</h5>
                                </f:facet>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h5>平时分</h5>
                                </f:facet>
                               <h:outputText value=""  rendered=""/>
                               <h:inputText  value=""  rendered="" />
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h5>考试分</h5>
                                </f:facet>
                               <h:outputText value=""  rendered=""/>
                               <h:inputText  value=""  rendered="" />
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h5>总分</h5>
                               <h:outputText value=""  rendered=""/>
                               <h:inputText  value=""  rendered="" />
                                </f:facet>
                            </h:column>
                        </h:dataTable>
                    </h:form> -->  
                </div>
              </div>
            </div>
      <div class="bottomDiv">Copyright © 2018 All rights reserved. Doublezl 版权所有</div>
</body>
<script>
    function logout(){
    	if(confirm("确定要退出吗?")){
    		location.href="${pageContext.request.contextPath}/teacher/logout";
    	}
    }
</script>
</html>