<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/resources/jsp/importadorDependencias.jsp"/>
		
		<title>Encomanager</title>
		
		<link href="${pageContext.request.contextPath}/home/home.css" type="text/css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath}/home/home.js" type="text/javascript"></script>
    	
    	<script type="text/javascript">
	    	var intervalTelasAcessadas = setInterval(function() {
	    		if (document.getElementById("linkHome") != undefined) {
		    		if (window.location.href.includes(document.getElementById("linkHome").getAttribute("href"))) {
		    			localStorage.setItem("telasAcessadas", JSON.stringify([document.getElementById("linkHome").getAttribute("href")]));
		    		} else {
			    		if (localStorage.getItem("telasAcessadas") == undefined) localStorage.setItem("telasAcessadas", JSON.stringify([document.getElementById("linkHome").getAttribute("href")]));
		    		}
		    		
		    		paraIntervalTelasAcessadas()
	    		}
	    	}, 100);
	
	    	intervalTelasAcessadas;
	
	    	function novaTelaAcessadaAdd(element) {
	    		let arrayTelas = JSON.parse(localStorage.getItem("telasAcessadas"));
	    		
	    		if (arrayTelas.includes(element.href)) arrayTelas.splice(arrayTelas.indexOf(element.href), 1);
	    		
	    		arrayTelas.push(element.href);
    			localStorage.setItem("telasAcessadas", JSON.stringify(arrayTelas));
			}
	    	
	    	function paraIntervalTelasAcessadas() {
	    		clearInterval(intervalTelasAcessadas);
	    	}
    	</script>
	</head>
	
	<body onresize="changeSideNavArrowPosition()">
		<div class="container-fluid m-0 p-0">
			<div class="row m-0 p-0">
			
				<!-- Left SideNav -->
				<div id="leftSideNav" class="leftSideBarStyleClose d-flex flex-column">
					<!-- Home icon -->
					<div class="justify-content-center">
						<div class="p-2 d-flex align-items-center" style="height: 10vh;">
							<a id="linkHome" href="${pageContext.request.contextPath}/home/home.jsp">
								<img id="logoHomeSideNav" class="img-fluid logoHome" alt="Logo Encomanager" src="${pageContext.request.contextPath}/resources/imagens/iconebrancosemfundo.png">
							</a>
						</div>
					</div>
					<!-- Conteudo do sidenav -->
					<div class="container flex-grow-1 p-0">
						<div class="row h-100 m-0 d-flex justify-content-between">	
							<!-- Informações e usabilidade -->
							<div id="sideNavContent" class="col-7 p-0 d-flex overflow-auto" style="visibility: hidden">
								<div class="container flex-grow-1">
									<div id="rowVerticalNav" class="row mt-4">
										<span class="spanTitleTelas">TELAS</span>
										<div class="list-group flex-fill">
											<div class="list-group-item" onclick="habilitaTelasGrupo('grupo1')">
												<span class="spanGrupoTela"><i class="fa fa-boxes iconSpanGrupoTela"></i>ENCOMENDAS</span>
												<div id="grupo1" class="list-group" style="display: none">
													<a class="list-group-item itemTela" onclick="novaTelaAcessadaAdd(this)" href="#"><span class="nomeTela">Gerar encomenda</span></a>
													<a class="list-group-item itemTela" onclick="novaTelaAcessadaAdd(this)" href="#"><span class="nomeTela">Agenda de encomendas</span></a>
													<a class="list-group-item itemTela" onclick="novaTelaAcessadaAdd(this)" href="#"><span class="nomeTela">Produtos</span></a>
													<a class="list-group-item itemTela" onclick="novaTelaAcessadaAdd(this)" href="#"><span class="nomeTela">Vendas</span></a>
												</div>
											</div>		
											<div class="list-group-item" onclick="habilitaTelasGrupo('grupo2')">
												<span class="spanGrupoTela"><i class="fa fa-users iconSpanGrupoTela"></i>PESSOAS</span>
												<div id="grupo2" class="list-group" style="display: none">
													<a class="list-group-item itemTela" onclick="novaTelaAcessadaAdd(this)" href="#"><span class="nomeTela">Clientes</span></a>
													<a class="list-group-item itemTela" onclick="novaTelaAcessadaAdd(this)" href="/encomanager/telas/usuarios/usuarios.jsp"><span class="nomeTela">Usuários</span></a>
												</div>
											</div>
											<div class="list-group-item" onclick="habilitaTelasGrupo('grupo3')">
												<span class="spanGrupoTela"><i class="fa fa-cogs iconSpanGrupoTela"></i>ADMINISTRAÇÃO</span>
												<div id="grupo3" class="list-group" style="display: none">
													<a class="list-group-item itemTela" onclick="novaTelaAcessadaAdd(this)" href="#"><span class="nomeTela">Tipo de usuário e acessos</span></a>
													<a class="list-group-item itemTela" onclick="novaTelaAcessadaAdd(this)" href="/encomanager/telas/parametros/parametros.jsp"><span class="nomeTela">Parâmetros</span></a>
												</div>
											</div>
										</div>	
									</div>
									
								</div>
							</div>
							<!-- iconeExpansao -->
							<div id="divIconeExpansao" class="col-4 p-0 divIconeExpansaoClose d-flex justify-content-end" onclick="controlaExpansaoSideNav()">
								<i id="iconeExpansao" class="fa fa-angle-right fa-lg text-white iconeExpansao"></i>						
							</div>		
						</div>	
					</div>
				</div>
				
				<!-- Content ---> <%//O conteudo desse div será substituido por outra div da tela com o id="content" caso o mesmo exista.%>
				<div id="contentBox" class="flex-fill">
					Conteúdo da Home
				</div>
			</div>
		</div>	
	</body>
</html>