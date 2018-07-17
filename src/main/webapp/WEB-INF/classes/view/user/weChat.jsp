<%--
  Created by IntelliJ IDEA.
  User: ios666
  Date: 18-6-20
  Time: 上午12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="//apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="../resources/js/websocket/js/sockjs.min.js"></script>
    <script src="../resources/js/websocket/js/stomp.js"></script>
</head>

<script>
    $('#chatForm').submit(function(e){
        var textArea=$('#chatForm').find('textarea[name="text"]');
        var text=textArea.val();
        
        textArea.val(' ');
    })

    var sock=new SockJS("/endpointChat");
    var stomp=sock.over(sock);
    //连接两个用户
    stomp.connecte('guest','guest',function(frame){
        stomp.subscribe("",handleNofication);
    });
    
    function handleNofication(message){
        $('#output').append("<b>received: "+message.body+"</b></br>");
    }

    function sendSpittle(text) {
        stomp.send("",{},text);
    }


</script>


<body>
    <div class="container">
        <div class="row">
            <form id="chatForm">
                <textarea rows="4" cols="60" name="text"></textarea>
                <button type="submit">发送</button>
            </form>
        </div>
        <div id="output"></div>
    </div>
</body>
</html>
