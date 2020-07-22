<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%


response.setContentType("text/html; charset=UTF-8");
PrintWriter  writer  = response.getWriter();
writer.println("나의 찜 목록에 추가되었습니다.");
writer.flush();




%>