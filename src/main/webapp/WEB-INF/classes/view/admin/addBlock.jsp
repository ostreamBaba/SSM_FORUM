<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-6-20
  Time: 上午12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
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
        <title>管理员后台-添加版块</title>
        <link rel="stylesheet" href="//apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
        <script src="//apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    </head>


    <style>
        a{ text-decoration: none;}
        a:link{text-decoration: none;}
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
            font-family: "华文细黑";
            background:url("../../resources/image/8.jpg") no-repeat;
            background-size: 100%;
            margin-top: 80px;
        }

        .line{
            border-bottom:1px solid greenyellow;
        }
        .box{
            background-color: #ffffff;
            border-radius: 3px;
            border-bottom: 1px solid darkgray;
        }

        .cell{
            background: #ffffff;
            padding: 10px;
            font-size: 25px;
            text-align: left;
            line-height: 120%;
            border-top: 1px solid gray;
        }
        tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
        }


        a.node:active,
        a.node:link,
        a.node:visited {
            background-color: #f5f5f5;
            font-size: 12px;
            line-height: 12px;
            display: inline-block;
            padding: 4px 4px 4px 4px;
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
            border-radius: 2px;
            text-decoration: none;
            color: #999;
        }

        .votes {
            display: inline-block;
        }

        .cell_t{
            background: #ffffff;
            padding: 10px;
            font-size: 25px;
            text-align: left;
            line-height: 120%;
        }


    </style>
</head>
<body style="background-color: #727b84">

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

                <c:if test="${username!=null}">
                    <c:choose>
                        <%--如果有未读消息则显示该图标--%>
                        <%--<c:when test="${replyInfos1!=null&&fn:length(replyInfos1)>0}">
                            <li><a href="#">
                            <span class="glyphicon glyphicon-eye-close" style="color: red;font-size: 12px;">
                                    ${fn:length(replyInfos1)}
                            </span></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="#">
                                <b>未读</b></a>
                            </li>
                        </c:otherwise>--%>

                        <c:when test="${fn:length(replyInfos1)==0&&fn:length(articleInfos1)==0}">
                            <li><a href="/news/browse">
                                <b>未读</b></a>
                            </li>
                        </c:when>
                        <%--如果有未读消息则显示该图标--%>
                        <c:otherwise>
                            <li><a href="/news/browse">
                        <span class="glyphicon glyphicon-eye-close" style="color: red;font-size: 12px;">
                                ${fn:length(replyInfos1)+fn:length(articleInfos1)}
                        </span></a></li>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </ul>
            <ul id="logged-out-menu" class="nav navbar-nav navbar-right pull-right">
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" style="width: 250px" placeholder="Searh">
                    </div>
                    <a href="http://www.baidu.com" style="color:black"><span class="glyphicon glyphicon-search search-location"></span></a>
                </form>
                <c:if test="${username == null}">
                    <li><a href="/register">注册</a></li>
                    <li><a href="/login">登录</a></li>
                </c:if>
                <c:if test="${username != null}">
                    <%--<li><a href="">注销</a></li>--%>
                    <li><a href="">通知</a></li>
                    <li><a href="/reset">重置</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            设置
                        </a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li>
                                <a href="/article/toInfo/article-${username}">
                                    <span class="glyphicon glyphicon-user" style="color: darksalmon"></span>
                                    <span style="display: inline;margin-left: 15px">${username}</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/voted/browse/up">
                                    <span class="glyphicon glyphicon-chevron-up"></span>
                                    <span style="display: inline;margin-left: 15px">顶</span>
                                </a>
                            </li>
                            <li>
                                <a href="/voted/browse/down">
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                    <span style="display: inline;margin-left: 15px">踩</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/user/setting">
                                    <span class="glyphicon glyphicon-cog"></span>
                                    <span style="display: inline;margin-left: 15px">设置</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/user/layout">
                                    <span class="glyphicon glyphicon-log-in"></span>
                                    <span style="display: inline;margin-left: 15px">退出</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>

    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <div class="panel panel-default">
                <div class="panel-title"
                style="margin-top: 35px;font-size: 25px; margin-left: 20px;color: #6a1b9a">
                    添加版块
                </div>
                <hr>
                <div class="panel-body">

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
