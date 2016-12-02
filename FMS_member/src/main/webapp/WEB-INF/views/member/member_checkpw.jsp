<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	String member_passwd = request.getParameter("member_passwd");
	String repasswd = request.getParameter("repasswd");
%>
<%=(member_passwd.equals(repasswd)) %>