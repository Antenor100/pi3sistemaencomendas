<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/jsp/visual/telaAbaDescricao/telaAbaDescricao.css" type="text/css" rel="stylesheet">

<div id="divTelaAbaDescricao" class="container-fluid border-2 border-primary geral">
	<div class="row d-flex flex-nowrap m-0">
		<div class="col-12 bg-primary header d-flex justify-content-center">
			<span id="telaTitulo"></span>
			<script type="text/javascript">
				let spanTituloInput = document.getElementById("telaTitulo");
				spanTituloInput.innerHTML = telaAbaDescricaoProperties.telaTitle;
			</script>
			
			<!-- Icones do canto -->
			<div class="divIcons">
				
				<!-- Btn help -->
				<div id="btnHelp">
					<i class="fa fa-question mr-3" data-toggle="tooltip" data-placement="bottom" title="Ajuda"></i>
				</div>
				
				<!-- Importa fonte do modal, seta propriedades e cria novo modal no click do botão -->
				<script src="${pageContext.request.contextPath}/resources/js/visual/modal.js" type="text/javascript"></script>
				<script type="text/javascript">	
					document.getElementById("btnHelp").addEventListener("click", function() {
						novoModal({
							idModalParent: "divTelaAbaDescricao",
							title: "Informações da tela " + telaAbaDescricaoProperties.telaTitle,
							body: telaAbaDescricaoProperties.ajudaModalBody,
							okFunction: undefined,
							cancelFunction: undefined,
							showBtnOk: false,
							btnOkLabel: "",
							showBtnCancel: true,
							btnCancelLabel: "Fechar",
							closeOnOK: true
						});
					});
				</script>
				
				<!-- Btn close -->
				<script type="text/javascript">
					function sairFunction() {
						let indexTelaAnterior = JSON.parse(localStorage.getItem("telasAcessadas")).length -2;
						
						if (indexTelaAnterior < 0) {
							window.open(JSON.parse(localStorage.getItem("telasAcessadas"))[0], "_self");
						} else {		
							let arrayTelas = JSON.parse(localStorage.getItem("telasAcessadas"));
							arrayTelas.splice(arrayTelas.length - 1);
			    			localStorage.setItem("telasAcessadas", JSON.stringify(arrayTelas));
			    			
			    			window.open(JSON.parse(localStorage.getItem("telasAcessadas"))[indexTelaAnterior], "_self");
						}
					}
				</script>
				<div onclick="sairFunction()">				
					<i class="fa fa-times mr-1" data-toggle="tooltip" data-placement="bottom" title="Sair" style="margin-top: 5px;"></i>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var intervalTelaAbaDescricao = setInterval(function() {
		let contentTela = document.getElementById("contentTela");
		let divTelaAbaDescricao = document.getElementById("divTelaAbaDescricao");
	
		if (contentTela != undefined) {
			divTelaAbaDescricao.append(contentTela);
			paraIntervalTelaAbaDescricao();	
		}
	}, 100);
	
	intervalTelaAbaDescricao;
	
	function paraIntervalTelaAbaDescricao() {
		clearInterval(intervalTelaAbaDescricao);
	}
</script>