<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <nav class="sidebar-menu  col-12 col-md-12 col-lg-3">
                 <ul>
                    <li class="profile">
                        <a href="${pageContext.request.contextPath}/mypage/profile">프로필</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/mypage/purchase-sell">상품</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/mypage/review">후기</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/mypage/village">내 동네 설정</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/mypage/village-list">동네생활 글</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/mypage/village-comment">동네생활 댓글</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/mypage/modify">계정 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/mypage/password">비밀번호</a>
                    </li>
                </ul>
             </nav>
