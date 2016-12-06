<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <header role="main-header">
    <div class="container"> 
         
      <!-- socil Icon -->
      <c:choose>
      <c:when test="${sessionScope.login.member_id eq null }" >
       <%-- <c:when test="${empty session.getAttribute(LOGIN)}"> --%>
      <%--  <c:when test="${empty memberVo}"> --%>
     <h1><a href="/" title="F.M.S(FootBall Managerment Solution)"><img src="/html/images/logo.png" alt="F.M.S(FootBall Managerment Solution)"/></a> </h1>
       <ul role="socil-icons">
        <li><a href="/member_login" title="로그인"><i class="fa fa-sign-in" aria-hidden="true"></i><label style="margin-left: 10px;">로그인</label></a></li>
        <li><a href="/member_regist" title="회원가입"><i class="fa fa-user" aria-hidden="true"></i><label style="margin-left: 10px;">회원가입</label></a></li>
      </ul>
       </c:when>
       <c:when test="${sessionScope.login.member_num eq 1 }" >
       <%-- <c:when test="${empty session.getAttribute(LOGIN)}"> --%>
      <%--  <c:when test="${empty memberVo}"> --%>
     <h1><a href="/schedule/listAll" title="F.M.S(FootBall Managerment Solution)"><img src="/html/images/logo.png" alt="F.M.S(FootBall Managerment Solution)"/></a> </h1> 
       <ul role="socil-icons">
       <li><label style="color: white; font-size: 15px;">${sessionScope.login.member_id} 관리자님  환영합니다!</label>
        <li><a href="/member/member_mypage?member_id=${sessionScope.login.member_id}" title="마이페이지"><i class="fa fa-street-view" aria-hidden="true"></i><label style="margin-left: 10px;">마이페이지</label></a></li>
        <li><a href="/admin/member_list" title="관리자페이지"><i class="fa fa-user-secret" aria-hidden="true"></i><label style="margin-left: 10px;">관리자 페이지</label></a></li>
        <li><a href="/member/member_logout" title="로그아웃"><i class="fa fa-sign-out" aria-hidden="true"></i><label style="margin-left: 10px;">로그아웃</label></a></li>
      </ul>
       </c:when>
       <c:otherwise>
      <h1><a href="/schedule/listAll" title="F.M.S(FootBall Managerment Solution)"><img src="/html/images/logo.png" alt="F.M.S(FootBall Managerment Solution)"/></a> </h1>
       <ul role="socil-icons">
       <li><label style="color: white; font-size: 15px;">${sessionScope.login.member_id}님  환영합니다!</label>
        <li><a href="/member/member_mypage?member_id=${sessionScope.login.member_id}" title="마이페이지"><i class="fa fa-street-view" aria-hidden="true"></i><label style="margin-left: 10px;">마이페이지</label></a></li>
        <li><a href="/member/member_logout" title="로그아웃"><i class="fa fa-sign-out" aria-hidden="true"></i><label style="margin-left: 10px;">로그아웃</label></a></li>
      </ul>
       </c:otherwise>
       </c:choose>
    </div>
  </header>
  
  
