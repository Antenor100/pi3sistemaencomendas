<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/resources/jsp/visual/crudTable2/crudTable2.js" type="text/javascript"></script>

<div class="divGeral col-12">
	<div class="divCrudTableHeader row m-0" style="flex-wrap: wrap">
		<div class="col-12 divCrudTableTitle">
			<span id="titleCrudTable2"></span>
		</div>
		
		<script type="text/javascript">
			document.getElementById("titleCrudTable2").innerHTML = tableObject2.crudTableName;
		</script>
		
		<div id="divCrudButtons2" class="col-12 col-md-6">
			<button id="btnAdicionar2" class="btn btn-success" onclick="adicionar2()"><i class="fa fa-plus mr-2"></i>Adicionar</button>
			<button id="btnRemover2" class="btn btn-danger" onclick="remover2()"><i class="fa fa-minus mr-2"></i>Remover</button>
			<button id="btnEditar2" class="btn btn-primary" onclick="editar2()"><i class="fa fa-edit mr-2"></i>Editar</button>
			<button id="" class="btn btn-secondary" onclick="recarregar2()"><i class="fa fa-sync-alt"></i></button>
		</div>
		<div id="divFilterField2" class="col-12 col-md-6 d-flex justify-content-end form-group"> <!-- d-flex justify-content-end -->
			<select class="form-control mr-1" style="max-width: 300px" id="filterOptions2"></select>
			  
			<input id="filtroInput2" class="form-control" style="max-width: 300px" type="text" placeholder="Filtro dos registros">
		</div>
	</div>
	
	<div class="divTable col-12 p-0">
		<table class="table table-bordered table-hover table-sm table-responsive m-0">
		  <thead>
		    <tr id="tableHeadRow2"></tr>
		  </thead>
		  <tbody id="tableBody2"></tbody>
		</table>
	</div>
	
	<!-- Div que contem todos os modals do crudTable -->
	<div id="divModals2"></div>
</div>	

<script type="text/javascript">
	populaFilterSelect2();
	populaTabela2();
	vinculaListenerOnFilter2();
	desvinculaBotoes2();
</script>