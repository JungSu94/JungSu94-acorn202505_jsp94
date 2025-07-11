<%@page import="test.util.DbcpBean"%>
<%@page import="java.util.List"%>
<%@page import="test.Dao.MemberDao"%>
<%@page import="test.Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. 회원 목록을 MemberDao 객체를 이용해서 얻어낸다
MemberDao dao= new MemberDao();
List<MemberDto> list= dao.selectAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Member/list.jsp</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/member/insertform.jsp">회원 추가</a>
	<h2>회원 목록</h2>
		<table border="1">
   			<tr>
      			<th>번호</th>
   		  	    <th>이름</th>
      			<th>주소</th>
    		</tr> 		   				
   		 <%
        for(MemberDto dto : list){
   		 %>
  		    <tr>
        		<td><%= dto.getNum() %></td>
       		 	<td><%= dto.getName() %></td>
      			<td><%= dto.getAddr() %></td>
      			<td><a href="updateform.jsp?num=<%=dto.getNum() %>">수정</a></td>
      			<td><a href="${pageContext.request.contextPath}/member/delete.jsp?num=<%=dto.getNum() %>">삭제</a></td>
   			</tr>
   		<%}%>
		</table>
</body>
</html>