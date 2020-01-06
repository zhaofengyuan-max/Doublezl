<%@ page language="java" contentType="text/html; charset=UTF-8"   
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>网站管理员登录</title>
    
         
    <style>
    body{
    background-image:url(images/login_4.jpg);
    filter:alpha(Opacity=80);
    -moz-opacity:0.8;
    opacity: 0.8;
    }
        *{
            padding:0;
            margin:0;
          }
           .wrapper{
            width:400px;
            background: -webkit-linear-gradient(left,#afdfe4,red);
            background: -o-linear-gradient(right,#afdfe4,red); /* Opera 11.1 - 12.0 */
  			background: -moz-linear-gradient(right,#afdfe4,red); /* Firefox 3.6 - 15 */
  			background: linear-gradient(to right,#afdfe4,red); /* 标准的语法 */
            position:fixed;
            top:50%;
            left:50%;
            transform:translateX(-50%) translateY(-50%);
            -ms-transform:translateX(-50%) translateY(-50%);
            -moz-transform:translateX(-50%) translateY(-50%);
            -webkit-transform:translateX(-50%) translateY(-50%);
            -o-transform:translateX(-50%) translateY(-50%);
          }


          .item{
              width: 300px;
              margin-left: 40px;
              padding: 10px 10px;
         
          }
          .user{
               margin-top: 40px;
          }
          .upwd{
              margin-top: 30px;
          }
          .btn{
              color: #fff;
              font-size: 20px;
              background-color: #008792;
              border: 0;
              width: 150px;
              height: 40px;
              margin: 30px 125px;
              cursor: pointer;
              border-radius: 10px;
          }
          h2{
          color:red;
          
          }
           </style>
       </style>
</head>
<body>
        
        
        <div class="wrapper">
           <form action="admin/login">
             <input class="item user" type="text" placeholder="管理员用户名"  name="user">
             <input class=" item upwd" type="password" placeholder="密码" name="upwd">
             <input class="btn" type="submit" value="登录">
           </form>      
        </div>
        <h2>${stalogin}</h2>
        
        <script type="text/javascript">
           
       
        </script>

</body>
</html>