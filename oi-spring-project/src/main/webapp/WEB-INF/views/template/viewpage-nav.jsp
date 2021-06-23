<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  

    <nav class="sidebar-menu  col-12 col-md-12 col-lg-3">
                 <ul>
                    <li class="profile">
                        <a href="${pageContext.request.contextPath}/viewPage/viewProfile?username=${memberVO.username}">프로필</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/viewPage/viewPurchase-sell?username=${memberVO.username}">상품</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/viewPage/viewReview?username=${memberVO.username}">후기</a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/viewPage/viewVillage-list?username=${memberVO.username}">동네생활 글</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/viewPage/viewVillage-comment?username=${memberVO.username}">동네생활 댓글</a>
                    </li>


                </ul>
             </nav>
