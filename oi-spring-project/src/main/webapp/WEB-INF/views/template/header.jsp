<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <header class="section">
                <div class="inner clearfix">
                        <div class="menu-group float--left">
                            <div class="logo">
                                <a href="#">github</a>
                            </div>
                            <ul class="main-menu toggle">
                                <li><a href="#">동네 생활</a></li>
                                <li><a href="#">내 근처</a></li>
                            </ul>
                        </div>


                        <div class="sign-group float--right toggle">
                            <div class="btn-group">
                                <a href="#" class="mybtn sign-in">로그인</a>
                                <a href="#" class="mybtn mybtn--primary sign-up">회원가입</a>
                            </div>
                            <form id="search-form" action="#" method="POST">
                                <input id="search" type="text" class="input--text" placeholder="물품명을 검색해보세요!">
                                <input type="submit" value="submit">
                            </form>
                            <ul class="sub-menu">
                                <li><a href="#">채팅</a></li>
                                <li><a href="#">나의 당근</a></li>
                                <li><a href="#">판매하기</a></li>
                            </ul>
                        </div>

                        <div id="toggle-btn">Header Menu Toggle Button</div>
                        <!-- <div class="clearfix" style="clear: both;">
                                    (토글버튼)
                        </div> -->
                    </div>
        </header>