<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="${pageContext.request.contextPath}/resources/jsp/visual/crudTable/crudTable.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/jsp/visual/crudTable/crudTable.js" type="text/javascript"></script>

<div class="divGeral col-12">
	<div class="divCrudTableHeader row m-0">
		<div id="divCrudButtons" class="col-12 col-md-9">
			<button class="btn btn-success"><i class="fa fa-plus mr-2"></i>Adicionar</button>
			<button class="btn btn-danger"><i class="fa fa-minus mr-2"></i>Remover</button>
			<button class="btn btn-primary"><i class="fa fa-edit mr-2"></i>Editar</button>
			<button class="btn btn-secondary"><i class="fa fa-sync-alt"></i></button>
		</div>
		<div id="divFilterField" class="col-12 col-md-3 d-flex justify-content-end">
			<input type="text" placeholder="Filtro dos registros">
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
</div>	

<script type="text/javascript">
	populaTabela();
</script>