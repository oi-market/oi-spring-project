<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


 <header class="section section--second-header">
        <div class="inner inner--second">
            <div class="inner--left toggle--small">
                <div class="inner__dropdown">
                    <a href="#" class="dropbtn">
                    	<!-- session에 있는 주소값 가져오기            
                        <sec:authentication property="principal.location"/>-->
                        ${cutLocation}
                        <i class="bi bi-caret-right-fill"></i>
                    </a>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/mypage/village">동네 바꾸기</a>
                    </div>
                </div>
                <div class="inner__dropdown inner__dropdown--category">
                    <a href="#" class="dropbtn">
                        카테고리<i class="bi bi-caret-right-fill"></i>
                    </a>
                    <div class="dropdown-content">
                    	<a href="../neighborhood/board">전체보기</a>
                        <a href="../neighborhood/board?categoryNum=1">같이 해요</a>
                        <a href="../neighborhood/board?categoryNum=2">동네 질문</a>
                        <a href="../neighborhood/board?categoryNum=3">해주세요</a>
                        <a href="../neighborhood/board?categoryNum=4">동네 맛집</a>
                        <a href="../neighborhood/board?categoryNum=5">일상</a>
                        <a href="../neighborhood/board?categoryNum=6">기타</a>
                    </div>
                </div>
            </div>
            <div class="inner__right toggle--small">
                
                <a href="${pageContext.request.contextPath}/neighborhood/insert">
                    <i class="bi bi-pencil-fill"></i> 글쓰기
                </a>
                <form id="search-form--village" action="./board">
                    <input id="search2" name="search" type="text" class="input--text" 
                    placeholder="동네 정보를 검색하세요!" value="">
                    <input type="hidden" name="curPage" value="1" id="curPage">
                    <input type="hidden" name="categoryNum" id="categoryNum" value="0">
                    <input type="submit" value="submit">
                </form>

            </div>
            <button id="toggle-btn--village">
                <i class="bi bi-list"></i>
            </button>

        </div>

    </header>
