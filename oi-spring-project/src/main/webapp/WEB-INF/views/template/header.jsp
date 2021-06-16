<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
    <header class="section">
                <div class="inner clearfix">
                        <div class="menu-group float--left">
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/">oi</a>
                            </div>
                            <ul class="main-menu toggle">
                                <li><a href="#">동네 생활</a></li>
                                <li><a href="#">내 근처</a></li>
                            </ul>
                        </div>


                        <div class="sign-group float--right toggle">
                            <div class="btn-group">
                        		<sec:authorize access="!isAuthenticated()">
                                <a href="${pageContext.request.contextPath}/member/sign-in" class="mybtn sign-in">로그인</a>
                                <a href="${pageContext.request.contextPath}/member/sign-up" class="mybtn mybtn--primary sign-up">회원가입</a>
<%--                                 <a href="#" class="mybtn mybtn--primary sign-up">로그아</a> --%>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_ADMIN')">	
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">

								<a href="${pageContext.request.contextPath}/member/memberLogout" type="button" class="mybtn sign-in">로그아웃</a>
								</sec:authorize>

                            </div>
                            <form id="search-form" action="#" method="POST">
                                <input id="search" type="text" class="input--text" placeholder="물품명을 검색해보세요!">
                                <input type="submit" value="submit">
                            </form>
                            <sec:authorize access="isAuthenticated()">
                            <ul class="sub-menu">
                                <li><a href="#">채팅</a></li>
                                <li><a href="${pageContext.request.contextPath}/mypage/profile">나의 오이</a></li>
                                <li><a href="#">판매하기</a></li>
                            </ul>
                            </sec:authorize>
                        </div>

                        <div id="toggle-btn">Header Menu Toggle Button</div>
                        <!-- <div class="clearfix" style="clear: both;">
                                    (토글버튼)
                        </div> -->
                    </div>
        </header>