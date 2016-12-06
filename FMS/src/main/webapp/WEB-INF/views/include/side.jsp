<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <aside role="siderbar-nav" class="side-bar">
  <c:choose>
      <c:when test="${sessionScope.login.member_id eq null }" >
      <nav>
       <ul>
        <li class="active"><a href="/" title="Home"><i class="fa fa-home" aria-hidden="true"></i></a></li>
        <li><a href="/schedule/listAll" title="스케쥴"><i class="fa fa-calendar" aria-hidden="true"></i></a></li>
        <li><a href="/board/board_list"  title="게시판"><i class="fa fa-files-o" aria-hidden="true"></i></a></li>
        <li><a href="/member_list" title="멤버리스트"><i class="fa fa-user" aria-hidden="true"></i></a></li>
      </ul>
      </nav>
       </c:when>
        <c:when test="${sessionScope.login.member_num eq 1 }" >
         <nav>
       <ul>
        <li class="active"><a href="/schedule/listAll" title="Home"><i class="fa fa-home" aria-hidden="true"></i></a></li>
        <li><a href="/schedule/listAll" title="스케쥴"><i class="fa fa-calendar" aria-hidden="true"></i></a></li>
        <li><a href="/board/board_list"  title="게시판"><i class="fa fa-files-o" aria-hidden="true"></i></a></li>
        <li><a href="/vote" title="투표"><i class="fa fa-thumbs-up" aria-hidden="true"></i></a></li>
        <li><a href="/formation" title="포메이션"><i class="fa fa-arrows-alt fa-fw" aria-hidden="true"></i></a></li>
        <li><a href="/formationList" title="포메이션 리스트"><i class="fa fa-soccer-ball-o" aria-hidden="true"></i></a></li>
        <li><a href="/member_list" title="멤버리스트"><i class="fa fa-user" aria-hidden="true"></i></a></li>
        <li><a href="/admin/member_list" title="관리자 멤버"><i class="fa fa-users" aria-hidden="true"></i></a></li>
      </ul>
      </nav>
        </c:when>
       <c:otherwise>
     <nav>
       <ul>
        <li class="active"><a href="/schedule/listAll" title="Home"><i class="fa fa-home" aria-hidden="true"></i></a></li>
        <li><a href="/schedule/listAll" title="스케쥴"><i class="fa fa-calendar" aria-hidden="true"></i></a></li>
        <li><a href="/board/board_list"  title="게시판"><i class="fa fa-files-o" aria-hidden="true"></i></a></li>
        <li><a href="/vote" title="투표"><i class="fa fa-thumbs-up" aria-hidden="true"></i></a></li>
        <li><a href="/formationList" title="포메이션 리스트"><i class="fa fa-soccer-ball-o" aria-hidden="true"></i></a></li>
        <li><a href="/member_list" title="멤버리스트"><i class="fa fa-user" aria-hidden="true"></i></a></li>
      </ul>
        </nav>
       </c:otherwise>
       </c:choose>
  </aside>    
  
  