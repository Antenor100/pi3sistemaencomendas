<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/resources/jsp/visual/crudTable3/crudTable3.js" type="text/javascript"></script>

<div class="divGeral col-12">
	<div class="divCrudTableHeader row m-0" style="flex-wrap: wrap">
		<div class="col-12 divCrudTableTitle">
			<span id="titleCrudTable3"></span>
		</div>
		
		<script type="text/javascript">
			document.getElementById("titleCrudTable3").innerHTML = tableObject3.crudTableName;
		</script>

		<div id="divCrudButtons3" class="col-12 col-md-6">
			<button id="btnAdicionar3" class="btn btn-success" onclick="adicionar3()"><i class="fa fa-plus mr-2"></i>Adicionar</button>
			<button id="btnRemover3" class="btn btn-danger" onclick="remover3()"><i class="fa fa-minus mr-2"></i>Remover</button>
			<button id="btnEditar3" class="btn btn-primary" onclick="editar3()"><i class="fa fa-edit mr-2"></i>Editar</button>
			<button id="" class="btn btn-secondary" onclick="recarregar3()"><i class="fa fa-sync-alt"></i></button>
		</div>
		<div id="divFilterField3" class="col-12 col-md-6 d-flex justify-content-end form-group"> <!-- d-flex justify-content-end -->
			<select class="form-control mr-1" style="max-width: 300px" id="filterOptions3"></select>
			  
			<input id="filtroInput3" class="form-control" style="max-width: 300px" type="text" placeholder="Filtro dos registros">
		</div>
	</div>
	
	<div class="divTable col-12 p-0">
		<table class="table table-bordered table-hover table-sm table-responsive m-0">
		  <thead>
		    <tr id="tableHeadRow3"></tr>
		  </thead>
		  <tbody id="tableBody3"></tbody>
		</table>
	</div>
	
	<!-- Div que contem todos os modals do crudTable -->
	<div id="divModals3"></div>
</div>	

<script type="text/javascript">
	populaFilterSelect3();
	populaTabela3();
	vinculaListenerOnFilter3();
	desvinculaBotoes3();
</script>