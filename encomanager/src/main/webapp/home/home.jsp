<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/resources/jsp/importadorDependencias.jsp"/>
		
		<title>Encomanager</title>
		
		<link href="${pageContext.request.contextPath}/home/home.css" type="text/css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath}/home/home.js" type="text/javascript"></script>
	</head>
	
	<body>
		<div class="container-fluid m-0 p-0">
			<div class="row m-0 p-0">
			
				<!-- Left SideNav -->
				<div id="leftSideNav" class="leftSideBarStyle d-flex flex-column">
					<!-- Home icon -->
					<div class="justify-content-center">
						<div class="p-1">
							<img class="img-fluid logoHome" alt="Logo Encomanager" src="${pageContext.request.contextPath}/resources/imagens/iconebrancosemfundo.png">
						</div>
					</div>
					<!-- Conteudo do sidenav -->
					<div class="container flex-grow-1 p-0"> <!-- bg-warning -->
						<div class="row h-100 m-0">
							<!-- Informações e usabilidade -->
							<div id="sideNavContent" class="col-10 p-0"> <!-- bg-danger -->
								
							</div>
							
							<!-- iconeExpancao -->
							<div class="col-2 p-0 "> <!-- bg-success -->
								<i id="iconeExpancao" class="fa fa-angle-right fa-lg text-white"></i>						
							</div>
						</div>
					</div>
					
				</div>
				
				<!-- Content ---> <%//É setado com a tela, ao iniciar qualquer uma%>
				<div id="contentBox" class="flex-fill">
					conteudo da home
				</div>
			</div>
		</div>	
	</body>
</html>