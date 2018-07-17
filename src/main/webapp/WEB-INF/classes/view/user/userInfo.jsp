<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-5-31
  Time: 下午9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0  user-scalable=no maximum-scale=1.0, user-scalable=no">
        <!--width 属性控制设备的宽度。假设您的网站将被带有不同屏幕分辨率的设备浏览，那么将它设置为 device-width 可以确保它能正确呈现在不同设备上。
        initial-scale=1.0 确保网页加载时，以 1:1 的比例呈现，不会有任何的缩放。
        在移动设备浏览器上，通过为 viewport meta 标签添加 user-scalable=no 可以禁用其缩放（zooming）功能。
        通常情况下，maximum-scale=1.0 与 user-scalable=no 一起使用。这样禁用缩放功能后，用户只能滚动屏幕，就能让您的网站看上去更像原生应用的感觉。
        注意，这种方式我们并不推荐所有网站使用，还是要看您自己的情况而定！-->
        <title>Gucci Gang论坛-用户主页</title>
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
        html,body{
            width:100%;
            height:100%;
            padding-top: 10px;
        }
        body{
            font-family: "华文细黑";
            background:url("../../resources/image/0.jpg") no-repeat;
            background-attachment: fixed; /*固定背景不滑动*/
            background-size: 100%;
        }
        .line{
            border-bottom:1px solid greenyellow;
        }
        .account{
            margin-top: 200px;
        }
        .posts-list{
            list-style-type: none;
            padding-left: 0px;
        }
        .posts-list .posts-list-item, .account-picture-block div {
            margin-bottom: 0;
        }

        .posts-list .posts-list-item {
            width: 100%;
            margin-bottom: 10px;
        }

        .posts-list .posts-list-item .user-img {
            width: 24px;
            height: 24px;
            line-height: 24px;
            font-size: 1.5rem;
            float: left;
            border-radius: 50%;
        }

        .posts-list .posts-list-item .content {
            max-height: 250px;
            position: relative;
            clear: left;
            display: block;
            overflow: hidden;
            font-size: 18px;
            color:  grey;
        }

        * {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .bt{
            margin-bottom: 0px;
        }

        .fade-out {
            position: absolute;
            top: 190px;
            left: 0;
            width: 100%;
            margin: 0;
            padding: 30px 0;
            background-image: -o-linear-gradient(top,transparent,#fff);
        }

        .text-center{
            text-align: center;
        }


        .inline-block {
            display: inline-block;
            zoom: 1;
        }

        .account-bio-label{
            display: block;
            padding: 15px;
        }

        .account-bio-title{
            font-size: 20px;
            color: black;
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
                <c:if test="${username == null}">
                    <li><a href="/register">注册</a></li>
                    <li><a href="/login">登录</a></li>
                </c:if>
                <c:if test="${username != null}">
                    <%--<li><a href="">注销</a></li>--%>
                    <%--<li><a href="">通知</a></li>--%>
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
                            <c:if test="${username == 'admin'}">
                                <li class="divider"></li>
                                <li>
                                    <a href="/adminMain">
                                        <span class="glyphicon glyphicon-chevron-up"></span>
                                        <span style="display: inline;margin-left: 15px">管理员界面</span>
                                    </a>
                                </li>
                            </c:if>
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



<div id="content" class="container">
    <div class="account" style="background-color: white">
        <ol class="breadcrumb" style="margin-bottom: 5px;border-bottom: 1px solid grey">
            <li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
                <a href="/" itemprop="url">
                    <span itemprop="title">主页</span>
                </a>
            </li>
            <li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
               <span itemprop="title" class="active">
                   ${userName}
               </span>
            </li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-5 account-block">
            <div class="account-picture-block panel panel-default">
                <div class="panel-body">
                    <div class="center">
                        <img src="${pageContext.request.contextPath}/resources/image/${userName}.jpg" class="user-profile-picture" style="margin-left: 140px;"
                        height="150px" width="150px">
                    </div>
                    <div class="text-center">
                        <h2 class="fullname">
                            ${userName}
                            <small>(@${userName})</small>
                        </h2>
                        <br />
                        <a href="#" class="btn btn-primary btn-sm">聊天</a>
                        <a href="#" class="btn btn-success btn-sm">关注</a>
                        <a href="#" class="btn btn-warning btn-sm hide">取消关注</a>
                    </div>

                    <hr>

                    <div class="text-center">
                        <p>个性签名:   One World,One Dream</p>
                    </div>

                    <hr>

                    <div class="text-center account-stats">
                        <div class="inline-block text-center">
                            <span class="account-bio-title">平民</span>
                            <span class="account-bio-label">声望</span>
                        </div>
                        <div class="inline-block text-center">
                            <span class="account-bio-title">${fn:length(articles)}</span>
                            <span class="account-bio-label">帖子</span>
                        </div>
                        <div class="inline-block text-center">
                            <span class="account-bio-title">${fn:length(articles)*5}</span>
                            <span class="account-bio-label">活跃度</span>
                        </div>
                        <div class="inline-block text-center">
                            <span class="account-bio-title">是</span>
                            <span class="account-bio-label">是否单身</span>
                        </div>
                    </div>

                    <hr>

                </div>
            </div>
        </div>

        <div class="col-md-7">
           <c:choose>
               <c:when test="${articles!=null&&fn:length(articles)>0}">
                   <ul class="posts-list">
                       <c:forEach items="${articles}" var="article">
                           <li class="posts-list-item">
                               <div class="panel panel-default bt">
                                   <div class="panel-body">
                                       <a href="#">
                                           <img title="#" class="img-rounded user-img img-responsive"
                                                src="${pageContext.request.contextPath}/resources/image/${userName}.jpg">
                                       </a>
                                       <a href="#">
                                           <span style="margin-left: 20px;color: grey">${article.articleUserName}</span>
                                       </a>
                                       <div class="content">
                                           <p style="margin: 0 0 10px"></p>
                                           ${article.articleContent}
                                           <p style="margin: 0 0 10px"></p>
                                           <p class="fade-out"></p>
                                       </div>
                                       <small>
                                <span class="pull-right">
                                    发布于 ${article.articleCreateTime}
                                     •
                                    <a href="/article/article-${article.articleId}" style="color: grey">
                                        阅读更多
                                    </a>
                                </span>
                                       </small>
                                   </div>
                               </div>
                           </li>
                       </c:forEach>
                   </ul>
               </c:when>
               <c:otherwise>
                   <div class="alert alert-danger">
                       <strong>该用户重未发过帖子</strong>
                   </div>
               </c:otherwise>
           </c:choose>
        </div>
    </div>
</div>
<div style="height: 50px"></div>
</body>
</html>