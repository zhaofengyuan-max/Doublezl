<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>添加留言</title>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css" />
	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  </head>
  
  <body>
 
	<div style="width:784px; margin:0 auto;border:3px solid #C3AD7C;">
	  
	  
	   <div style="width:100%;height:147px;background-image: url('');border:0px solid #C3AD7C"></div>
	  
	  
	   <div style="width:100%; height:200px;border:0px solid green;margin-top:100px">
		
		<form action="${pageContext.request.contextPath}/MessageServlet?method=addMessage" name="formAdd" method="post" id="fm">
				     <table align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="/czjf_system/img/wbg.gif" class='title'><span>信息交流</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          信息内容：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="content" name="content" size="80"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="button" value="提交" onclick="check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
		</div>
	</div>

  </body>
<script language="javascript">
   function check(){
	   var content=$("#content").val();
	   var ct=$.trim(content);
	   if(null==ct||""==ct){
		   alert("请录入合法的问题");
		   return;
	   }
	   document.getElementById("fm").submit();
   }
   
   function logout(){
   	if(confirm("确定要退出吗?")){
   		location.href="${pageContext.request.contextPath}/teacher/logout";
   	}
   }
</script>
</html>