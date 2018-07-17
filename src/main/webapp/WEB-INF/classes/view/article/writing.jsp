<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-6-2
  Time: 上午12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .search-location{
            top: 4px;
            margin-left: 12px;
        }
        .main-nav-location{
            margin-left: 12px;
        }
        .line{
            border-bottom:1px solid greenyellow;
        }
        body{
            margin-top: 70px;
            background-color: beige;
        }

        .box{
            background-color: #ffffff;
            border-radius: 3px;
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

        .title_container{
            width: 100%;
            border: none;
            resize: none;
            background-color: peachpuff;
            padding: 10px;
            font-family: 'Helvetica Neue','Hiragino Sans GB','Microsoft Yahei',sans-serif;
            margin: 0;
            box-sizing: border-box;
            outline: none;
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
<div class="container" id="content">
    <div class="row">
        <div class="col-md-9">
            <div class="box">
                <div class="cell">
                    <a href="/">主页</a><span>&nbsp;&nbsp;/&nbsp;&nbsp;创建新主题</span>
                </div>
                <form role="form" method="post" action="/article/new">
                    <div class="cell">主题标题</div>
                    <div class="cell" style="padding: 0px">
                        <textarea class="title_container" rows="1" maxlength="120" id="article_title" name="articleTitle" placeholder="请输入主题的标题"></textarea>
                    </div>
                    <div class="cell">
                        帖子正文
                    </div>
                    <div class="cell" style="padding: 0px">
                        <textarea class="title_container"
                                  rows="12" maxlength="20000"
                                  id="article_content" name="articleContent" autofocus="autofocus"
                                  style="background-color: #ffffff;"></textarea>
                    </div>
                    <div class="cell" style="border-top: 1px solid gray;padding: 15px">
                        <%--<div class="btn-group dropup">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                版块选择
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <c:forEach items="blocks" var="block">
                                    <li ></li>
                                </c:forEach>
                            </ul>
                        </div>--%>
                            <select class="form-control" style="width: 20%;" name="blockId">
                                <c:if test="${blocks!=null&&fn:length(blocks)>0}">
                                    <c:forEach items="${blocks}" var="block">
                                        <option value="${block.blockId}">${block.blockName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                    </div>
                    <div class="cell" style="padding: 15px">
                        <button class="btn btn-default" type="submit">
                            <span class="glyphicon glyphicon-send"></span>&nbsp;&nbsp;发布帖子</button>
                        <button class="btn btn-default" type="reset">
                            <span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;撤销</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                 <div class="panel-title text-center" style="margin-top: 20px">
                     发帖须知
                 </div>
                 <hr>
                 <div class="panel-body">
                     <p>1)严禁网友在版块内散播或制造任何与事实不符的言论。您的任何不良言论都将可能给第三方造成恶劣影响，相信您也不想受到同等待遇，请理解配合。</p>
                     <p>2)严禁将帖子发至无关版面，请选择对应版块发贴，以维护论坛的系统性和整洁性。</p>
                     <p>3)帖子标题请尽量与帖子内容相符，恶意欺骗性质或者标题过于刺激者，删除。</p>
                     <p>4)严禁因观点不同或讨论立场有异在版块上发表针对他人的嘲笑、讽刺、漫骂等人身攻击言论，盼会员间能雅量和谐、理性讨论。</p>
                 </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-title text-center" style="margin-top: 20px">
                    八荣八耻

                </div>
                <div style="border-top: 1px solid gray"></div>
                <div class="panel-body">
                    <p>以热爱祖国为荣，以危害祖国为耻；</p>
                    <p>以服务人民为荣，以背离人民为耻；</p>
                    <p>以崇尚科学为荣，以愚昧无知为耻；</p>
                    <p>以辛勤劳动为荣，以好逸恶劳为耻；</p>
                    <p>以团结互助为荣，以损人利己为耻；</p>
                    <p>以诚实守信为荣，以见利忘义为耻；</p>
                    <p>以遵纪守法为荣，以违法乱纪为耻；</p>
                    <p>以艰苦奋斗为荣，以骄奢淫逸为耻。</p>
                    <p style="float: right;margin-right: 12px;font-size: 20px;color: #FF0000">--ostreamBaba</p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
