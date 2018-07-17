<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-5-29
  Time: 下午9:51
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
        <title>Gucci Gang论坛</title>
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
                <li><a href="#"><b>版块</b></a></li>
                <li><a href="#"><b>充值</b></a></li>
            </ul>
            <ul id="logged-out-menu" class="nav navbar-nav navbar-right pull-right">
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" style="width: 250px" placeholder="Searh">
                    </div>
                    <a href="http://www.baidu.com" style="color:black"><span class="glyphicon glyphicon-search search-location"></span></a>
                </form>
                <li><a href="#">注册</a></li>
                <li><a href="#">登录</a></li>
            </ul>
        </div>

    </div>
</nav>



<div class="container" id="content">
    <ol class="breadcrumb">
        <li><a href="/">主页</a></li>
        <li class="active">登录</li>
    </ol>

    <div class="row">
        <div class="col-md-6">
            <div class="login-block">
                <%--<%
                    request.setAttribute("msg","error"); //test error
                %>--%>
                <c:if test="${Msg =='noLogin'}">
                    <div class="alert alert-danger">
                        <strong>请先登录再进行访问</strong>
                    </div>
                </c:if>
                <c:if test="${Msg =='error'}">
                    <div class="alert alert-danger">
                        <strong>登录失败,请重试</strong>
                    </div>
                </c:if>
                <c:if test="${Msg == 'success'}">
                    <div class="alert alert-success">
                        <strong>密码重置成功,请重新登录</strong>
                    </div>
                </c:if>
            </div>

            <script>
                function noEmpty(){
                    /*alert("test");*/
                    var t1=document.getElementById('username').value.length;
                    var t2=document.getElementById('password').value.length;
                    console.log(t1);
                    console.log(t2);
                    if(t1>0&&t2>0){
                        $('button').removeAttr("disabled");
                    }
                }
            </script>

            <form class="form-horizontal" role="form" method="post" action="/user/login" id="login-form">
                <div class="form-group">
                    <laber for="username" class="col-lg-2 control-label">用户名</laber>
                    <div class="col-lg-10">
                        <input class="form-control" type="text" name="username" id="username" placeholder="请输入用户名" onblur="noEmpty()">
                    </div>
                </div>
                <div class="form-group">
                    <laber for="password" class="col-lg-2 control-label">密码</laber>
                    <div class="col-lg-10">
                        <input class="form-control" type="password" name="password" id="password" placeholder="请输入密码" onblur="noEmpty()">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <%--<div class="checkbox">
                            <label>
                                <input type="checkbox" name="remember" id="remember">记住我?
                            </label>
                        </div>--%>
                        <div>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="role" value="admin"> 管理员
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="role" value="user"> 会员
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <hr>
                        <button class="btn btn-primary btn-lg btn-block" type="submit" id="login" disabled>登录</button>
                        <br/>
                        <span>没有账号?&nbsp;&nbsp;<a href="/register">注册</a>&nbsp;&nbsp;<a id="reset" href="/forget">忘记密码</a></span>
                    </div>
                </div>

            </form>

        </div>
        <div class="col-md-6">
            <div id="bestCarsCarousel" class="carousel slide picture_hight" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#bestCarsCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#bestCarsCarousel" data-slide-to="1"></li>
                    <li data-target="#bestCarsCarousel" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides  -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="/resources/image/3.jpg">
                        <div class="carousel-caption">
                            <h3>1</h3>
                            <p>viscu真的很牛逼</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/resources/image/4.jpg">
                        <div class="carousel-caption">
                            <h3>2</h3>
                            <p>viscu真的很牛逼</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/resources/image/12.png">
                        <div class="carousel-caption" >
                            <h3>3</h3>
                            <p>viscu真的很牛逼</p>
                        </div>
                    </div>
                </div>
                <!-- Controls -->
                <a class="left carousel-control" href="#bestCarsCarousel" data-slide="prev">
                    <span  class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#bestCarsCarousel" data-slide="next">
                    <span  class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
        </div>
    </div>


</div>


</body>
</html>