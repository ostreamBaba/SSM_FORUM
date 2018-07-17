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
                <ol class="breadcrumb">
                    <li><a href="/">主页</a></li>
                    <li class="active">设置</li>
                </ol>
                <div class="cell">
                    <%--<div class="form-group">
                        <label class="col-sm-2 control-label">
                            用户名
                        </label>
                        <div class="col-sm-10">
                            <p class="form-control-static">email@example.com</p>
                        </div>
                    </div>--%>
                        <div class="form-horizontal" style="font-size: 12px;">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">个人成就</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static" style="font-size: 15px;color: red;">
                                        <b>本站第${user.userId}位会员</b></p>
                                </div>
                                <label class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">${user.username}</p>
                                </div>
                                <label class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static">${user.email}</p>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
            <div style="height:15px;"></div>
            <div class="box">
                <ol class="breadcrumb">
                    <li class="active">头像上传</li>
                </ol>
                <div class="cell">
                    关于头像的规则和建议
                    <hr>
                    <ul>
                        <li>本站 禁止使用任何低俗或者敏感图片作为头像</li>
                        <li>如果你是男的，请不要用女人的照片作为头像，这样可能会对其他会员产生误导</li>
                        <li>建议请尽量不要使用本人真人头像，避免辣别人眼睛</li>
                        <li style="color: red">本站对上传图片大小没有限制, 如果头像没有及时更新请稍等片刻
                        </li>
                        </li>
                    </ul>
                    <hr>
                    <%--<form action="/user/upload" method="post" enctype="multipart/form-data">
                        <input type="file" name="file">
                        <button type="submit">xx</button>
                    </form>--%>

                    <button class="btn btn-default" data-toggle="modal" style="outline: none;margin-left: 700px;" data-target="#myModal">
                        点击上传头像
                    </button>

                    <%--模拟框--%>
                    <form action="/user/upload" method="post" enctype="multipart/form-data">
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">
                                                请选择您的头像
                                            </h4>
                                        </div>
                                        <div class="modal-body">
                                            <input type="file" name="file">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="reset" class="btn btn-default">
                                                重置
                                            </button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                                关闭
                                            </button>
                                            <button type="submit" class="btn btn-primary">
                                                提交
                                            </button>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal -->
                            </div>
                        </form>
                    </div>
                </div>
            <%--<%
                request.setAttribute("msg","success");
            %>--%>


            <c:if test="${msg=='success'}">
                <div class="alert alert-success">
                    <strong>上传头像成功</strong>
                </div>
            </c:if>
            <c:if test="${msg=='error'}">
                <div class="alert alert-danger">
                    <strong>上传头像失败</strong>
                </div>
            </c:if>
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
                                <img src="${pageContext.request.contextPath}/resources/image/${username}.jpg" class="user-profile-picture
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

        </div>

    </div>
</div>
<div style="height: 50px"></div>
</body>
</body>
</html>