<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-6-1
  Time: 下午2:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0  user-scalable=no maximum-scale=1.0, user-scalable=no">
        <!--width 属性控制设备的宽度。假设您的网站将被带有不同屏幕分辨率的设备浏览，那么将它设置为 device-width 可以确保它能正确呈现在不同设备上。
        initial-scale=1.0 确保网页加载时，以 1:1 的比例呈现，不会有任何的缩放。
        在移动设备浏览器上，通过为 viewport meta 标签添加 user-scalable=no 可以禁用其缩放（zooming）功能。
        通常情况下，maximum-scale=1.0 与 user-scalable=no 一起使用。这样禁用缩放功能后，用户只能滚动屏幕，就能让您的网站看上去更像原生应用的感觉。
        注意，这种方式我们并不推荐所有网站使用，还是要看您自己的情况而定！-->
        <title>更改密码</title>
        <link rel="stylesheet" href="//apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
        <script src="//apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    </head>


    <style>
        .search-location{
            top: 4px;
            margin-left: 12px;
        }
        .main-nav-location{
            margin-left: 12px;
        }
        .login-well{
            padding: 19px;
            background-color: #ffffff;
            border: 1px solid darkseagreen;
        }
        body{
            padding-top: 80px;
        }
        .line{
            border-bottom:1px solid greenyellow;
        }

        .picture_hight{
            height: 300px;
        }

    </style>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top header line" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a href="http://www.baidu.com" class="navbar-left">
                <img src="https://cdn.94cb.com/static/img/apple-touch-icon-114x114-precomposed.png"
                     style="max-width:100px;margin-top:7px;" width="35" height="35" alt="logo">
            </a>
        </div>
        <!--<form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" style="width: 250px" placeholder="Searh">
            </div>
            <a href="#" style="color:black"><span class="glyphicon glyphicon-search"></span></a>
        </form>-->
        <div id="navbar-dropdown" class="navbar-collapse collapse navbar-exl-collapse">
            <ul id="main-nav" class="nav navbar-nav pull-left main-nav-location">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <b>热门</b>
                    </a>
                </li>
                <li><a href="/blockMain"><b>版块</b></a></li>
                <li><a href="#"><b>充值</b></a></li>
            </ul>
            <ul id="logged-out-menu" class="nav navbar-nav navbar-right pull-right">
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" style="width: 250px" placeholder="Searh">
                    </div>
                    <a href="http://www.baidu.com" style="color:black"><span class="glyphicon glyphicon-search search-location"></span></a>
                </form>
                <li><a href="/register">注册</a></li>
            </ul>
        </div>

    </div>
</nav>

<div class="container" id="content">
    <div class="row">
        <div class="col-md-offset-2 col-md-8">
            <ol class="breadcrumb">
                <li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
                    <a href="/" itemprop="url">
                        <span itemprop="title">主页</span>
                    </a>
                </li>
                <li class="active">修改密码</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-md-offset-2 col-md-6">
            <div class="login-block">
                <%--<%
                    request.setAttribute("msg","error"); //test error
                %>--%>
                    <div class="col-lg-offset-4 alert alert-danger">
                        <strong>温馨提示：本站对密码进行加密，所以无法找回密码</strong>
                    </div>
                    <c:if test="${Msg == 'error'}">
                        <div class="col-lg-offset-4 alert alert alert-danger">
                            <strong>输入密码错误,请重新输入</strong>
                        </div>
                    </c:if>
            </div>
           <%-- <%
                String msg=(String) request.getAttribute("Msg");
                out.print(msg);
            %>--%>
            <script>
                function isSame(){
                    var t1=document.getElementById("newPassword").value;
                    var t2=document.getElementById('newPasswordAgain').value;
                    var t1Length=t1.length;
                    console.log(t1);
                    console.log(t2);
                    if(t1Length>0&&t1==t2){
                        document.getElementById('checkPdError').style.display='none';
                    }else{
                        document.getElementById('checkPdError').style.display='block';
                    }
                }
                function noEmpty(){
                    /*alert("test");*/
                    var t1=document.getElementById('oldPassword').value.length;
                    var t2=document.getElementById('newPassword').value.length;
                    var t3=document.getElementById('newPasswordAgain').value.length;
                    console.log(t1);
                    console.log(t2);
                    if(t1>0&&t2>0&&t3>0){
                        $('button').removeAttr("disabled");
                    }
                }
            </script>

            <form class="form-horizontal" role="form" method="post" action="/user/reset" id="login-form">
                <div class="form-group">
                    <label for="oldPassword" class="col-lg-4 control-label">当前密码</label>
                    <div class="col-lg-8">
                        <input class="form-control" type="password" name="oldPassword" id="oldPassword" onblur="noEmpty()">
                    </div>
                </div>
                <div class="form-group">
                    <label for="newPassword" class="col-lg-4 control-label">新密码</label>
                    <div class="col-lg-8">
                        <input class="form-control" type="password" name="newPassword" id="newPassword" onblur="noEmpty()">
                    </div>
                </div>
                <div class="form-group">
                    <label for="newPasswordAgain" class="col-lg-4 control-label">再次输入新密码</label>
                    <div class="col-lg-8">
                        <input class="form-control" type="password" name="newPasswordAgain" id="newPasswordAgain" onblur="isSame();noEmpty()">
                        <span style="color: red;display: none" id="checkPdError">两次密码输入不一致</span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <hr>
                        <button class="btn btn-primary btn-lg btn-block" type="submit" id="login" disabled>提交</button>
                        <br/>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
</body>
</html>