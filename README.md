# -danaadak_hospital

<br />

# 다나앗닥
- 병원 예약과 정보 공유를 위한 웹서비스.
- 자세한 사항은 [report] 폴더에서 확인 가능합니다.
<img src="/report/main.png" style="width: 500px; height: 350px" />

<br />

# Project Function
로그인 기능 – 일반 회원, 병원 회원, 관리자 로그인이 가능하다.
              스프링 시큐리티를 이용하여 권한을 확인하여 로그인 되며,
              접근할 수 있는 페이지가 제한된다.
              
              
회원가입 기능 – 일반 회원, 병원 회원의 회원가입이 분리되어 있다.
               회원가입시 전화번호 인증을 통해 개인확인을 한다.
               Kakao 아이디를 이용하여 회원가입을 진행하면 Kakao아이디
               로 로그인이 가능하다. 병원 회원가입시 관리자의 승인이 있어야 한다.
               
               
병원 및 약국 찾기 – Kakao Map을 이용 병원과 약국을 찾을 수 있으며, 병원
                   에 예약이 가능하다. 검색이 가능하고 화면의 가운데에
                   표시되게 했다.
                   
                   
예약하기 – 병원에 예약을 할 수 있고 취소 또한 가능하다. 해당 시간에 다른진료가 있는 경우 진료예약을 할 수 없다. 진료를 받을 경우
           해당하는 병원이 처방전을 써줄수 있으며 진료완료를 해줄수 있다.
           
           
후기작성 – 진료가 완료된 예약에 한해서 해당 진료 및 병원에 대한 후기를
           작성할 수 있으며, 수정 및 삭제가 가능하다.
           
           
1:1대화 – 후기를 작성한 사람에게 궁금한 것을 물어보고 싶을 경우 대화를
         신청할 수 있고 채팅이 가능해진다.
         
         
공지사항 – 공지사항은 관리자만 올릴 수 있고 수정 및 삭제가 가능하다.


마이페이지 – 개인정보 및 프로필 사진 수정이 가능하다. 자신의 진료내역과
             처방전 내역, 작성한 후기등을 확인할 수 있다.
             
             
이벤트 – 병원에서는 이벤트를 작성할 수 있으며 관리자가 확인 할 수 있다.


<br />

# Project Structure
<img src="/report/structure.png" style="width: 500px; height: 350px" />

<br />

# Development Environment
<img src="/report/environment.png" style="width: 500px; height: 350px" />

<br />

# Contributor
- 이종민
- 홍은설
- 이예은
- 양지수
- 조형원



[report]: <https://github.com/JongMinLee0/danaadak_hospital/tree/master/report>
