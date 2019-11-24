<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" 
  "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
     <title>Doublezl教务管理系统</title> 
     <meta http-equiv="pragma" content="no-cache">
	 <meta http-equiv="cache-control" content="no-cache">
	 <meta http-equiv="expires" content="0">    
	 <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	 <meta http-equiv="description" content="This is my page">
	 
     <link href="css/style_index.css" rel="stylesheet" type="text/css" />
     <link href="css/logincss.css" rel="stylesheet" type="text/css" />
     <script  type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
     <script type="text/javascript" src="js/jquery.superslide.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
     <script  language="javascript" >
          window.onerror = function(){return true;};
          function cutSummary(summaryStr,lengTh){
            if(summaryStr.length>lengTh){  
                 summaryStr=summaryStr.substring(0,lengTh)+"...";
            }
            document.write(summaryStr);  
          }
         $(document).ready(function() {
                $("a.nivo-nextNav").click();
         });
    </script>
    
     <script language="javascript">
		function check1()
		{                                                                                         
		     if(document.ThisForm.teaname.value=="")
			 {
			 	alert("请输入用户名");
				document.ThisForm.teaname.focus();
				return false;
			 }
			 if(document.ThisForm.teapass.value=="")
			 {
			 	alert("请输入密码");  
				document.ThisForm.teapass.focus();
				return false;
			 }
			 document.ThisForm.submit(); 
		}
    </script> 
</head>
    <body>
        <div id="index_all">
            <div class="header" style=" background:url(images/1002.jpg);"> 
               <div class="logo"><a href="#"><img src="images/png-24.png" width="386" height="79" alt="" class="png" /></a></div>
               <div class="search">
                   <!--action="http://yz.tsinghua.edu.cn/easyDig/Default.jsp"-->
                   <form id="searchForm"  method="post" target="_blank" name="form1">
                    <input type="hidden" id="searchVpath" name="vpath" value="http://yz.tsinghua.edu.cn/publish/yjszs/" />
<!--                     <input name="Q" type="text" class="text" value="站内搜索" onFocus="if (this.value==='站内搜索'){this.value=''}" onBlur="if (this.value===''){this.value='站内搜索'};"/> -->
                    <input type="submit" value="" class="sub" />
                  </form>   
               </div>    
               <div class="nav-bar">
                    <ul>
                        <li><a href="index.xhtml" class="first current" >首页</a></li>
                            <li><a href="jigoushezhi.xhtml" class="one">机构设置</a></li>
                            <li><a href="compus.xhtml" class="two">学校概况</a></li>
                            <li><a href="a_adminlogin.jsp" class="three">网站管理</a></li>
                            <li><a href="laws.xhtml" class="five">政策法规</a></li>
                            <li><a href="publicinfo.xhtml" class="six">信息公开</a></li>
                            <li><a href="contactus.xhtml" class="last">联系我们</a></li> 
                    </ul>       
              </div>
               <!--<ui:include src="menu.xhtml"/>-->
        </div>
            
        <div class="content">
            <div class="lb_pic">
                 <div id="slidebox" class="slidebox">
                <a class="prev"><img src="images/bg_btnpre_index.png"/></a>
                <a class="next"><img src="images/bg_btnnext_index.png"/></a>
                <div class="hd">
                    <ul><li></li><li></li></ul>
                </div>
                <div class="bd">
                    <ul>
                         <li>
                            <div style="position:absolute; margin-top:453px;"> 
                                <div class="detail-box" style=" background:url(images/png-24.png) no-repeat; behavior: url('/publish/yjszs/images/iepngfix.htc');" >                                      
                                    <h3><a href="http://cet.etest.net.cn/" target="_blank">Doubelzl_校园风光</a></h3>
                                    <p><a href="http://cet.etest.net.cn/" target="_blank"><script>cutSummary('',100);</script></a></p>
                                    <a href="http://cet.etest.net.cn/" target="_blank" class="btn">详细&nbsp;&gt;</a>
                                </div>
                            </div>
                            <a href="http://cet.etest.net.cn/"><img src="images/2018002.jpg"/></a>
                        </li>
                        <li>
                            <div style="position:absolute; margin-top:453px;"> 
                                <div class="detail-box" style=" background:url(images/png-24.png) no-repeat; behavior: url('/publish/yjszs/images/iepngfix.htc');" >                                      
                                    <h3><a href="http://cet.etest.net.cn/" target="_blank">Doubelzl_校园风光</a></h3>
                                    <p><a href="http://cet.etest.net.cn/" target="_blank"><script>cutSummary('',100);</script></a></p>
                                    <a href="http://cet.etest.net.cn/" target="_blank" class="btn">详细&nbsp;&gt;</a>
                                </div>
                            </div>
                            <a href="http://cet.etest.net.cn/"><img src="images/2018002.jpg"/></a>
                        </li>
                        <li>
                            <div style="position:absolute; margin-top:453px;"> 
                                <div class="detail-box" style=" background:url(images/png-24.png) no-repeat; behavior: url('/publish/yjszs/images/iepngfix.htc');" >                                      
                                    <h3><a href="http://cet.etest.net.cn/" target="_blank">Doubelzl_校园风光</a></h3>
                                    <p><a href="http://cet.etest.net.cn/" target="_blank"><script>cutSummary('',100)</script></a></p>
                                    <a href="http://cet.etest.net.cn/" target="_blank" class="btn">详细&nbsp;&gt;</a>
                                </div>
                            </div>
                            <a href="http://cet.etest.net.cn/"><img src="images/2018002.jpg"/></a>
                        </li>
                         <li>
                            <div style="position:absolute; margin-top:453px;"> 
                                <div class="detail-box" style=" background:url(images/png-24.png) no-repeat; behavior: url('/publish/yjszs/images/iepngfix.htc');" >                                      
                                    <h3><a href="http://cet.etest.net.cn/" target="_blank">Doubelzl_校园风光</a></h3>
                                    <p><a href="http://cet.etest.net.cn/" target="_blank"><script>cutSummary('',100)</script></a></p>
                                    <a href="http://cet.etest.net.cn/" target="_blank" class="btn">详细&nbsp;&gt;</a>
                                </div>
                            </div>
                            <a href="http://cet.etest.net.cn/"><img src="images/2018002.jpg"/></a> 
                        </li>
                     </ul> 
                </div>
            </div>
            <script type="text/javascript">jQuery(".slidebox").slide( { mainCell:".bd ul",effect:"leftLoop",autoPlay:true} );</script>        
        </div>
        <div class="login">
            <div class="login_windows">
            <h3>用户登录</h3> 
            <div class="user_div" >
            <form id="fm" action="${pageContext.request.contextPath}/teacher/login" name="ThisForm" method="post">
				      <table border="0" cellSpacing="0" cellPadding="0" width="100%">
				          <tr>
					          <td style="HEIGHT:18px"><span id="msg" style="color:red;font-size:15px">${msg}</span></td>
				          </tr>
				          <tr>
					          <td style="HEIGHT: 30px;padding-left:25px">
					              <span style="font-family: 微软雅黑;font-size: 18px;">账号：</span>
					              <input type="text" name="teaNo" style="width: 110px;padding:2px;">
					          </td>
				          </tr>
				          <tr>
					          <td style="HEIGHT: 30px;padding-left:25px">
					              <span style="font-family: 微软雅黑;font-size: 18px;">密码：</span>
					              <input type="password" name="teaPass" style="width:110px;padding:2px;">
					          </td>
				          </tr>
				          <tr>
					          <td style="HEIGHT: 50px;padding-left:120px">
					              <input type="submit" value="登录"  style="cursor:pointer;width:40px;height:20px;color:red"> 
					              <!-- <input type="button" value="登陆"  onclick="check1()"> -->
					          </td>
				          </tr>   
					  </table>
					 </form>
            </div>

        </div>
            <div class="new_notice">
                <h3>最新通知</h3>
                <div class="news_text">
                    <ul>
                         <li><a href="http://cet.etest.net.cn/">关于四六级考试通知</a></li> 
                         <li><a href="http://cet.etest.net.cn/">关于期末考试通知</a></li>
                        <li style="border-bottom:none;float:right;"><a href="index.xhtml">更多&gt;&gt;</a></li>
                    </ul>
                </div> 
            </div>
            
            <div class="link">
                <script>
                        function link(obj){
                        if(obj.options[obj.selectedIndex].value==='')
                        return;
                        window.open(obj.options[obj.selectedIndex].value);//;
                        }
                </script>
                <select name="select"  id="select"  onchange='link(this);'>
                    <option value="" selected="selected">友情链接</option>
                    <option value="http://www.qdu.edu.cn" target="_blank">青岛大学</option>
                    <option value="http://www.moe.edu.cn" target="_blank">教育部</option>
                    <option value="http://yz.chsi.com.cn" target="_blank">全国研招网</option>
                 </select>
            </div>
        </div>
        </div>
        <div class="footer">
            <div class="address">地址：青岛市市南区  Doublezl教务处  邮编：266000<br /> 电话：17860767139     Email：1595882726@mail.doublezl.edu.cn</div>
            <div class="copyright"> Copyright © 2019 All rights reserved. Doublezl 版权所有</div>
        </div>  
     </div>
    </body>
</html>


