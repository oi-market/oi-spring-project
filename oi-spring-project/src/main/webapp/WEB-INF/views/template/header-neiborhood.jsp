<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




 <header class="section section--second-header">
        <div class="inner inner--second">
            <div class="inner--left toggle--small">
                <div class="inner__dropdown">
                    <a href="#" class="dropbtn">
                        철산 1동<i class="bi bi-caret-right-fill"></i>
                    </a>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/mypage/village">동네 바꾸기</a>
                    </div>
                </div>
                <div class="inner__dropdown inner__dropdown--category">
                    <a href="#" class="dropbtn">
                        전체보기<i class="bi bi-caret-right-fill"></i>
                    </a>
                    <div class="dropdown-content">
                        <a href="#">같이 해요</a>
                        <a href="#">동네 질문</a>
                        <a href="#">해주세요</a>
                        <a href="#">동네 맛집</a>
                        <a href="#">일상</a>
                        <a href="#">기타</a>
                    </div>
                </div>
            </div>
            <div class="inner__right toggle--small">
                
                <a href="${pageContext.request.contextPath}/neighborhood/insert">
                    <i class="bi bi-pencil-fill"></i> 글쓰기
                </a>
                <form id="search-form--village" action="#" method="POST">
                    <input id="search" type="text" class="input--text" placeholder="동네 정보를 검색하세요!">
                    <input type="submit" value="submit">
                </form>

            </div>
            <button id="toggle-btn--village">
                <i class="bi bi-list"></i>
            </button>

        </div>

    </header>
