<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 오픈채팅</title>

<style>
.listDa {
	position: relative;
	vertical-align: super;
}

@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

[v-cloak] {
	display: none;
}

.roomItem {
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	display: inline-block;
	
}

.openChat1 {
	width: 100%;
	display: inline-block;
	vertical-align: top;
	text-align: center;
	margin-top: 50px;
}

.makeRoombtn {
	border: 2px solid palegoldenrod;
	border-radius: 5px;
	background-color: palegoldenrod;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	width: 102px;
	line-height: 25px;
}

.makeRoombtn:hover {
	color: #4d593e;
}
</style>
</head>
<body>
	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>

	<div class="openChat1">
		<div class="container" id="app" v-cloak>

			<div class="input-group">

				<input style="display: inline-block; height:21px; width:200px;" type="text"
					class="form-control" v-model="room_name"
					v-on:keyup.enter="createRoom" placeholder="방제목을 입력하세요">
				<div class="input-group-append" style="display: inline-block;">
					<button class="makeRoombtn" type="button" @click="createRoom">채팅방
						개설</button>
				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
					<div
						style="font-family: 'yg-jalnan'; margin-top: 20px; font-size: 25px;">오픈채팅방
						목록</div>
				</div>
			</div>

				<div class="list-group-item" style="display:inline-block; margin-right: 20px; line-height: 100px; background-color: #fcf0c9; border-radius: 10px; padding:20px; " 
					v-for="item in chatrooms" v-bind:key="item.roomId"
					v-on:click="enterRoom(item.roomId, item.name)">
					<div class="roomItem" >
						{{item.name}}<span class="badge" style="border-radius: 70%; background-color: palegoldenrod; padding:10px; ">{{item.userCount}}</span>
					</div>
				</div>
			
		</div>
	</div>
	<!-- JavaScript -->
	<script src="/webjars/vue/2.5.16/dist/vue.min.js"></script>
	<script src="/webjars/axios/0.17.1/dist/axios.min.js"></script>
	<script>
        var vm = new Vue({
            el: '#app',
            data: {
                room_name : '',
                chatrooms: []
            },
            created() {
                this.findAllRoom();
            },
            methods: {
                findAllRoom: function() {
                    axios.get('/chat/rooms').then(response => { this.chatrooms = response.data; });
                },
                createRoom: function() {
                    if("" === this.room_name) {
                        alert("방 제목을 입력해 주십시요.");
                        return;
                    } else {
                        var params = new URLSearchParams();
                        params.append("name",this.room_name);
                        params.append("nickname",'${user_nickname}');
                        axios.post('/chat/room', params)
                        .then(
                            response => {
                                alert(response.data.name+"방 개설에 성공하였습니다.")
                                var roomName = this.room_name;
                                this.room_name = '';
                                this.findAllRoom();
                                var sender = '${user_nickname}';
                                var roomId = response.data.roomId;
                        		
                                if(sender != "") {
                                    localStorage.setItem('wschat.sender',sender);
                                    localStorage.setItem('wschat.roomId',roomId);
                                    localStorage.setItem('wschat.roomName',roomName);
                                    location.href="/chat/room/enter/"+roomId;
                                }
                            }
                        )
                        .catch( response => { alert("채팅방 개설에 실패하였습니다."); } );
                    }
                },
                enterRoom: function(roomId, roomName) {
                	
                    var sender = '${user_nickname}';
                    if(sender != "") {
                        localStorage.setItem('wschat.sender',sender);
                        localStorage.setItem('wschat.roomId',roomId);
                        localStorage.setItem('wschat.roomName',roomName);
                        location.href="/chat/room/enter/"+roomId;
                    }
                }
            }
        });
    </script>
    <div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>