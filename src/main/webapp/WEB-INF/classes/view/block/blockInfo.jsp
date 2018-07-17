<%@ page import="com.viscu.UI.domain.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.viscu.UI.domain.Block" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-5-29
  Time: 下午9:51
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
        <title>Gucci Gang论坛</title>
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
            padding-top: 80px;
        }
        .line{
            border-bottom:1px solid greenyellow;
        }
        .box{
            background-color: #ffffff;
            border-radius: 4px;
            border-bottom: 1px solid darkgray;
        }

        .cell{
            background: #ffffff;
            padding: 10px;
            font-size: 18px;
            text-align: left;
            line-height: 120%;
            border-bottom: 1px solid gray;
        }

        .cell_title{
            background: #ffffff;
            padding: 15px;
            font-size: 15px;
            text-align: left;
            line-height: 120%;
            border-bottom: 1px solid gray;
        }

        tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
        }
        .item_title {
            font-size: 18px;
            line-height: 130%;
            text-shadow: 0 1px 0 #fff;
            word-wrap: break-word;
        }

        .topic_info {
            font-size: 12px;
            color: #ccc;
            line-height: 200%;
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
<body>
<body style="background-color: #727b84">

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

<!--content-->
<div class="container" id="content">
    <div class="row">
        <div class="col-lg-9">
            <div class="box">
                <div class="cell_title">
                    <a href="/">主页</a><span style="color: grey">&nbsp;&nbsp;/&nbsp;&nbsp;版块&nbsp;&nbsp;/&nbsp;&nbsp;${block.blockName}</span>
                </div>

                <%
                    List<Article> articles=(List<Article>)request.getAttribute("articles");
                    Iterator<Article> it=articles.iterator();
                    int allArticle=articles.size();
                    int allBrowse=0;
                    while (it.hasNext()){
                        Article article=it.next();
                        allBrowse+=article.getArticleBrowseCount();
                    }
                %>

                <div class="cell">
                    <div class="pull-right" style="margin-top: 15px">
                        <button class="btn btn-default" style="border: none">
                            <span>浏览量: &nbsp;<%=allBrowse%></span>
                        </button>
                        <button class="btn btn-default" style="border: none">
                            <span>帖子数: &nbsp;<%=allArticle%></span>
                        </button>
                    </div>
                    <img src="${pageContext.request.contextPath}/resources/image/${block.blockId}.jpg"
                         class="img-circle" height="70px" width="70px">
                    <span style="margin-left: 25px;font-size: 20px;color: grey">
                        ${block.blockDescribe}
                    </span>
                </div>
                <%-- <c:forEach items="${ArticleList}" begin="1" end="${fn:length(ArticleList)}" varStatus="stat">--%>
                <c:forEach items="${articles}" var="Article">
                    <div class="cell">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tbody>
                            <tr>
                                <td width="48px" valign="top" align="center" style="padding-top: 8px">
                                    <img src="${pageContext.request.contextPath}/resources/image/1.png" width="55px" height="55px"/>
                                </td>
                                <td width="15px"></td>
                                <td width="auto" valign="middle">
                                    <span class="item_title">
                                        <a href="/article/article-${Article.articleId}" style="color: #555555;">${Article.articleTitle}</a>
                                    </span>
                                    <div style="height: 5px"></div>
                                    <span class="topic_info">
                                        <div class="votes"></div>
                                         <c:forEach items="${blocks}" var="block">
                                             <c:if test="${Article.blockId==block.blockId}">
                                                 <a class="node" href="#">${block.blockName}</a>
                                             </c:if>
                                         </c:forEach>
                                        &nbsp;•&nbsp;
                                    <a href="/article/toInfo/article-${Article.articleUserName}"><strong style="color: grey">${Article.articleUserName}</strong></a>
                                        <c:if test="${Article.articleReplyCount>0}">
                                            &nbsp;•&nbsp; 最后回复时间:
                                            <strong>${Article.articleLastReplyTime}</strong>
                                        </c:if>
                                    </span>
                                </td>
                                <td width="70px" align="right" valign="middle">
                                    <button class="btn btn-default" style="border: none">
                                        <span class="glyphicon glyphicon-eye-open">&nbsp;${Article.articleBrowseCount}</span>
                                    </button>
                                </td>
                                <td width="70px" align="right" valign="middle">
                                    <button class="btn btn-default" style="border: none">
                                        <span class="glyphicon glyphicon-pencil">&nbsp;${Article.articleReplyCount}</span>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="col-lg-3 col-xs-12">
            <div class="login-well">
                <div class="text-center">
                    <%-- <%
                         String name="1";  test c:if
                         request.setAttribute("username",name);
                     %>--%>
                    <c:if test="${username==null}">
                        <p>
                            人生苦短、我学python
                        </p>
                        <a href="/login" class="btn btn-primary" rel="nofollow">
                            请先登录
                        </a>
                    </c:if>
                    <c:if test="${username!=null}">
                        <div class="center">
                            <a href="${pageContext.request.contextPath}/article/toInfo/article-${username}">
                                <img src="${pageContext.request.contextPath}/resources/image/13.jpeg" class="user-profile-picture
                                   img-circle" height="130px" width="130px">
                            </a>
                        </div>
                        <hr>
                        <p style="font-size: 20px;color: royalblue">
                            <strong>${username}</strong>
                        </p>
                        <hr>
                        <span class="glyphicon glyphicon-pencil" style="color: green">
                           <a href="/writing" <%--data-toggle="modal" data-target="#myModal"--%>>创建新的帖子</a>
                       </span>
                    </c:if>
                </div>
            </div>

            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">热门帖子</h3>
                </div>
                <c:forEach items="${tenArticles}" var="ta">
                    <div class="cell" style="font-size:15px;">
                        <img src="${pageContext.request.contextPath}/resources/image/${ta.articleUserName}.jpg" width="30px"
                             height="30px" class="img-rounded">
                        <a href="/article/article-${ta.articleId}" style="color: grey"><span style="margin-left: 5px">${ta.articleTitle}</span></a>
                    </div>
                </c:forEach>
            </div>

            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">话题广场</h3>
                </div>
                <div class="panel-body">

                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">推荐企业</h3>
                </div>
                <div class="panel-body">

                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">社区状况</h3>
                </div>
                <%
                    List<Article> articles1=(List<Article>)request.getSession().getAttribute("ArticleList");
                    int articleNum=articles1.size();
                    Iterator<Article> it1=articles1.iterator();
                    int replyNum=0;
                    while(it1.hasNext()){
                        Article article=it1.next();
                        replyNum+=article.getArticleReplyCount();
                    }
                %>
                <div class="cell_t" style="font-size:15px;margin-left: 10px">
                    <div style="margin-bottom: 5px">
                        <span style="color: grey;">会员数量: <span style="color: darkgoldenrod">${userNum}</span></span>
                    </div>
                    <div style="margin-bottom: 5px">
                        <span style="color: grey;">帖子数量: <span style="color: darkgoldenrod"><%=articleNum%><span></span>
                    </div>
                    <div>
                        <span style="color: grey;">回复数量: <span style="color: darkgoldenrod"><%=replyNum%></span></span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div style="height: 50px"></div>
</body>
</body>
</html>