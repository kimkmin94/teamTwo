<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 오픈채팅</title>

<style>
[v-cloak] {
	display: none;
}

.openChat2 {
	width: 100%;
	display: inline-block;
	vertical-align: top;
	text-align: center;
}

.quitRoombtn {
	border: 2px solid white;
	border-radius: 5px;
	background-color: white;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	width: 102px;
	line-height: 25px;
}

.sendChatbtn {
	border: 2px solid palegoldenrod;
	border-radius: 5px;
	background-color: palegoldenrod;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	width: 102px;
	line-height: 25px;
}

.sendChatbtn:hover {
	color: #4d593e;
}

.form-control {
	display: inline-block;
	height: 21px;
	width: 200px;
}

.list-group {
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>
	
	<div class="openChat2">
		<div class="container" id="app" v-cloak>
			<div class="row">
				<div class="col-md-6">
					<div
						style="font-family: 'yg-jalnan'; margin-top: 20px; font-size: 25px; display: inline-block;">
						{{roomName}}
						<div class="badge"
							style="font-size: 18px; border-radius: 70%; background-color: palegoldenrod; display: inline-block;">
							<div style="height: 30px; width: 30px; text-align: center;">{{userCount}}</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 text-right">
					<a class="quitRoombtn" @click="quitRoom('QUIT')">채팅방 나가기</a>
				</div>
			</div>

			<input type="text" class="form-control" v-model="message"
				v-on:keypress.enter="sendMessage('TALK')" placeholder="채팅내용을 입력하세요">
			<div class="input-group-append" style="display: inline-block;">
				<button class="sendChatbtn" type="button"
					@click="sendMessage('TALK')">보내기</button>
			</div>

			<div class="list-group"
				style="border: 3px solid palegoldenrod; border-radius: 10px; width: 800px; height: 800px; overflow: auto; margin: auto; margin-top: 30px;">
				<div class="list-group-item"
					style="margin-top: 5px; text-align: left;"
					v-for="message in messages">
					<div style="margin-top: 13px">{{message.sender}} -
						{{message.message}}</div>
				</div>
			</div>
		</div>
	</div>
	<!-- JavaScript -->
	<script src="/webjars/vue/2.5.16/dist/vue.min.js"></script>
	<script src="/webjars/axios/0.17.1/dist/axios.min.js"></script>
	<script src="/webjars/sockjs-client/1.1.2/sockjs.min.js"></script>
	<script src="/webjars/stomp-websocket/2.3.3/stomp.min.js"></script>
	<script>
        //alert(document.title);
        // websocket & stomp initialize
        var sock = new SockJS("/km-websocket");
        var ws = Stomp.over(sock);
        
        // vue.js
        var vm = new Vue({
            el: '#app',
            data: {
                roomId: '',
                roomName: '',
                sender: '',
                message: '',
                messages: [],
                userCount: 0
            },
            created() {
                this.roomId = localStorage.getItem('wschat.roomId');
                this.roomName = localStorage.getItem('wschat.roomName');
                this.sender = localStorage.getItem('wschat.sender');
                this.findRoom();
                var _this = this;
                ws.connect({}, function(frame) {
                    ws.subscribe("/sub/chat/room/"+_this.roomId, function(message) {
                        var recv = JSON.parse(message.body);
                        _this.recvMessage(recv);
                    });
             
                    ws.send("/pub/chat/message", {}, JSON.stringify({type:'ENTER', roomId:_this.roomId, sender:_this.sender}));
                    
                }, function(error) {
                	alert("서버 연결에 실패 하였습니다. 다시 접속해 주십시요.");
                    location.href="/chat/room";
                });
            },
            methods: {
                findRoom: function() {
                    axios.get('/chat/room/'+this.roomId).then(response => { this.room = response.data; });
                },
                sendMessage: function() {
                    ws.send("/pub/chat/message", {}, JSON.stringify({type:'TALK', roomId:this.roomId, sender:this.sender, message:this.message}));
                    this.message = '';
                },
                recvMessage: function(recv) {
                	this.userCount = recv.userCount;
                    this.messages.unshift({"type":recv.type,"sender":recv.sender,"message":recv.message})
                },
                quitRoom: function(){
                	ws.send("/pub/chat/message", {}, JSON.stringify({type:'QUIT', roomId:this.roomId, sender:this.sender}));
                    location.href="/chat/room";
                 
                }
            }
        });


    </script>
	<div>
		<%@ include file="/WEB-INF/views/teamtwo/footer.jsp"%>
	</div>
</body>
</html>