# oi-spring-project

당근마켓에서 영감을 받은 거리 기반 중고 거래 웹 어플리케이션입니다.

# 역할 분배

강현민: 회원기능 , 공지사항  
이욱창: 위치 기반 상품 기능, UI  
장혜민: 마이페이지  
최연아: 커뮤니티 게시판, 쪽지

# 사용 기술

운영체제 : Window10 64bit & MAC  
DBMS : MariaDB (Mysql)  
Web Server : Apache Tomcat 9.0  
개발 언어 : Java (version 11)  
Front-End-Skill : HTML5 / CSS/ JavaScript / jQuery / AJax / JSP
FrameWork : SpringBoot / Mybatis / Spring Security  
프로젝트 관리 : Git  
오픈 API : 카카오주소 API, 카카오 지오코딩  
개발 기간 : 4주 소요

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

   - 카카오 지오코딩을 기반으로 wgs84 좌표계를 이용, 거리를 기준으로 상품 등록 및 sorting
   - 판매 완료시 이미지 변경

3. 쪽지 기능

   - 판매자와 구매자 간 쪽지를 통한 채팅 기능 구현

4. 리뷰 기능

   - 거래 완료시 별점 부여 가능
   -

5. 커뮤니티 기능
   - 게시판으로, 댓글, 대댓글, 내가쓴 댓글 삭제 기능
   - 페이지네이션 처리
   - 공지사항의 경우 spring security를 활용해 관리자만 수정,삭제,삽입 가능
