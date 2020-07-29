<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="${pageContext.request.contextPath}/resources/jsp/visual/crudTable/crudTable.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/jsp/visual/crudTable/crudTable.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/visual/modal.js" type="text/javascript"></script>

<div class="divGeral col-12">
	<div class="divCrudTableHeader row m-0" style="flex-wrap: wrap">
		<div id="divCrudButtons" class="col-12 col-md-6">
			<button id="btnAdicionar" class="btn btn-success" onclick="adicionar()"><i class="fa fa-plus mr-2"></i>Adicionar</button>
			<button id="btnRemover" class="btn btn-danger" onclick="remover()"><i class="fa fa-minus mr-2"></i>Remover</button>
			<button id="btnEditar" class="btn btn-primary" onclick="editar()"><i class="fa fa-edit mr-2"></i>Editar</button>
			<button id="" class="btn btn-secondary" onclick="recarregar()"><i class="fa fa-sync-alt"></i></button>
		</div>
		<div id="divFilterField" class="col-12 col-md-6 d-flex justify-content-end form-group"> <!-- d-flex justify-content-end -->
			<select class="form-control mr-1" style="max-width: 300px" id="filterOptions"></select>
			  
			<input id="filtroInput" class="form-control" style="max-width: 300px" type="text" placeholder="Filtro dos registros">
		</div>
	</div>
	
	<div class="divTable col-12 p-0">
		<table class="table table-bordered table-hover table-sm table-responsive m-0">
		  <thead>
		    <tr id="tableHeadRow"></tr>
		  </thead>
		  <tbody id="tableBody"></tbody>
		</table>
	</div>
	
	<!-- Div que contem todos os modals do crudTable -->
	<div id="divModals"></div>
</div>	

<script type="text/javascript">
	populaFilterSelect();
	populaTabela();
	vinculaListenerOnFilter();
	desvinculaBotoes();
</script>