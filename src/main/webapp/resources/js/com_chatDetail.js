var charRoomId = '';
var chatSender = '';
var chatme = '';
$(document).ready(function(){
	/*
	 GET 방식에서 URL 지워주는 건데 지워버리면 값이 없어서 새로고침시 값을 가지고 오지 않아 주석처리 해놓았다.
	 history.replaceState({}, null, location.pathname);
	 */
	// hidden으로 지정한 값을 받아온다.
	chatRoomId = $('#roomId').val();
	chatSender = $('#sender').val();
	
	connect();
	
	$("#comment").keyup(function(key) {
		if (key.keyCode == 13) {
			if (!key.shiftKey){
				sendMessage();
			}else{
				key.preventDefault();
			}
		}
	});
	
	// 방 나가기 클릭
	$('body > div.comm_body > div.content_wrap > div > div:nth-child(3) > a:nth-child(3) > span').on('click', function(){
		
	});
	

	// 스크롤 최하단으로 이동시키기 위함
	$("#message_box").scrollTop($("#message_box")[0].scrollHeight);
});


// 소켓 설정 및 연결
var sock = new SockJS("/hos/ws-stomp");
var ws = Stomp.over(sock);
var reconnect = 0;
// 기존의 roomId와 sender 또한 밖에서 설정했는데
// localStorage를 사용하지 않아 document 안으로 넣었다.

// 메시지 보내기
function sendMessage(){
	  ws.send("/pub/chat/message", {}, JSON.stringify({type:'TALK', roomId:chatRoomId, sender:chatSender, message:$('#comment').val()}));
      $('#comment').val('');
}

//메시지를 받을 때
function recvMessage(recv) {
	var send = recv.type == 'ENTER' ? '[알림]':recv.sender;
	var message = recv.message;
	var time = recv.time.substring(11, 17);
	var temp = time.split("시");
	var temp2 = temp[0]+":"+temp[1];
	
	if(send==chatSender){
		$('#message_box > ul').append('<li class="list-group-item me"><p>'+send+'</p><span>'
				+temp2+'</span><div class="alert alert-warning">'+
				message+'</div></li>');
	}else{
		$('#message_box > ul').append('<li class="list-group-item opponent"><p>'+
				send+'</p><div class="alert alert-light">'+
				message+'</div><span>'+temp2+'</span></li>');
	}
	
	// 스크롤 최하단으로 이동시키기 위함
	$("#message_box").scrollTop($("#message_box")[0].scrollHeight);

}


// 소켓 연결
function connect() {
    // pub/sub event
    ws.connect({}, function(frame) {
        ws.subscribe("/sub/chat/room/"+chatRoomId, function(message) {
            var recv = JSON.parse(message.body);
            recvMessage(recv);
        });
        ws.send("/pub/chat/message", {}, JSON.stringify({type:'ENTER', roomId:chatRoomId, sender:chatSender}));
    }, function(error) {
        if(reconnect++ <= 5) {
            setTimeout(function() {
                console.log("connection reconnect");
                sock = new SockJS("/hos/ws-stomp");
                ws = Stomp.over(sock);
                connect();
            },10*1000);
        }
    });
}





