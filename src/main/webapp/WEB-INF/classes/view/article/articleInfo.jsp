<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-6-4
  Time: 下午9:02
  To change this template use File | Settings | File Templates.
--%>
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
        <title>Gucci Gang论坛-帖子主页</title>
        <link rel="stylesheet" href="//apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
        <script src="//apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <%--<link href="https://cdn.bootcss.com/pnotify/3.2.1/pnotify.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/pnotify/3.2.1/pnotify.js"></script>--%>
        <link href="../resources/pnotify/pnotify.custom.min.css" rel="stylesheet" type="text/css">
        <script src="../resources/pnotify/pnotify.custom.min.js"></script>
    </head>
    <style>
        a{ text-decoration: none;}
        a:link{text-decoration: none;}
        a:hover{color: grey}
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
        /*body{
            margin-top: 80px;
            background-color: #303333;
        }*/
        html,body{
            width:100%;
            height:100%;
            padding-top: 40px;
        }
        body{
            font-family: "华文细黑";
            background:url("../../resources/image/0.jpg") no-repeat;
            background-attachment: fixed; /*固定背景不滑动*/
            background-size: 100%;
        }

        .box{
            background-color: #ffffff;
            border-radius: 3px;
            border-bottom: 1px solid darkgray;
        }

        .cell{
            background: #ffffff;
            padding: 10px;
            font-size: 14px;
            text-align: left;
            line-height: 120%;
            border-bottom: 1px solid gray;
        }

        .article_header{

            padding: 10px;
            font-size: 15px;
            line-height: 120%;
            text-align: left;
            border-bottom: 1px solid #e2e2e2;
            overflow: auto;
        }

        .fr {
            float: right;
            text-align: right;
        }

        .article_content {
            font-size: 14px;
            line-height: 1.6;
            color: #000;
            word-wrap: break-word;
        }

        div{
            display: block;
        }

        .topic_stats {
            text-shadow: 0 1px 0 #fff;
            font-size: 11px;
            color: #999;
            line-height: 100%;
        }

        .topic_buttons {
            padding: 5px;
            font-size: 14px;
            line-height: 120%;
            background: #eee;
            border-radius: 0 0 3px 3px;
            text-align: left;
        }

        .reply_content {
            font-size: 14px;
            line-height: 1.6;
            color: #000;
            word-break: break-all;
            word-wrap: break-word;
        }

        .mll {
            border-radius: 3px;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #ccc;
            display: block;
            width: 100%;
            height: 8em;
            overflow-y: auto;
            font-family: "Helvetica Neue","Luxi Sans","DejaVu Sans",Tahoma,"Hiragino Sans GB","Microsoft Yahei",sans-serif;
            resize: vertical;
            box-sizing: border-box;
        }

        .inner {
            padding: 10px;
            font-size: 14px;
            line-height: 150%;
            text-align: left;
        }

        button{outline: none;border: none}

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
            <div class="col-md-8 col-md-offset-2">
                <div class="box" style="border-bottom: 0px">
                    <div class="article_header">
                        <div class="fr">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/resources/image/${Article.articleUserName}.jpg"
                                     style="border-radius: 4px;" border="0" align="default" width="80px" height="80px">
                            </a>
                        </div>
                        <a href="/">首页</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="/block/block-${block.blockId}" style="color: grey">${block.blockName}</a>
                        <div style="height: 10px"></div>
                        <h2>${Article.articleTitle}</h2>
                        <small style="color: gray">
                            <a href="/#"><%--ostreamBaba--%>
                            ${Article.articleUserName}</a>&nbsp; ·  ${Article.articleBrowseCount}次浏览 &nbsp;
                        </small>
                    </div>
                    <div class="cell">
                        <div class="article_content">
                            <p>
                                ${Article.articleContent}
                            </p>
                        </div>
                    </div>

                    <script>

                        //利用事件冒泡机制 不要直接绑定在button上
                        $(document).ready(function(){
                            $('#commentBox').on('click','#good',function(){
                                alert("test");
                                /*console.log($('#bad').attr("disabled"));
                                if($('#bad').prop("disabled")){
                                    return;
                                }*/
                                if(!document.getElementById('bad')){
                                    return;
                                }
                                //alert('test');
                                $.ajax({
                                    type: 'get',
                                    url: "${pageContext.request.contextPath}/article/comment",
                                    data: {
                                        good: 1,
                                        articleId: "${Article.articleId}",
                                        articleType: "1",
                                        articleUserName: "${username}",
                                        articleAuthor: "${Article.articleUserName}"
                                    },
                                    dataType: "json",
                                    success:function(data){
                                        var msg=data;
                                        document.getElementById('good').setAttribute('style','color: darkorange;');
                                        document.getElementById('goodSpan').innerHTML=msg;
                                        $('#good').attr('id','goodChange');
                                        /*$('#good').attr('disabled','disabled');*/
                                        console.log(document.getElementById('goodChange'));
                                    },
                                    error:function(data){
                                        console.log(data);
                                        alert("failed to update");
                                    }
                                })/*////阻止冒泡上层click
                                event.stopPropagation();*/
                            });


                            $('#commentBox').on('click','#bad',function(){
                                /*console.log($('#good').attr("disabled"));
                                if($('#good').prop("disabled")){
                                    return;
                                }*/
                                if(!document.getElementById('good')){
                                    return;
                                }
                                //alert('test');
                                $.ajax({
                                    type: 'get',
                                    url: "${pageContext.request.contextPath}/article/comment",
                                    data: {
                                        bad: 1,
                                        articleId: "${Article.articleId}",
                                        articleType: "2",
                                        articleUserName: "${username}",
                                        articleAuthor: "${Article.articleUserName}"
                                    },
                                    dataType: "json",
                                    success:function(data){
                                        var msg=data;
                                        document.getElementById('bad').setAttribute('style','color: darkorange;');
                                        document.getElementById('badSpan').innerHTML=msg;
                                        $('#bad').attr('id','badChange');
                                        /* $('#bad').attr('disabled','disabled');*/
                                    },
                                    error:function(data){
                                        console.log(data);
                                        alert("failed to update");
                                    }
                                })/*////阻止冒泡上层click
                                event.stopPropagation();*/
                            });


                            $('#commentBox').on('click','#goodChange',function(){
                                    /*alert('test');*/
                                    /*console.log($('#bad').attr("disabled"));
                                    if($('#bad').prop("disabled")){
                                        return;
                                    }*/
                                    if(!document.getElementById('bad')){
                                        return;
                                    }
                                    //alert('test');
                                    $.ajax({
                                        type: 'get',
                                        url: "${pageContext.request.contextPath}/article/comment",
                                        data: {
                                            good: -1,
                                            articleId: "${Article.articleId}",
                                            articleType: "1",
                                            articleUserName: "${username}",
                                            articleAuthor: "${Article.articleUserName}"
                                        },
                                        dataType: "json",
                                        success:function(data){
                                            var msg=data;
                                            document.getElementById('goodChange').setAttribute('style','color: black');
                                            document.getElementById('goodChange').setAttribute('style','border: none');
                                            document.getElementById('goodSpan').innerHTML=msg;
                                            $('#goodChange').attr('id','good');
                                            /*$('#good').attr('disabled','disabled');*/
                                        },
                                        error:function(data){
                                            console.log(data);
                                            alert("failed to update");
                                        }
                                    })/*////阻止冒泡上层click
                                event.stopPropagation();*/
                                });


                            $('#commentBox').on('click','#badChange',function(){
                                /*console.log($('#good').attr("disabled"));
                                if($('#good').prop("disabled")){
                                    return;
                                }*/
                                if(!document.getElementById('good')){
                                    return;
                                }
                                //alert('test');
                                $.ajax({
                                    type: 'get',
                                    url: "${pageContext.request.contextPath}/article/comment",
                                    data: {
                                        bad: -1,
                                        articleId: "${Article.articleId}",
                                        articleType: "2",
                                        articleUserName: "${username}",
                                        articleAuthor: "${Article.articleUserName}"
                                    },
                                    dataType: "json",
                                    success:function(data){
                                        var msg=data;
                                        document.getElementById('badChange').setAttribute('style','color: black');
                                        document.getElementById('badChange').setAttribute('style','border: none');
                                        document.getElementById('badSpan').innerHTML=msg;
                                        $('#badChange').attr('id','bad');
                                        /* $('#bad').attr('disabled','disabled');*/
                                    },
                                    error:function(data){
                                        console.log(data);
                                        alert("failed to update");
                                    }
                                })/*////阻止冒泡上层click
                                event.stopPropagation();*/
                            });

                        })
                    </script>


                    <div class="cell" id="commentBox">
                        <button id="good" class="btn btn-default" style="border: none;outline: none">
                            <span class="glyphicon glyphicon-thumbs-up"></span>
                        </button>
                        <span style="font-size: 12px;color: darkorange;"  id="goodSpan">${Article.articleGoodCount}</span>
                        <button id="bad" class="btn btn-default" style="border: none;outline: none">
                            <span class="glyphicon glyphicon-thumbs-down"></span>
                        </button>
                        <span style="font-size: 12px;color: darkorange;" id="badSpan">${Article.articleBadCount}</span>
                        <%--<span class="pull-right">温馨提示：一旦点击，不可修改，请慎重</span>--%>
                    </div>
                    <div class="topic_buttons">
                        <div class="fr topic_stats" style="padding-top: 2px">${Article.articleBrowseCount}次浏览 &nbsp;</div>
                        <span style="font-size:12px; margin-left: 5px">人生苦短我选Python</span>
                    </div>
                </div>
               <c:if test="${replies!=null&&fn:length(replies)>0}">
                    <div style="height: 20px"></div>
                    <div class="box">
                        <div class="cell">
                                <span style="color: gray">
                                    ${Article.articleReplyCount} 回复 &nbsp;
                                    <strong style="color: #e2e2e2">|</strong>
                                    最后回复：
                                    ${Article.articleLastReplyTime}
                                </span>
                        </div>
                    </div>
                    <c:forEach items="${replies}" var="reply">
                        <div class="cell" id="replyModule-${reply.replyId}">
                            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tbody>
                                <tr>
                                    <td width="48px" valign="top" align="center" style="padding-top: 8px;border-radius: 3px">
                                        <img src="${pageContext.request.contextPath}/resources/image/${reply.replyUserName}.jpg" width="55px" height="55px"/>
                                    </td>
                                    <td width="15px"></td>
                                    <td width="auto" valign="top" align="left">
                                        <div style="height: 3px"></div>
                                        <strong><a href="/article/toInfo/article-${reply.replyUserName}" style="color: #808080;font-size: 10px">${reply.replyUserName}</a></strong>
                                        &nbsp;&nbsp;<span style="font-size: 11px;color: #cccccc">${reply.replyCreateTime}</span>
                                        <div style="height: 12px"></div>
                                        <div class="reply_content">
                                            ${reply.replyText}
                                        </div>
                                    </td>

                                    <%--这里有坑--%>
                                    <script>
                                           $(document).ready(function () {

                                               /*删除回复*/
                                               $('#'+"deleteReply-"+${reply.replyId}).click(function () {
                                                   $.ajax({
                                                       type: "get",
                                                       url: "/reply/delete?replyId=${reply.replyId}&articleId=${Article.articleId}",
                                                       success:function(data){

                                                           new PNotify({
                                                               title: 'Success!',
                                                               text: '删除成功！',
                                                               type: 'success'
                                                           });

                                                           if(data=='success'){
                                                               $('#'+"replyModule-"+${reply.replyId}).remove();
                                                           }
                                                       },
                                                       error:function (data) {
                                                           alert('error');
                                                       }
                                                   })
                                               });


                                               /*点击赞同*/
                                               $('#'+"goodFather-"+${reply.replyId}).on('click','#'+"good-"+${reply.replyId},function () {
                                                   if(!document.getElementById('bad-'+${reply.replyId})){
                                                       return;
                                                   }
                                                   $.ajax({
                                                       type: 'get',
                                                       url: "${pageContext.request.contextPath}/reply/comment",
                                                       data: {
                                                           good: "1",
                                                           articleId: ${Article.articleId},
                                                           replyId: ${reply.replyId},
                                                           replyUsername: "${username}",
                                                           replyType: "1",
                                                           replyAuthor: "${reply.replyUserName}"
                                                       },
                                                       dataType: "json",
                                                       success:function(data){
                                                           var msg=data;
                                                           document.getElementById('good-'+${reply.replyId}).setAttribute('style','color: darkorange;');
                                                           document.getElementById('goodSpan-'+${reply.replyId}).innerHTML=msg;
                                                           $('#'+"good-"+${reply.replyId}).attr('id','goodChange-'+${reply.replyId});
                                                           console.log(document.getElementById('goodChange-'+${reply.replyId}));
                                                       },
                                                       error:function(data){
                                                           console.log(data);
                                                           alert("failed to update");
                                                       }
                                                   })
                                               });

                                               /*点击反对*/
                                               $('#'+"badFather-"+${reply.replyId}).on('click','#'+"bad-"+${reply.replyId},function () {
                                                   if(!document.getElementById('good-'+${reply.replyId})){
                                                       return;
                                                   }
                                                   $.ajax({
                                                       type: 'get',
                                                       url: "${pageContext.request.contextPath}/reply/comment",
                                                       data: {
                                                           bad: "1",
                                                           articleId: ${Article.articleId},
                                                           replyId: ${reply.replyId},
                                                           replyUsername: "${username}",
                                                           replyType: "2",
                                                           replyAuthor: "${reply.replyUserName}"
                                                       },
                                                       dataType: "json",
                                                       success:function(data){
                                                           var msg=data;
                                                           document.getElementById('bad-'+${reply.replyId}).setAttribute('style','color: darkorange;');
                                                           document.getElementById('badSpan-'+${reply.replyId}).innerHTML=msg;
                                                           $('#'+"bad-"+${reply.replyId}).attr('id','badChange-'+${reply.replyId});
                                                           console.log(document.getElementById('badChange-'+${reply.replyId}));
                                                       },
                                                       error:function(data){
                                                           console.log(data);
                                                           alert("failed to update");
                                                       }
                                                   })
                                               });

                                               /*取消点赞*/
                                               $('#'+"goodFather-"+${reply.replyId}).on('click','#'+"goodChange-"+${reply.replyId},function(){
                                                   if(!document.getElementById('bad-'+${reply.replyId})){
                                                       return;
                                                   }
                                                   $.ajax({
                                                       type: 'get',
                                                       url: "${pageContext.request.contextPath}/reply/comment",
                                                       data: {
                                                           good: "-1",
                                                           articleId: ${Article.articleId},
                                                           replyId: ${reply.replyId},
                                                           replyUsername: "${username}",
                                                           replyType: "1",
                                                           replyAuthor: "${reply.replyUserName}"
                                                       },
                                                       dataType: "json",
                                                       success:function(data){
                                                           var msg=data;
                                                           document.getElementById('goodChange-'+${reply.replyId}).setAttribute('style','color: black');
                                                           document.getElementById('goodChange-'+${reply.replyId}).setAttribute('style','border: none');
                                                           document.getElementById('goodSpan-'+${reply.replyId}).innerHTML=msg;
                                                           $('#'+"goodChange-"+${reply.replyId}).attr('id','good-'+${reply.replyId});
                                                       },
                                                       error:function(data){
                                                           console.log(data);
                                                           alert("failed to update");
                                                       }
                                                   })
                                               });

                                               /*取消反对*/
                                               $('#'+"badFather-"+${reply.replyId}).on('click','#'+"badChange-"+${reply.replyId},function () {
                                                   if(!document.getElementById('good-'+${reply.replyId})){
                                                       return;
                                                   }
                                                   alert('test');
                                                   $.ajax({
                                                       type: 'get',
                                                       url: "${pageContext.request.contextPath}/reply/comment",
                                                       data: {
                                                           bad: "-1",
                                                           articleId: ${Article.articleId},
                                                           replyId: ${reply.replyId},
                                                           replyUsername: "${username}",
                                                           replyType: "2",
                                                           replyAuthor: "${reply.replyUserName}"
                                                       },
                                                       dataType: "json",
                                                       success:function(data){
                                                           var msg=data;
                                                           document.getElementById('badChange-'+${reply.replyId}).setAttribute('style','color: black');
                                                           document.getElementById('badChange-'+${reply.replyId}).setAttribute('style','border: none');
                                                           document.getElementById('badSpan-'+${reply.replyId}).innerHTML=msg;
                                                           $('#'+"badChange-"+${reply.replyId}).attr('id','bad-'+${reply.replyId});
                                                       },
                                                       error:function(data){
                                                           console.log(data);
                                                           alert("failed to update");
                                                       }
                                                   })
                                               });

                                           });

                                            /*测试传入id*/
                                            function xx(data) {
                                                console.log(data);
                                            }


                                    </script>


                                    <div id="replyButton">
                                        <c:if test="${username == reply.replyUserName}">
                                            <td width="50px" align="right" valign="middle">
                                                <button class="btn btn-default" style="border: none;outline: none"
                                                        id="deleteReply-${reply.replyId}">
                                                    <span class="glyphicon glyphicon-remove"></span>
                                                </button>
                                                <span style="font-size: 12px;margin-right: 10px">&nbsp;</span>
                                            </td>
                                        </c:if>
                                        <td width="50px" align="right" valign="middle" id="goodFather-${reply.replyId}">
                                            <button class="btn btn-default" style="border: none;outline: none" id="good-${reply.replyId}">
                                                <span class="glyphicon glyphicon-thumbs-up"></span>
                                            </button>
                                            <span style="font-size: 12px;color: darkorange;margin-right: 10px"
                                                  id="goodSpan-${reply.replyId}">${reply.replyGoodCount}</span>
                                        </td>
                                        <td width="50px" align="right" valign="middle" id="badFather-${reply.replyId}">
                                            <button class="btn btn-default" style="border: none;outline: none" id="bad-${reply.replyId}">
                                                <span class="glyphicon glyphicon-thumbs-down"></span>
                                            </button>
                                            <span style="font-size: 12px;color: darkorange;margin-right: 10px"
                                                  id="badSpan-${reply.replyId}">${reply.replyBadCount}</span>
                                        </td>
                                    </div>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>
                </c:if>
                <div style="height: 20px"></div>
                <div class="box">
                    <div class="cell">
                        <div class="fr">
                            <a href="#" onclick="xxx" style="color: grey">
                                <strong>↑</strong>
                                回到顶部
                            </a>
                        </div>
                        添加一条新的回复
                    </div>
                    <div class="cell">
                        <form action="/reply/new?replyArticleId=${Article.articleId}&replyUserName=${username}&replyType=3&articleUserName=${Article.articleUserName}" method="post">
                            <textarea name="replyText" maxlength="10000" class="mll" id="reply_content" style="overflow: hidden; word-wrap: break-word; resize: none; height: 112px;
                                outline: none"></textarea>
                            <div style="height: 10px"></div>
                            <div class="fr" style="color: grey">你的回复让世界变得更加美好</div>
                            <button class="btn btn-default btn-ms" style="outline: none" type="submit">回复</button>
                        </form>
                        <%--<form action="/reply/new?replyArticleId=${Article.articleId}&replyUserName=${username}&replyType=3&articleUserName=${Article.articleUserName}" method="post">
                            <textarea name="replyText" maxlength="10000" class="mll" id="reply_content" style="overflow: hidden; word-wrap: break-word; resize: none; height: 112px;
                                outline: none"></textarea>
                            <div style="height: 10px"></div>
                            <div class="fr" style="color: grey">你的回复让世界变得更加美好</div>
                            <button class="btn btn-default btn-ms" style="outline: none" type="submit">回复</button>
                        </form>--%>
                    </div>
                    <div class="inner">
                        <div class="fr">
                            <a href="/" style=" color: grey;">
                                <strong>←&nbsp;&nbsp;index</strong>
                            </a>
                        </div>
                    </div>
                    <span>&nbsp;</span>
                </div>
                <div style="height: 30px"></div>

            </div>
    </div>
        <c:if test="${fn:length(replyAlreadyComment)>0}">
            <c:forEach items="${replyAlreadyComment}" var="rac">
                <c:choose>
                    <c:when test="${rac.replyinfoType == '1'}">
                        <script>
                            $(document).ready(
                                function () {
                                    data=${rac.replyinfoReplyid};
                                    document.getElementById('good-'+data).setAttribute('style','color: darkorange;');
                                    $('#'+"good-"+data).attr('id','goodChange-'+data);
                                }
                            )
                        </script>
                    </c:when>
                    <c:when test="${rac.replyinfoType == '2'}">
                        <script>
                            $(document).ready(function () {
                                data=${rac.replyinfoReplyid};
                                document.getElementById('bad-'+data).setAttribute('style','color: darkorange;');
                                $('#'+"bad-"+data).attr('id','badChange-'+data);
                            })
                        </script>
                    </c:when>
                </c:choose>
            </c:forEach>
        </c:if>
        <%--<%
            ArticleInfo articleInfo=(ArticleInfo) request.getAttribute("articleInfo1");
            out.print(articleInfo.getArticleinfoArticletype());
        %>--%>

        <%--一个帖子不能点赞多次--%>
        <%--<c:out value="${articleInfoIsComment.articleinfoArticletype}"/>--%>
        <%--articleInfoIsComment不是数组 不能用fn:length--%>
        <c:if test="${articleInfoIsComment!=null}">
            <c:choose>
                <c:when test="${articleInfoIsComment.articleinfoArticletype == '1'}">
                    <script>
                        /*alert("test");*/
                        $(document).ready(
                            function () {
                                document.getElementById('good').setAttribute('style','color: darkorange;');
                                $('#good').attr('id','goodChange');
                            }
                        )
                    </script>
                </c:when>
                <c:when test="${articleInfoIsComment.articleinfoArticletype == '2'}">
                    <script>
                        $(document).ready(function () {
                            document.getElementById('bad').setAttribute('style','color: darkorange;');
                            $('#bad').attr('id','badChange');
                        })
                    </script>
                </c:when>
            </c:choose>
        </c:if>

</div>

</body>