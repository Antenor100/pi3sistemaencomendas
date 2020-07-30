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
			telaTitle: "Gerar e visualizar encomendas",
			ajudaModalBody: "Essa tela é destinada para a manipulação de encomendas."
		};
		</script>
		<jsp:include page="/resources/jsp/visual/telaAbaDescricao/telaAbaDescricao.jsp"/>	
		
		<div id="contentTela" style="flex-wrap: wrap" class="row p-0 m-3">
			<script type="text/javascript">
				<%!
					String tableName = "TCEENC";
					String[] columnsDescricao = new String[] {"Código", "Cod. Cliente", "Cod. Usu", "Endereço entrega", "Valor entrega", "Valor total", "Pago", "Somente cliente recebe", "Data Entrega", "Nome receptor", "Observação"};
					String[] columnsDataType = new String[] {"number", "number", "number", "text", "number", "number", "checkbox", "checkbox", "datetime-local", "text", "text"};
					String pkField = "ENCCODIGO";
					String servletClassName = "/CrudServlet";
					String jspName = "/telas/gerarEncomenda/gerarEncomenda.jsp";
					String pkFieldIsText = "false";
					
					CrudTableBO ctb = new CrudTableBO(tableName, columnsDescricao, columnsDataType, pkField, servletClassName, jspName, pkFieldIsText);	
				%>
				
				var tableObject = <%=ctb.getInitialJson(true)%>
				
				tableObject.contextPath = "<%=pageContext.getServletContext().getContextPath()%>";
				tableObject.onSelectRowFunction = function() {
					let whereConditionTable2 = 'IENCODIGOENC = ' + getSelectedRowPkValue();
					let whereConditionTable3 = 'ILDCODIGOENC = ' + getSelectedRowPkValue();
					
					document.getElementById("inputTable2").value = whereConditionTable2;
					document.getElementById("inputTable3").value = whereConditionTable3;
					document.getElementById("inputTableName2").value = "TCEIEN";
					document.getElementById("inputTableName3").value = "TCLILD";
					document.getElementById("selectedRowIndex").value = getSelectedRowIndex();
					
					document.getElementById("formSendTablesWhere").submit();
				};
						
				var erroService = `<%=(String) request.getAttribute("erro")%>`;
				if (erroService != undefined && erroService != "null") confirm("Ocorreu um erro na operação anterior: " + erroService);
			</script>
			<jsp:include page="/resources/jsp/visual/crudTable/crudTable.jsp"/>
			
			<script type="text/javascript">
				<%!
					String tableName2 = "TCEIEN";
					String[] columnsDescricao2 = new String[] {"Código", "Valor total produto", "Quantidade produtos", "Código produto", "Código encomenda"};
					String[] columnsDataType2 = new String[] {"number", "number", "number", "number", "number"};
					String pkField2 = "IENCODIGO";
					String servletClassName2 = "/CrudServlet";
					String jspName2 = "/telas/gerarEncomenda/gerarEncomenda.jsp";
					String pkFieldIsText2 = "false";
					
					CrudTableBO ctb2 = new CrudTableBO(tableName2, columnsDescricao2, columnsDataType2, pkField2, servletClassName2, jspName2, pkFieldIsText2);	
				%>
				
				var tableObject2 = <%=ctb2.getInitialJson(false)%>
				
				var valuesTable2 = <%=request.getAttribute("valuesTable2")%>
				if (valuesTable2 != undefined && valuesTable2 != null) tableObject2.values = valuesTable2.values;
				
				tableObject2.contextPath = "<%=pageContext.getServletContext().getContextPath()%>";
				tableObject2.crudTableName = "Produtos da encomenda";
				
				var erroService2 = `<%=(String) request.getAttribute("erro2")%>`;
				if (erroService2 != undefined && erroService2 != "null") confirm("Ocorreu um erro ao obter dados de uma subtabela: " + erroService2);	
			</script>
			<jsp:include page="/resources/jsp/visual/crudTable2/crudTable2.jsp"/>
			
			<script type="text/javascript">
				<%!
				String tableName3 = "TCLILD";
				String[] columnsDescricao3 = new String[] {"Código", "Dia", "Hora inicial", "Hora final", "Cod. Encomenda"};
				String[] columnsDataType3 = new String[] {"number", "date", "time", "time", "number"};
				String pkField3 = "ILDCODIGO";
				String servletClassName3 = "/CrudServlet";
				String jspName3 = "/telas/gerarEncomenda/gerarEncomenda.jsp";
				String pkFieldIsText3 = "false";
					
					CrudTableBO ctb3 = new CrudTableBO(tableName3, columnsDescricao3, columnsDataType3, pkField3, servletClassName3, jspName3, pkFieldIsText3);	
				%>
				
				var tableObject3 = <%=ctb3.getInitialJson(false)%>
				
				var valuesTable3 = <%=request.getAttribute("valuesTable3")%>
				if (valuesTable3 != undefined && valuesTable3 != null) tableObject3.values = valuesTable3.values;
				
				tableObject3.contextPath = "<%=pageContext.getServletContext().getContextPath()%>";
				tableObject3.crudTableName = "Horários de execução da encomenda";
						
				var erroService3 = `<%=(String) request.getAttribute("erro3")%>`;
				if (erroService3 != undefined && erroService3 != "null") confirm("Ocorreu um erro ao obter dados de uma subtabela: " + erroService3);	
				
				
				var selectedRowIndex = <%=request.getAttribute("selectedRowIndex")%>
				tableObject.selectedRowIndex = selectedRowIndex;
			
			</script>
			<jsp:include page="/resources/jsp/visual/crudTable3/crudTable3.jsp"/>
			
			<form id="formSendTablesWhere" action="<%=pageContext.getServletContext().getContextPath()%>/AgendaEncomendasServlet" method="post">
				<input id="inputTable2" style="display: none" name="whereConditionTableDois" type="text" value="">
				<input id="inputTable3" style="display: none" name="whereConditionTableTres" type="text" value="">
				<input id="inputTableName2" style="display: none" name="tableNameDois" type="text" value="">
				<input id="inputTableName3" style="display: none" name="tableNameTres" type="text" value="">
				<input id="selectedRowIndex" style="display: none" name="selectedRowIndex" type="text" value="">
			</form>
		</div>
	</div>
</html>