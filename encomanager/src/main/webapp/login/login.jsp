<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
  	<jsp:include page="/resources/jsp/importadorDependencias.jsp"/>

    <title>Entrar</title>

    <link href="${pageContext.request.contextPath}/login/login.css" type="text/css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/login/login.js" type="text/javascript"></script>
  </head>

	<% 
		String erro = (String) request.getAttribute("erro");
		
		boolean mostraErroUsuario = false;
		boolean mostraErroSenha = false;
	
		if(erro != null) {
			if(erro.equals("usuario")) {
				mostraErroUsuario = true;
				
			} else if(erro.equals("senha")) {
				mostraErroSenha = true;
			}			
		}
	%>

  <body>
    <div class="container-fluid">
      <div class="row justify-content-center">
        <!--Container do banner-->
        <div class="row mb-5 justify-content-center">
          <div class="col-8 col-md-5">
            <img src="${pageContext.request.contextPath}/resources/imagens/bannerLogin.png" class="img-fluid" alt="Banner Encomanager">
          </div>
        </div>
        <!--Container da caixa de login-->
        <div class="col-8 col-md-4 border border-primary">
          <!--Container mensagem bem vindo-->
          <div class="row py-3 justify-content-center">
            <span style="font-size:20px;" class="text-center font-weight-bold text-primary">BEM VINDO</span>
          </div>
          <form action="${pageContext.request.contextPath}/ValidaLogin" method="post">
            <!--Campos-->
            <div class="form-row form-group justify-content-center">
              <div class="col-8">
                <input 
	                id="inputUsuario" 
	                name="inputUsuarioValue" 
	                type="text" 
	                class="form-control text-center" 
	                placeholder="Usuário"
	                value="<% if(request.getAttribute("usuario") != null) out.print(request.getAttribute("usuario"));%>"
                >
              </div>
				<div class="col-8">
				 <!--Mensagem de erro-->
				 <% if(mostraErroUsuario) out.print("<span class='text-center text-danger'><i class='fa fa-times' style='margin-right: 3px'></i>Usuário incorreto ou inexistente</span>");%>     
				</div>
            </div>

            <div class="form-row form-group justify-content-center">
              <div class="col-8">
                <input 
	                id="inputSenha" 
	                name="inputSenhaValue" 
	                type="password" 
	                class="form-control text-center" 
	                placeholder="Senha"
	                value="<% if(request.getAttribute("senha") != null) out.print(request.getAttribute("senha"));%>"
                >
      			<!--Icone mostra senha-->
                <i id="inputEyeIcon" class='eyeIcon fa fa-eye fa-lg'></i>
              </div>
              <div class="col-8">
                <!--Mensagem de erro-->
                <% if(mostraErroSenha) out.print("<span class='text-center text-danger'><i class='fa fa-times' style='margin-right: 3px'></i>Senha incorreta</span>");%>              
              </div>
            </div>
            <!--Botão entrar-->
            <div class="form-row form-group justify-content-center">
              <div class="col-8">
                <div class="row justify-content-center">
                  <input class="btn btn-primary" type="submit" value="ENTRAR">
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>