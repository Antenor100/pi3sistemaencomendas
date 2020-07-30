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
			telaTitle: "Produtos",
			ajudaModalBody: "Essa tela é destinada para a criação de produtos."
		};
		</script>
		<jsp:include page="/resources/jsp/visual/telaAbaDescricao/telaAbaDescricao.jsp"/>	
		
		<div id="contentTela" class="row p-0 m-3">
			<script type="text/javascript">
				<%!
					String tableName = "TCEPRO";
					String[] columnsDescricao = new String[] {"Código", "Nome", "Descrição", "Valor", "Especificação de Unid.", "Gasto minutos de serviço"};
					String[] columnsDataType = new String[] {"number", "text", "text", "number", "text", "number"};
					String pkField = "PROCODIGO";
					String servletClassName = "/CrudServlet";
					String jspName = "/telas/produtos/produtos.jsp";
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