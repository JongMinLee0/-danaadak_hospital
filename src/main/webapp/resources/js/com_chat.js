var charRoomId = '';
var chatSender = '';
var chatme = '';
$(document).ready(function(){
	var id = $('#userId').val();
	// 처음 생성된 방은 메세지가 없는 것으로 했는데 이것은 나중에 시간이 없는 방으로 고치면 될 듯.
	if($('body > div.comm_body > div.content_wrap > div table tbody tr.message_wrap td').text() == ''){
		$('body > div.comm_body > div.content_wrap > div table tbody tr.message_wrap td').text('새로 생성된 대화 입니다.');
	}
	connect(id);
	
	
	
});


var sock = new SockJS("/hos/ws-stomp");
var ws = Stomp.over(sock);
var reconnect = 0;
// 기존의 roomId와 sender 또한 밖에서 설정했는데
// localStorage를 사용하지 않아 document 안으로 넣었다.

//메시지를 받을 때
function recvMessage(recv) {
	var send = recv.type == 'ENTER' ? '[알림]':recv.sender;
	var message = recv.message;
	var time = recv.time.substring(11, 17);
	var temp = time.split("시");
	var temp2 = temp[0]+":"+temp[1];
	
	var id = recv.roomId;
	// 실시간으로 채팅 변경
	// 접속이 아닐때
	if(recv.type != 'ENTER'){
		$('#'+id).text(recv.message);
		$('#'+id).next().text(recv.time);
	}
}


//소켓 연결
function connect(id) {
    // pub/sub event
    ws.connect({}, function(frame) {
        ws.subscribe("/sub/chat/room/"+id, function(message) {
            var recv = JSON.parse(message.body);
            recvMessage(recv);
        });
        ws.send("/pub/chat/message", {}, JSON.stringify({type:'ENTER', roomId:id, sender:id}));
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