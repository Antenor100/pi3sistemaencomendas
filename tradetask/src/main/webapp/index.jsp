<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="cabecalho.jsp"/>
		<h1>Bem vindo</h1>
		<%= "Seu sucesso garantido..." %>
		
		<form action="receberNome.jsp">
			<input id="nome" name="nome" type="text">
			<input type="submit" value="Enviar">
		</form>
		
		<%session.setAttribute("curso", "Curso de JSP"); %>
		
		<br>
		<h3>tag custom</h3>
		<%@ taglib prefix="myprefix" uri="WEB-INF/tagCursoJsp.tld" %>
		<myprefix:minhatag/>
	<jsp:include page="rodape.jsp"/>
</body>
</html>