<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



  <header class="section section--second-header">
        <div class="inner inner--second">
            <div class="inner--left toggle--small">
                <div class="inner__dropdown">
                    <a href="#" class="dropbtn">
                       <sec:authentication property="principal.location"/>
                        <i class="bi bi-caret-right-fill"></i>
                    </a>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/mypage/village">동네 바꾸기</a>
                    </div>
                </div>
                <div class="inner__dropdown inner__dropdown--category">
                    <a href="#" class="dropbtn">
                        전체보기<i class="bi bi-caret-right-fill"></i>
                    </a>
                    <div class="dropdown-content dropdown--product-category">
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=1">디지털기기</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=2">생활가전</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=3">가구/인테리어</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=4">유아동</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=5">생활/가공식품</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=6">스포츠/레저</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=7">여성의류</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=8">남성의류</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=9">게임/취미</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=10">뷰티/미용</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=11">반려동물용품</a>
                        <a href="${pageContext.request.contextPath}/product/separatedList?categoryNum=12">도서/티켓/음반</a>
                    </div>
                </div>
            </div>
            <div class="inner__right toggle--small">
                
                <a href="${pageContext.request.contextPath}/product/insert">
                    <i class="bi bi-bag-check-fill"></i> 판매하기
                </a>


            </div>
            <button id="toggle-btn--village">
                <i class="bi bi-list"></i>
            </button>

        </div>

    </header>