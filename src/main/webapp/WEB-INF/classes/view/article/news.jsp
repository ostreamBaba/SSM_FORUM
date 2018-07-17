<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-6-19
  Time: 上午12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <title>Gucci Gang论坛-踩贴</title>
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

        html,body{
            width:100%;
            height:100%;
            padding-top: 70px;
        }
        body{
            font-family: "华文细黑";
            background:url("../../resources/image/8.jpg") no-repeat;
            background-size: 100%;
        }

        .line{
            border-bottom:1px solid greenyellow;
        }

        li{
            list-style-type: none;
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

        a{ text-decoration: none;}
        a:link{text-decoration: none;}

        * {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .center{
            text-align: center;
        }

        .cell{
            background: #ffffff;
            padding: 10px;
            font-size: 14px;
            text-align: left;
            line-height: 120%;
            border-bottom: 1px solid gray;
        }

        .user-img {
            width: 24px;
            height: 24px;
            line-height: 24px;
            font-size: 1.5rem;
            float: left;
            border-radius: 50%;
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

        .content {
            max-height: 250px;
            position: relative;
            clear: left;
            display: block;
            overflow: hidden;
            font-size: 15px;
            color:  black;
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

<div class="container">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="/">主页</a></li>
            <li class="active">
                未读
            </li>
        </ol>

        <%--回复--%>
        <div class="col-md-12">
            <div class="col-md-4">
                <div class="panel panel-success">
                    <div class="panel-title center">
                        <div style="height: 20px"></div>
                        <span class="glyphicon glyphicon-envelope" style="font-size: 20px;color: #35db00"><span style="margin-left: 15px;">评论</span></span>
                    </div>
                    <hr>
                    <c:choose>
                        <c:when test="${replyList!=null&&fn:length(replyList)>0}">
                            <c:forEach items="${replyList}" varStatus="status" var="reply">
                                <div class="cell">
                                    <a href="#">
                                        <img title="#" class="img-rounded user-img img-responsive"
                                             src="${pageContext.request.contextPath}/resources/image/${reply.replyUserName}.jpg">
                                    </a>
                                    <a href="#">
                                        <span style="margin-left: 20px;color: grey">${reply.replyUserName}&nbsp;&nbsp;回复了您</span></span>
                                    </a>
                                    <div class="content">
                                        <p style="margin: 0 0 10px"></p>
                                            ${reply.replyText}
                                        <p style="margin: 0 0 10px"></p>
                                        <p class="fade-out"></p>
                                    </div>
                                    &nbsp;
                                    <small>
                                <span class="pull-right">
                                    <a href="/news/toArticle-${reply.replyArticleId}?replyInfoId=${replyInfoIdList[status.index]}" style="color: grey">
                                        阅读更多
                                    </a>
                                </span>
                                    </small>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-warning">
                                没有用户评论过您
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-success">
                    <div class="panel-title center">
                        <div style="height: 20px"></div>
                        <span class="glyphicon glyphicon-thumbs-up" style="font-size: 20px;color: darkorange;"><span style="margin-left: 15px;">点赞</span></span>
                    </div>
                    <hr>
                    <c:if test="${goodReply!=null&&fn:length(goodReply)>0}">
                        <c:forEach items="${goodReply}" var="reply" varStatus="status">
                            <%--<c:out value="${goodReplyInfoIdList[status.index]}" />--%>
                            <div class="cell">
                                <a href="#">
                                    <img title="#" class="img-rounded user-img img-responsive"
                                         src="${pageContext.request.contextPath}/resources/image/${reply.replyUserName}.jpg">
                                </a>
                                <a href="#">
                                    <span style="margin-left: 20px;color: grey">${reply.replyUserName}&nbsp;&nbsp;点赞了您的评论</span></span>
                                </a>
                                <div class="content">
                                    <p style="margin: 0 0 10px"></p>
                                        ${reply.replyText}
                                    <p style="margin: 0 0 10px"></p>
                                    <p class="fade-out"></p>
                                </div>
                                &nbsp;
                                <small>
                                <span class="pull-right">
                                    <a href="/news/toArticle-${reply.replyArticleId}?replyInfoId=${goodReplyInfoIdList[status.index]}" style="color: grey">
                                        阅读更多
                                    </a>
                                </span>
                                </small>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${goodArticle!=null&&fn:length(goodArticle)>0}">
                        <c:forEach items="${goodArticle}" var="article" varStatus="status">
                            <div class="cell">
                                <a href="/article/toInfo/article-${article.articleUserName}">
                                    <img title="#" class="img-rounded user-img img-responsive"
                                         src="${pageContext.request.contextPath}/resources/image/${article.articleUserName}.jpg">
                                </a>
                                <a href="/article/toInfo/article-${article.articleUserName}">
                                    <span style="margin-left: 20px;color: grey">${article.articleUserName}&nbsp;&nbsp;点赞了您的文章</span></span>
                                </a>
                                <div class="content">
                                    <p style="margin: 0 0 10px"></p>
                                        ${article.articleTitle}
                                    <p style="margin: 0 0 10px"></p>
                                    <p class="fade-out"></p>
                                </div>
                                &nbsp;
                                <small>
                                        <span class="pull-right">
                                           <a href="/news/toArticle-${article.articleId}?articleInfoId=${goodArticleInfoIdList[status.index]}" style="color: grey">
                                                阅读更多
                                            </a>
                                        </span>
                                </small>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(goodReply)==0&&fn:length(goodArticle)==0}">
                        <div class="alert alert-warning">
                            没有用户点赞过您
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-success">
                    <div class="panel-title center">
                        <div style="height: 20px"></div>
                        <span class="glyphicon glyphicon-thumbs-down" style="font-size: 20px;color: #727b84"><span style="margin-left: 15px;">反对</span></span>
                    </div>
                    <hr>
                    <c:if test="${badReply!=null&&fn:length(badReply)>0}">
                        <c:forEach items="${badReply}" var="reply" varStatus="status">
                            <div class="cell">
                                <a href="#">
                                    <img title="#" class="img-rounded user-img img-responsive"
                                         src="${pageContext.request.contextPath}/resources/image/${reply.replyUserName}.jpg">
                                </a>
                                <a href="#">
                                    <span style="margin-left: 20px;color: grey">${reply.replyUserName}&nbsp;&nbsp;踩了您的评论</span></span>
                                </a>
                                <div class="content">
                                    <p style="margin: 0 0 10px"></p>
                                        ${reply.replyText}
                                    <p style="margin: 0 0 10px"></p>
                                    <p class="fade-out"></p>
                                </div>
                                &nbsp;
                                <small>
                                        <span class="pull-right">
                                           <a href="/news/toArticle-${reply.replyArticleId}?replyInfoId=${badReplyInfoIdList[status.index]}" style="color: grey">
                                                阅读更多
                                            </a>
                                        </span>
                                </small>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${badArticle!=null&&fn:length(badArticle)>0}">
                        <c:forEach items="${badArticle}" var="article" varStatus="status">
                            <div class="cell">
                                <a href="/article/toInfo/article-${article.articleUserName}">
                                    <img title="#" class="img-rounded user-img img-responsive"
                                         src="${pageContext.request.contextPath}/resources/image/${article.articleUserName}.jpg">
                                </a>
                                <a href="/article/toInfo/article-${article.articleUserName}">
                                    <span style="margin-left: 20px;color: grey">${article.articleUserName}&nbsp;&nbsp;踩了您的文章</span></span>
                                </a>
                                <div class="content">
                                    <p style="margin: 0 0 10px"></p>
                                        ${article.articleTitle}
                                    <p style="margin: 0 0 10px"></p>
                                    <p class="fade-out"></p>
                                </div>
                                &nbsp;
                                <%--<c:out value="${badArticleInfoIdList[status.index]}"/>--%>
                                <small>
                                    <span class="pull-right">
                                        <a href="/news/toArticle-${article.articleId}?articleInfoId=${badArticleInfoIdList[status.index]}" style="color: grey">
                                            阅读更多
                                        </a>
                                    </span>
                                </small>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${fn:length(badReply)==0&&fn:length(badArticle)==0}">
                        <div class="alert alert-warning">
                            没有用户踩过您
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

    </div>
</div>
</div>


</body>
</html>