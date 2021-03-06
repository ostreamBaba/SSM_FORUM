<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-6-20
  Time: 下午9:13
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
        <link href="../resources/pnotify/pnotify.custom.min.css" rel="stylesheet" type="text/css">
        <script src="../resources/pnotify/pnotify.custom.min.js"></script>
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

        body{
            font-family: "华文细黑";
            background:url("../../resources/image/8.jpg") no-repeat;
            background-attachment: fixed; /*固定背景不滑动*/
            background-size: 100%;
            margin-top: 80px;
        }

        .line{
            border-bottom:1px solid greenyellow;
        }
        tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
        }

        a{
            font-size: 14px;
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
                                    <a href="/">
                                        <span class="glyphicon glyphicon-tree-deciduous"></span>
                                        <span style="display: inline;margin-left: 15px">前台界面</span>
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
        <div class="col-md-3">
            <div class="panel-group">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h5 class="panel-title">
                            <a href="/adminMain">管理员界面首页
                            </a>
                        </h5>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h5 class="panel-title">
                            <a data-toggle="collapse"
                               href="#one">
                                会员管理
                            </a>
                        </h5>
                    </div>
                    <div id="one" class="panel-collapse collapse">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="#one-one" data-toggle="collapse">
                                    查找用户
                                </a>
                            </h6>
                        </div>
                        <div id="one-one" class="panel-collapse collapse" style="background-color:#9ccc65;">
                            <div class="panel-heading">
                                <h6 class="panel-title">
                                    <a href="/admin/userManagerByCondition">
                                        条件查找
                                    </a>
                                </h6>
                            </div>
                            <div class="panel-heading">
                                <h6 class="panel-title">
                                    <a href="/admin/userManagerAll">
                                        查找全部
                                    </a>
                                </h6>
                            </div>
                        </div>
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="#">
                                    删除用户
                                </a>
                            </h6>
                        </div>
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="#">
                                    修改用户信息
                                </a>
                            </h6>
                        </div>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse"
                               href="#two">
                                帖子管理
                            </a>
                        </h4>
                    </div>
                    <div id="two" class="panel-collapse collapse">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="#two-two" data-toggle="collapse">
                                    查找帖子
                                </a>
                            </h6>
                        </div>
                        <div id="two-two" class="panel-collapse collapse" style="background-color:#80deea;;">
                            <div class="panel-heading">
                                <h6 class="panel-title">
                                    <a href="/admin/articleManagerByCondition">
                                        条件查找
                                    </a>
                                </h6>
                            </div>
                            <div class="panel-heading">
                                <h6 class="panel-title">
                                    <a href="/admin/articleManagerAll">
                                        查找全部
                                    </a>
                                </h6>
                            </div>
                        </div>
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="#">
                                    删除帖子
                                </a>
                            </h6>
                        </div>
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="#">
                                    修改帖子
                                </a>
                            </h6>
                        </div>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse"
                               href="#three">
                                回复管理
                            </a>
                        </h4>
                    </div>
                    <div id="three" class="panel-collapse collapse">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="#three-three" data-toggle="collapse">
                                    查找回复
                                </a>
                            </h6>
                        </div>
                        <div id="three-three" class="panel-collapse collapse" style="background-color:#c6ff00;">
                            <div class="panel-heading">
                                <h6 class="panel-title">
                                    <a href="/admin/replyManagerByCondition">
                                        条件查找
                                    </a>
                                </h6>
                            </div>
                            <div class="panel-heading">
                                <h6 class="panel-title">
                                    <a href="/admin/replyManagerAll">
                                        查找全部
                                    </a>
                                </h6>
                            </div>
                        </div>
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="#">
                                    删除回复
                                </a>
                            </h6>
                        </div>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse"
                               href="#four">
                                模块管理
                            </a>
                        </h4>
                    </div>
                    <div id="four" class="panel-collapse collapse">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="/admin/blockManagerByFind">
                                    查找版块
                                </a>
                            </h6>
                        </div>
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="/admin/blockManagerByAllToDelete">
                                    删除版块
                                </a>
                            </h6>
                        </div>
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a href="/admin/blockManagerAdd">
                                    添加版块
                                </a>
                            </h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-title">
                        <span style="font-size:14px;color: #FF0000">当前位置:</span>
                        <span style="font-size:14px;color: grey">&nbsp;&nbsp;会员管理</span>
                        <c:choose>
                            <c:when test="${msg == '1'}">
                                <span style="font-size:14px;color: grey">&nbsp;&nbsp;一一查找版块</span>
                            </c:when>
                            <c:when test="${msg == '2'}">
                                <span style="font-size:14px;color: grey">&nbsp;&nbsp;一一删除版块</span>
                            </c:when>
                            <c:when test="${msg == '3'}">
                                <span style="font-size:14px;color: grey">&nbsp;&nbsp;一一添加版块</span>
                            </c:when>
                        </c:choose>
                    </div>
                </div>

                <script>

                    $(document).ready(function(){

                        $('#checkId1').click(function(){
                            if($('#idInput').val()==null){
                                new PNotify({
                                    title: 'Error!',
                                    text: '请输入id',
                                    type: 'error'
                                });
                                return;
                            }
                            $.ajax({
                                type: 'get',
                                url: '${pageContext.request.contextPath}/block/findById',
                                data:{
                                    id: $('#idInput').val()
                                },
                                dataType: 'json',
                                success:function(data){
                                    /*alert(data.articleId);*/
                                    if(data.blockId==null){
                                        var msg=document.getElementById('tr1');
                                        if(msg!=null){
                                            $('#tr1').remove();
                                        }
                                        new PNotify({
                                            title: 'Error!',
                                            text: '查找不到该版块',
                                            type: 'error'
                                        });
                                    }else{
                                        var msg=document.getElementById('tr1');
                                        if(msg!=null){
                                            $('#tr1').remove();
                                        }
                                        var msg="<tr id='tr1'><td>"+data.blockId+"</td><td>"
                                            +data.blockDescribe+"</td><td>"
                                            +data.blockName+"</td><td>"
                                            +data.blockArticleNum+"</td><tr>";
                                        $('#findIdTable').append(msg);
                                    }
                                },
                                error:function(){
                                    alert('failed to find');
                                }
                            })
                        });

                    })

                </script>


                <script>
                    function deleteBlock(id,name){
                        alert(id);
                        $.ajax({
                            type: 'get',
                            url: "${pageContext.request.contextPath}/block/deleteById",
                            data: {
                                id: name
                            },
                            success: function(data){
                                alert("success");
                                new PNotify({
                                    title: 'Success!',
                                    text: '删除成功',
                                    type: 'success'
                                });
                                $('#'+"tr-"+name).remove();
                            },
                            error: function (data) {
                                alert("failed to delete");
                            }
                        })
                    }
                </script>

                <c:choose>
                    <c:when test="${msg=='1'}">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="well well-lg" style="background-color:white;">
                                        <div class="form-inline"> <%--BootStrap让两个控件在一行显示--%>
                                            <input type="text" placeholder="请输入要查找的版块的id" class="form-control"
                                                   style="width: 300px;" id="idInput"/>
                                            <button class="btn btn-info pull-right" id="checkId1">查看</button>
                                        </div>
                                        <hr>
                                        <div>
                                            <span>论坛描述: 这是一个神奇的网站</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="well well-lg" style="background-color:white;">
                                        <table class="table" id="findIdTable">
                                            <tr><th>版块id</th><th>版块描述</th><th>版块名称</th><th>版块文章数量</th></tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="alert alert-warning">
                                        该模块待开发
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <div class="alert alert-warning">
                                        该模块待开发
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>



                    <c:when test="${msg=='2'}">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="well well-lg" style="background-color:white;">
                                        <table class="table" id="table1">
                                            <tr>
                                                <th>版块id</th><th>版块描述</th><th>版块名称</th><th>版块文章数量</th>
                                                <th>查看</th><th>操作</th>
                                            </tr>
                                            <c:forEach items="${blocks}" var="block" varStatus="status">
                                                <tr name="tr" id="tr-${block.blockId}">
                                                    <td>
                                                            ${block.blockId}
                                                    </td>
                                                    <td>
                                                            ${block.blockDescribe}
                                                    </td>
                                                    <td>
                                                            ${block.blockName}
                                                    </td>
                                                    <td>
                                                            ${block.blockArticleNum}
                                                    </td>
                                                    <td>
                                                        <a href="/block/block-${block.blockId}">前往</a>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-info"
                                                                id="${status.index}" name="${block.blockId}" onclick="deleteBlock(this.id,this.name)">删除
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="alert alert-warning">
                                        该模块待开发
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <div class="alert alert-warning">
                                        该模块待开发
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-footer">
                            如果我死于非命，我希望那时的我，能给500万人带来快乐。
                            <span style="color: grey">&nbsp;&nbsp;--XXXtentacion</span>
                        </div>
                    </c:when>
                    <c:when test="${msg=='3'}">
                        <div class="row">
                            <div class="col-md-offset-2 col-md-8" style="margin-top: 30px;">
                                <div class="panel panel-default">
                                    <div class="panel-title"
                                         style="margin-top: 35px;font-size: 25px; margin-left: 20px;color: #6a1b9a">
                                        添加版块
                                    </div>
                                    <hr>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-8 col-lg-offset-2">
                                                <input id="blockName" class="form-control" placeholder="输入版块名称" />
                                                <div style="height: 15px"></div>
                                                <input id="blockDescribe" class="form-control" placeholder="请输入版块描述" />
                                                <div style="height: 30px"></div>
                                                <button id="add" class="btn btn-info" type="submit"
                                                onclick="add()">添加</button>
                                            </div>
                                        </div>
                                    </div>
                                    <script>
                                        function add(){
                                            $.ajax({
                                                type: 'post',
                                                url: '${pageContext.request.contextPath}/block/new',
                                                data:{
                                                    blockDescribe: $('#blockDescribe').val(),
                                                    blockName: $('#blockName').val(),
                                                },
                                                success:function(data){
                                                    new PNotify({
                                                        title: 'Success!',
                                                        text: '添加成功',
                                                        type: 'success'
                                                    });
                                                },
                                                error:function(data){
                                                    alert("failed to add")
                                                }
                                            })
                                        }
                                    </script>

                                    <div class="panel-footer">
                                        这是一个神奇的网站
                                    </div>
                                </div>
                                <div style="height: 30px;"></div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>



            </div>
        </div>
    </div>
</div>


</body>
</html>
