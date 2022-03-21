# oi-spring-project

<img width="770" alt="스크린샷 2022-03-05 오후 9 52 16" src="https://user-images.githubusercontent.com/80494742/156883901-d34640e2-6bd2-4a0f-86a0-7a36ae48f703.png">


당근마켓에서 영감을 받은 거리 기반 중고 거래 웹 어플리케이션입니다.

<br />

# 역할 분배

[강현민](https://github.com/vkfkd420): 회원기능 , 공지사항  
[이욱창](https://github.com/wook95): 위치 기반 상품 기능, UI 전반  
[장혜민](https://github.com/hyemin386): 마이페이지  
[최연아](https://github.com/yeon-a-choi): 커뮤니티 게시판, 쪽지  
<br />


# 사용 기술

`개발 언어` : Java (version 11)  
`Back-End` : SpringBoot / Mybatis / Spring Security  
`Front-End` : JavaScript / jQuery / AJax / JSP  
`DBMS` : MariaDB  
`Web Server` : Apache Tomcat 9.0  
`프로젝트 관리` : Git  
`오픈 API` : 카카오주소 API, 카카오 지오코딩  


<br />

# ERD

<img width="752" alt="oi-erd" src="https://user-images.githubusercontent.com/80494742/156883906-4f542bbd-aa00-4fea-af39-47aed3a497ea.png">



# 기능

1. 회원 기능

   - 회원가입 / 로그인
     - 스프링 시큐리티를 이용한 인증 / 인가 구현
     - 이메일 인증기능
     - 카카오 주소 API 사용
   - 마이페이지
     - 회원정보 수정
     - 위시리스트 보기 및 삭제
     - 내가 올린 물건 보기, 내가 쓴 후기 보기

2. 거리 기반 물품 등록

   - 카카오 지오코딩을 기반으로 wgs84 좌표계와 mysql 함수를 통해 좌표계,거리 변환
   - 거리를 기준으로 상품 등록 및 sorting
   - 판매 완료시 이미지 변경

3. 쪽지 기능

   - 판매자와 구매자 간 쪽지를 통한 채팅 기능 구현

4. 리뷰 기능

   - 구매 및 판매 완료시 별점 부여 가능

5. 커뮤니티 기능
   - 게시판으로, 댓글, 대댓글, 내가쓴 댓글 삭제 기능
   - 페이지네이션 처리
   - 공지사항의 경우 spring security를 활용해 관리자만 수정,삭제,삽입 가능

<br />

