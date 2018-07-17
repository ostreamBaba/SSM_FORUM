<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-6-20
  Time: 下午9:14
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
                            <c:when test="${msg=='1'}">
                                <span style="font-size:14px;color: grey">&nbsp;&nbsp;一一条件查找</span>
                            </c:when>
                            <c:otherwise>
                                <span style="font-size:14px;color: grey">&nbsp;&nbsp;一一查找全部</span>
                            </c:otherwise>
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
                                url: '${pageContext.request.contextPath}/reply/findById',
                                data:{
                                    id: $('#idInput').val()
                                },
                                dataType: 'json',
                                success:function(data){
                                    /*alert(data.articleId);*/
                                    if(data.replyId==null){
                                        var msg=document.getElementById('tr1');
                                        if(msg!=null){
                                            $('#tr1').remove();
                                        }
                                        new PNotify({
                                            title: 'Error!',
                                            text: '查找不到该该回复',
                                            type: 'error'
                                        });
                                    }else{
                                        var msg=document.getElementById('tr1');
                                        if(msg!=null){
                                            $('#tr1').remove();
                                        }
                                        var msg="<tr id='tr1'><td>"+data.replyId+"</td><td>"
                                            +data.replyArticleId+"</td><td>"
                                            +data.replyUserName+"</td><td>"
                                            +data.replyText+"</td><td>"
                                            +data.replyGoodCount+"</td><td>"
                                            +data.replyBadCount+"</td><tr>";
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

                    $(document).ready(function(){
                        $('#up').click(function(){
                            var pageCount=$('#pageCount').val();
                            var currentPage=Number(pageCount)-Number(1);
                            if(currentPage < 1){
                                new PNotify({
                                    title: 'Error!',
                                    text: '没有上一页',
                                    type: 'error'
                                });
                                return;
                            }else{
                                $('#pageCount').val(currentPage);
                            }

                            $.ajax({
                                type: 'get',
                                url: "${pageContext.request.contextPath}/reply/findByPage",
                                data:{
                                    currentPage: $('#pageCount').val(),
                                    size: 5
                                },
                                dataType: "json",
                                success:function(result){
                                    var size=5;
                                    /*alert(size);*/
                                    for(var i=0;i<size;++i){
                                        $('#'+"tr-"+i).remove();
                                    }
                                    for(var i=0;i<result.length;++i){
                                        var id='tr-'+i;
                                        var msg="<tr id="+id+"><td>"+result[i].replyId+"</td><td>"
                                            +result[i].replyArticleId+"</td><td>"
                                            +result[i].replyUserName+"</td><td>"
                                            +result[i].replyText+"</td><td>"
                                            +result[i].replyGoodCount+"</td><td>"
                                            +result[i].replyBadCount+"</td><td><button class='btn btn-info' id="
                                            +result[i].replyId+" name="+i+" onclick='deleteUser(this.id,this.name)'>删除</button></td><tr>";
                                        $('#table1').append(msg);
                                    }
                                },
                                error:function(data){
                                    alert("failed to findByPage")
                                }
                            })
                        })

                        $('#down').click(function(){
                            var pageCount=$('#pageCount').val();
                            if(Number(pageCount)+Number(1) > $('#totalPage').val()){
                                new PNotify({
                                    title: 'Error!',
                                    text: '没有下一页',
                                    type: 'error'
                                });
                                return;
                            }else{
                                $('#pageCount').val(Number(pageCount)+Number(1));
                            }

                            $.ajax({
                                type: 'get',
                                url: "${pageContext.request.contextPath}/reply/findByPage",
                                data:{
                                    currentPage: $('#pageCount').val(),
                                    size: 5
                                },
                                dataType: 'json',
                                success:function(result){
                                    var size=5;
                                    /*alert(size);*/
                                    for(var i=0;i<size;++i){
                                        $('#'+"tr-"+i).remove();
                                    }
                                    for(var i=0;i<result.length;++i){
                                        var id='tr-'+i;
                                        var msg="<tr id="+id+"><td>"+result[i].replyId+"</td><td>"
                                            +result[i].replyArticleId+"</td><td>"
                                            +result[i].replyUserName+"</td><td>"
                                            +result[i].replyText+"</td><td>"
                                            +result[i].replyGoodCount+"</td><td>"
                                            +result[i].replyBadCount+"</td><td><button class='btn btn-info' id="
                                            +result[i].replyId+" name="+i+" onclick='deleteUser(this.id,this.name)'>删除</button></td><tr>";
                                        $('#table1').append(msg);
                                    }
                                },
                                error:function(data){
                                    alert("failed to findByPage")
                                }
                            })
                        })
                    })

                </script>

                <script>
                    function deleteUser(id,name){
                        alert(id);
                        $.ajax({
                            type: 'get',
                            url: "${pageContext.request.contextPath}/reply/deleteById",
                            data: {
                                id: id
                            },
                            success: function(data){
                                alert("success");
                                new PNotify({
                                    title: 'Success!',
                                    text: '删除成功',
                                    type: 'success'
                                });
                                var t=$('#totalCount').val();
                                var totalCount=Number(t)-Number(1);
                                $('#totalCount').val(totalCount);
                                var size=5;
                                var totalPage=Math.ceil(totalCount/size);
                                $('#totalPage').val(totalPage);

                                $.ajax({
                                    type: 'get',
                                    url: "${pageContext.request.contextPath}/reply/findByPage",
                                    data:{
                                        currentPage: $('#pageCount').val(),
                                        size: 5
                                    },
                                    dataType: 'json',
                                    success:function(result){
                                        var size=5;
                                        /*alert(size);*/
                                        for(var i=0;i<size;++i){
                                            $('#'+"tr-"+i).remove();
                                        }

                                        for(var i=0;i<result.length;++i){
                                            var id='tr-'+i;
                                            var msg="<tr id="+id+"><td>"+result[i].replyId+"</td><td>"
                                                +result[i].replyArticleId+"</td><td>"
                                                +result[i].replyUserName+"</td><td>"
                                                +result[i].replyText+"</td><td>"
                                                +result[i].replyGoodCount+"</td><td>"
                                                +result[i].replyBadCount+"</td><td><button class='btn btn-info' id="
                                                +result[i].replyId+" name="+i+" onclick='deleteUser(this.id,this.name)'>删除</button></td><tr>";
                                            $('#table1').append(msg);
                                        }
                                    },
                                    error:function(data){
                                        alert("failed to findByPage")
                                    }
                                })
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
                                            <input type="text" placeholder="请输入要查找的回复的id" class="form-control"
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
                                            <tr><th>回复id</th><th>回复帖子的id</th><th>回复用户</th><th>回复内容</th><th>回复点赞数</th>
                                                <th>回复反对数</th>
                                            </tr>
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

                    <%--<%
                        Integer pageCount=(Integer)request.getAttribute("currentPage");
                    %>--%>

                    <c:when test="${msg=='2'}">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="well well-lg" style="background-color:white;">
                                        <table class="table" id="table1">
                                            <tr><th>回复id</th><th>回复帖子的id</th><th>回复用户</th><th>回复内容</th><th>回复点赞数</th>
                                                <th>回复反对数</th><th>操作</th>
                                            </tr>
                                            <c:forEach items="${replies}" var="reply" varStatus="status">
                                                <tr name="tr" id="tr-${status.index}">
                                                    <td>
                                                            ${reply.replyId}
                                                    </td>
                                                    <td>
                                                            ${reply.replyArticleId}
                                                    </td>
                                                    <td>
                                                            ${reply.replyUserName}
                                                    </td>
                                                    <td>
                                                            ${reply.replyText}
                                                    </td>
                                                    <td>
                                                            ${reply.replyGoodCount}
                                                    </td>
                                                    <td>
                                                            ${reply.replyBadCount}
                                                    </td>

                                                    <td>
                                                        <button class="btn btn-info"
                                                                id="${reply.replyId}" name="tr-${status.index}" onclick="deleteUser(this.id,this.name)">删除
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                    <input id="pageCount" value="${currentPage}" type="hidden">
                                    <input id="totalCount" value="${totalCount}" type="hidden">
                                    <input id="totalPage" value="${totalPage}" type="hidden">
                                    <ul class="pager">
                                        <li class="previous" id="up"><a href="#">上一页</a></li>
                                        <li class="next" id="down"><a href="#">下一页</a></li>
                                    </ul>
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
                    <%--<c:otherwise>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="well well-lg" style="background-color:white;">
                                        <div class="form-inline"> &lt;%&ndash;BootStrap让两个控件在一行显示&ndash;%&gt;
                                            <input type="text" placeholder="请输入要查找的用户名字" class="form-control"
                                                   style="width: 300px;" id="nameInput"/>
                                            <button class="btn btn-info pull-right" id="checkName1">查看</button>
                                        </div>
                                        <hr>
                                        <div class="form-inline"> &lt;%&ndash;BootStrap让两个控件在一行显示&ndash;%&gt;
                                            <input type="text" placeholder="请输入要查找的用户id" class="form-control"
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
                    </c:otherwise>--%>
                </c:choose>



            </div>
        </div>
    </div>
</div>


</body>
</html>
