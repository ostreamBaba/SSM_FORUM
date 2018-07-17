<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-5-30
  Time: 上午1:43
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

    <script>
        function createRequest(url) {
            http_request=null;
            if(window.XMLHttpRequest){
                http_request=new XMLHttpRequest();
            }else if(window.ActiveXObject){
                try{
                    http_request=new ActiveXObject("Msxml2.XMLHTTP");
                }catch(e){
                    try{
                        http_request=new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(e){
                        alert("出现异常");
                    }
                }
            }
            if(!http_request){
                return false;
            }
            http_request.onreadystatechange=getResult();
            http_request.open("GET",url,true);
            http_request.send(null);
        }
        function getResult() {
            if(http_request.readyState==4&&http_request.status==200){
                document.getElementById("").innerHTML=http_request.responseText;
            }else{
                alert("失败");
            }
        }
        function checkUser(userName){
            createRequest('/user/register?username='+userName.value);
        }

    </script>

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
        .line{
            border-bottom:1px solid greenyellow;
        }
        .register-top{
            margin-top: 70px;
        }
        .register-btn-top{
            margin-top: 20px;
        }

        html,body{
            width:100%;
            height:100%;
            padding-top: 70px;
        }
        body{
            font-family: "华文细黑";
            background:url("../../resources/image/reg.jpg") no-repeat;
            background-size: 100%;
        }
        .register-right{
            color: lawngreen;
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
                    <ul class="dropdown-menu">
                        <li><a href="#">jmeter</a></li>
                        <li><a href="#">EJB</a></li>
                        <li><a href="#">Jasper Report</a></li>
                        <li class="divider"></li>
                        <li><a href="#">分离的链接</a></li>
                        <li class="divider"></li>
                        <li><a href="#">另一个分离的链接</a></li>
                    </ul>
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
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <ol class="breadcrumb">
                <li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
                    <a href="/" itemprop="url">
                        <span itemprop="title">主页</span>
                    </a>
                </li>
                <li class="active">注册</li>
            </ol>
        </div>
    </div>

    <script>
        function checkEmail(){
            ERROR_EMAIL_EMPTY="电子邮箱为空";
            ERROR_EMAIL_FORMAT="电子邮箱格式错误";
            ERROR_EMAIL_EXIST="电子邮箱已被绑定";
            var emailValue=document.getElementById('email').value;
            var emailLength=emailValue.length;
            var emailError=null;
            var reg=/^([a-zA-Z0-9])+@([a-zA-Z0-9])+(\.[a-zA-Z]{2,4})+$/;
           /* console.log(emailValue);
            console.log(emailLength);*/
            if(emailLength==0){
                emailError=ERROR_EMAIL_EMPTY;
            }else if(!reg.test(emailValue)){
                emailError=ERROR_EMAIL_FORMAT;
            }
            if(emailError!=null){
                document.getElementById('emailError').innerHTML=emailError;
                return;
            }
            /*if(emailError!=null){
                document.getElementById('emailError').innerHTML=emailError;
                document.getElementById('checkEmailOk').style.display='none';
            }else{
                document.getElementById("emailError").innerHTML='';
                document.getElementById('checkEmailOk').style.display='block';
                isOK();
            }*/
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/user/checkEmail",
                data:$('#form-register').serialize(),
                success:function (data) {
                    var msg=data;
                    /*alert("success");*/
                    if(msg == 'exist'){
                        emailError=ERROR_EMAIL_EXIST;
                        document.getElementById('emailError').innerHTML=emailError;
                        document.getElementById('checkEmailOk').style.display='none';
                    }else{
                        document.getElementById("emailError").innerHTML='';
                        document.getElementById('checkEmailOk').style.display='block';
                        isOK();
                    }
                },
                error:function (data) {
                    alert("邮箱验证失败！！");
                }
            });

        }
    </script>

    <div class="row register register-top">
        <div class="col-md-2"></div>
        <div class="col-md-6">
            <form action="/user/register" class="form-horizontal" id="form-register" name="form-register" role="form" method="post" onload="isOK();">
                <div class="form-group  has-feedback">
                    <label for="email" class="col-lg-4 control-label" >电子邮箱</label>
                    <div class="col-lg-8">
                        <input type="email" class="form-control" placeholder="请输入电子邮箱地址" id="email" name="email"
                        onblur="checkEmail()">
                        <span id="emailError" style="color: red;"></span>
                        <span class="glyphicon form-control-feedback glyphicon-ok register-right" id="checkEmailOk"
                            style="display: none"></span>
                        <%--<span id="emailError" style="color: red"></span>--%>
                        <span class="help-block">默认情况下,电子邮箱是不会被公开的</span>
                    </div>
                </div>
                <%--test ajax--%>

                <%--<script>
                    $(document).ready(function(){
                        $("button").click(function(){
                            alert("test");
                            $.ajax({
                                type:'post',
                                url:'${pageContext.request.contextPath}/user/register',
                                data:'username=123',
                                success:function(data){
                                    alert("成功");
                                },
                                error:function(data) {
                                    alert("失败");
                                }
                            });
                        });
                    });
                </script>--%>


                <%--检测用户名--%>

                <script>
                    function checkName(){
                        /*alert("test");*/
                        ERROR_NAME_EMPTY="请输入用户名";
                        ERROR_NAME_SHORT='输入名字太短';
                        ERROR_NAME_LONG='输入名字太长';
                        ERROR_NAME_FORMAT='输入名字格式错误';
                        ERROR_NAME_REPEAT='该用户名已存在';
                        var nameValue=document.getElementById("username").value;
                        var nameLenght=nameValue.length;
                        /* var uPatten=/^[a-zA-Z0-9]$/;*/
                        /*var reg=/^[0-9]{8}$/;*/
                        var reg=/^[0-9a-zA-Z]+$/;
                        var nameFormatError=null;
                        if(nameLenght==0){
                            nameFormatError=ERROR_NAME_EMPTY;
                        } else if(nameLenght<6){
                            nameFormatError=ERROR_NAME_SHORT;
                        }else if(nameLenght>15){
                            nameFormatError=ERROR_NAME_LONG;
                        }else if(!reg.test(nameValue)){
                            nameFormatError=ERROR_NAME_FORMAT;
                        }
                        if(nameFormatError!=null){
                            document.getElementById('exist').innerHTML=nameFormatError;
                            document.getElementById('checkNameOk').style.display='none';
                            /*alert(document.getElementById('checkNameOk').style.display);*/
                            return;
                        }
                        $.ajax({
                            type:"post",
                            url:'${pageContext.request.contextPath}/user/check',
                            data: $('#form-register').serialize(),
                            success:function(data){
                                var msg=data;
                                console.log(msg);
                                if(msg == 'exist'){
                                    document.getElementById('exist').innerHTML=ERROR_NAME_REPEAT;
                                    document.getElementById('checkNameOk').style.display='none';
                                }else{
                                    document.getElementById('checkNameOk').style.display='block';
                                    document.getElementById('exist').innerHTML='';
                                    isOK();
                                }
                            },
                            error:function(data) {
                                alert("失败");
                                console.log(data);
                            }}
                        );
                    };
                </script>



                <div class="form-group  has-feedback">
                    <label for="username" class="col-lg-4 control-label" >用户名</label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control" placeholder="请输入用户名" id="username" name="username"
                        onblur="checkName()">
                        <span class="glyphicon form-control-feedback glyphicon-ok register-right" id="checkNameOk"
                        style="display: none"></span>
                        <span id="exist" style="color: red"></span> <%-- 对用户名进行检测--%>
                        <span></span>
                        <span class="help-block">请输入6-12位英文,用户名唯一</span>
                    </div>
                </div>

                <%--test onblur--%>

                <%--<script type="text/javascript">
                    function upperCase()
                    {
                        var x=document.getElementById("fname").value
                        document.getElementById("fname").value=x.toUpperCase()
                    }
                </script>
                输入您的姓名：
                <input type="text" id="fname" onblur="upperCase()" />--%>

                <script>
                    function checkPassword(){
                        ERROR_PASSWORD_EMPTY="密码不能为空";
                        ERROR_PASSWORD_SHORT="密码太短了";
                        ERROR_PASSWORD_LONG="密码太长了";
                        ERROR_PASSWORD_PORMAT="密码不符合要求";
                        var passwordValue=document.getElementById('password').value;
                        var passwordError=null;
                        var reg=/^[a-zA-Z0-9]+$/;
                        var passwordLenth=passwordValue.length;
                        if(passwordLenth==0){
                            passwordError=ERROR_PASSWORD_EMPTY;
                        }else if(passwordLenth<6){
                            passwordError=ERROR_PASSWORD_SHORT;
                        }else if(passwordLenth>16){
                            passwordError=ERROR_PASSWORD_LONG;
                        }else if(!reg.test(passwordValue)){
                            passwordError=ERROR_PASSWORD_PORMAT;
                        }
                        if(passwordError!=null){
                            document.getElementById('passwordError').innerHTML=passwordError;
                            document.getElementById('checkPasswordOk').style.display="none";
                        }else{
                            document.getElementById('passwordError').innerHTML=' ';
                            document.getElementById('checkPasswordOk').style.display="block";
                            isOK();
                        }
                    }

                </script>

                <div class="form-group  has-feedback">
                    <label for="password" class="col-lg-4 control-label" >密码</label>
                    <div class="col-lg-8">
                        <input type="password" class="form-control" placeholder="请输入密码" id="password" name="password"
                        onblur="checkPassword()">
                        <span class="glyphicon form-control-feedback glyphicon-ok register-right" id="checkPasswordOk"
                        style="display: none"></span>
                        <span id="passwordError" style="color: red"></span>
                        <span class="help-block">您的密码长度不少于6位,不接受特殊字符输入</span>
                    </div>
                </div>

                <script>
                    function checkPasswordAgain() {
                        ERROR_PASSWORD_NOSAME="两次密码输入不同";
                        ERROR_PASSWORD_EMPTY="密码不能为空";
                        var pd1=document.getElementById("password").value;
                        var pd2=document.getElementById("checkPd").value;
                        var pd2Lenght=pd2.length;
                        /*console.log(pd1);
                        console.log(pd2);*/
                        if(pd2Lenght==0){
                            /*alert(pd2Lenght);
                            console.log(pd2Lenght);*/
                            document.getElementById("passwordErrorAgain").innerHTML=ERROR_PASSWORD_EMPTY;
                            document.getElementById('checkPasswordAgainOk').style.display="none";
                        }else if(pd1!=pd2){
                            document.getElementById("passwordErrorAgain").innerHTML=ERROR_PASSWORD_NOSAME;
                            document.getElementById('checkPasswordAgainOk').style.display="none";
                        }else{
                            document.getElementById("passwordErrorAgain").innerHTML='';
                            document.getElementById('checkPasswordAgainOk').style.display="block";
                            isOK();
                        }
                    }
                </script>

                <div class="form-group  has-feedback">
                    <label for="checkpd" class="col-lg-4 control-label" >密码</label>
                    <div class="col-lg-8">
                        <input type="password" class="form-control" placeholder="确认密码" id="checkPd" name="checkPd"
                        onblur="checkPasswordAgain()">
                        <span class="glyphicon form-control-feedback glyphicon-ok register-right" id="checkPasswordAgainOk"
                        style="display: none" ></span>
                        <span id="passwordErrorAgain" style="color: red;"></span>
                    </div>
                </div>


                <script>

                    /*全部符合要求即可进行注册*/

                    function isOK(){
                        /*alert("test isok");*/
                        var t1=document.getElementById('checkEmailOk').style.display;
                        var t2=document.getElementById('checkNameOk').style.display;
                        var t3=document.getElementById('checkPasswordOk').style.display;
                        var t4=document.getElementById('checkPasswordAgainOk').style.display;
                        /*console.log(t1);
                        console.log(t2);
                        console.log(t3);
                        console.log(t4);*/
                        if(t1=='block'&&t2==t1&&t3==t2&&t4==t3){
                            /*alert("test");*/
                           /* document.getElementById('register').classList.remove("active");*/
                           /* var s="register";*/
                            $('#register').removeAttr("disabled");
                        }
                    };
                </script>

                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8 register-btn-top">
                        <button class="btn btn-primary btn-lg btn-block" id="register" type="submit" disabled="disabled">立即注册</button>
                    </div>
                </div>
            </form>

        </div>
    </div>

</div>

</body>
</html>
