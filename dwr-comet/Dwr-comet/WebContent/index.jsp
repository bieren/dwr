<html>
<head>
<title>starting page</title>
<script type="text/javascript" src="./dwr/engine.js"></script>
<script type="text/javascript" src="./dwr/util.js"></script>
<script type="text/javascript" src="./dwr/interface/Message.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript">
	var chatlog = "";
	function sendMessage() {
		var message = $("#message").val();
		var user = $("#user").val();
		Message.addMessage(user, message);
	}
	function receiveMessages(messages) {
		var lastMessage =  messages;
		chatlog = "<div>" + lastMessage + "</div>" + chatlog;

		dwr.util.setValue("list", chatlog, {
			escapeHtml : false
		});
	}
	
	//读取name值作为推送的唯一标示
    function onPageLoad(){
        var userId = getQueryString("name");
        Message.onPageLoad(userId);
     }

    //获取url中的参数
    function getQueryString(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	    var r = window.location.search.substr(1).match(reg);
	    if (r != null) return unescape(r[2]); return null;
    }

    $(document).ready(function(){
    	dwr.engine.setActiveReverseAjax(true);
    	dwr.engine.setNotifyServerOnPageUnload(true);
    	onPageLoad();
    	}); 

</script>
</head>
<body>
	user:<br/>
	<input id="user" type="text" /><br/>
	input message:<br/>
	<input id="message" type="text" value="hey" />
	<input type="button" value="send" onclick="sendMessage()" />
	<br>
	<div id="list"></div>
</body>
</html>