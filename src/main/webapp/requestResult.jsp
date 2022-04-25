<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//"<span style='color:red'>V</span><br>"   << V로 체크한 부분은 중요. 기억해두기.
out.print(request.getContextPath()+"<span style='color:red'>V</span><br>");
out.print(request.getLocalAddr()+"<br>");
//내 ip 주소
out.print(request.getLocalName()+"<br>");
out.print(request.getLocalPort()+"<br>");
out.print(request.getLocale()+"<br>");
out.print(request.getMethod()+"<span style='color:red'>V</span><br>");
out.print(request.getQueryString()+"<span style='color:red'>V</span><br>");
out.print(request.getParameter("name")+"<span style='color:red'>V</span><br>");
out.print(request.getRemoteAddr()+"<span style='color:red'>V</span><br>");
//내 ip주소로 들어온 컴퓨터의 ip주소를 알 수 있음.
out.print(request.getRequestURI()+"<br>");
out.print(request.getRequestURL()+"<br>");
out.print(request.getHeader("referer")+"<br>");
String referer = request.getHeader("referer");
%>
<span style='color:red'><%=referer %></span>
</body>
</html>