<%@page import="br.com.encomanager.controllers.crudtable.CrudTableBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/home/home.jsp"/>	
	</head>
	
	<div id="content">
		<script type="text/javascript">
		var telaAbaDescricaoProperties = {
			telaTitle: "Tipo de usuário e acessos",
			ajudaModalBody: "Essa tela é destinada para a manipulação dos tipos de usuários e seus acessos."
		};
		</script>
		<jsp:include page="/resources/jsp/visual/telaAbaDescricao/telaAbaDescricao.jsp"/>	
		
		<div id="contentTela" class="row p-0 m-3">
			<script type="text/javascript">
				<%!
					String tableName = "TGCTUS";
					String[] columnsDescricao = new String[] {"Código", "Descrição"};
					String[] columnsDataType = new String[] {"number", "text"};
					String pkField = "TUSCODIGO";
					String servletClassName = "/CrudServlet";
					String jspName = "/telas/tipoUsuarioAcesso/tipoUsuarioAcesso.jsp";
					String pkFieldIsText = "false";
					
					CrudTableBO ctb = new CrudTableBO(tableName, columnsDescricao, columnsDataType, pkField, servletClassName, jspName, pkFieldIsText);	
				%>
				
				var tableObject = <%=ctb.getInitialJson(true)%>
				
				tableObject.contextPath = "<%=pageContext.getServletContext().getContextPath()%>";
						
				var erroService = `<%=(String) request.getAttribute("erro")%>`;
				if (erroService != undefined && erroService != "null") confirm("Ocorreu um erro na operação anterior: " + erroService);
				
			</script>
			<jsp:include page="/resources/jsp/visual/crudTable/crudTable.jsp"/>
		</div>
	</div>
</html>