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
			telaTitle: "Parâmetros",
			ajudaModalBody: "Essa tela é destinada para a criação de parâmetros."
		};
		</script>
		<jsp:include page="/resources/jsp/visual/telaAbaDescricao/telaAbaDescricao.jsp"/>	
		
		<div id="contentTela" class="row p-0 m-3">
			<script type="text/javascript">
				<%!
					String tableName = "TGCPAR";
					String[] columnsDescricao = new String[] {"Nome", "Tipo", "Descrição", "Valor", "Ultima Alteração", "Cod. Usu ultima alteração"};
					String[] columnsDataType = new String[] {"text", "text", "text", "text", "datetime-local", "number"};
					String pkField = "PARNOME";
					String servletClassName = "/CrudServlet";
					String jspName = "/telas/parametros/parametros.jsp";
					String pkFieldIsText = "true";
					
					CrudTableBO ctb = new CrudTableBO(tableName, columnsDescricao, columnsDataType, pkField, servletClassName, jspName, pkFieldIsText);	
				%>
				
				var tableObject = <%=ctb.getInitialJson(true)%>
				tableObject.mostraBotaoAdicionar = false;
				tableObject.mostraBotaoRemover = false;
				
				tableObject.contextPath = "<%=pageContext.getServletContext().getContextPath()%>";
						
				var erroService = `<%=(String) request.getAttribute("erro")%>`;
				if (erroService != undefined && erroService != "null") confirm("Ocorreu um erro na operação anterior: " + erroService);
				
			</script>
			<jsp:include page="/resources/jsp/visual/crudTable/crudTable.jsp"/>
		</div>
	</div>
</html>