<jsp:useBean id="calcula" class="views.beans.BeanCursoJsp" type="views.beans.BeanCursoJsp" scope="page"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String nomeRequest = "Nome recebido: ";
		out.print(nomeRequest + request.getParameter("nome")); 
	%>
	
	<%! 
		int count = 2;
	
		public static int retorna (int n) {
			return n*2;
		}
	%>
	
	<%= count %>
	<br>
	<%= retorna(8) %>
	<br>
	<%= request.getContentLength() %>
	<!--response.sendRedirect("https://www.youtube.com");-->
	<br>
	<%="seu estado é: " + application.getInitParameter("estado") %>
	<br>
	<%= session.getAttribute("curso") %>
	<br>
	<%@ page import="java.util.Date" %>
	
	<%= "Data de hoje: " + new Date() %>
	<br>
	<%@ page info="Pagina do curso de JSP" %>
	<!-- Usar no servlet getServletInfo() -->
	<br>
	<h2>Erros</h2>
	<%@ page errorPage="errorPage.jsp" %>
	
	<%! 
		public static void lancaErro() {
			int oi = 100/0;
		} 
	%>
	
	<button id="btnErro" onClick="">Lança Erro</button>
	
	<br>
	<h4>Usar bean</h4>
	<%= calcula.calcula(20) %>
	
</body>
</html>