<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/home/home.jsp"/>	
	</head>
	
	<div id="content">
		<script type="text/javascript">
		var telaAbaDescricaoProperties = {
			telaTitle: "Usuários",
			ajudaModalBody: "Essa telas é destinada para a criação de usuários."
		};
		</script>
		<jsp:include page="/resources/jsp/visual/telaAbaDescricao/telaAbaDescricao.jsp"/>	
		
		<div id="contentTela" class="row p-0 m-3">
			<script type="text/javascript">
				var tableObject = {
					columns: ["idusu", "nomeusu", "senhausu", "emailusu", "tipoUsu"],
					columnsDescricao: ["Código", "Nome", "Senha", "Email", "Desc. Tipo Usuário"],
					columnsDataType: ["integer", "text", "text", "password", "text"],
					pkField: "idusu",
					descriptionField: "nomeusu",
					registros: [
						["1", "antenor", "1324", "antenor@gmail.com", "Gerente"],
						["2", "meire", "4321", "meire@gmail.com", "Administrador"],
						["3", "caua", "6548", "caua@gmail.com", "Produção"],
						["4", "miguel", "7894", "miguel@gmail.com", ""],
					]
				};
			</script>
			<jsp:include page="/resources/jsp/visual/crudTable/crudTable.jsp"/>
		</div>
	</div>
</html>