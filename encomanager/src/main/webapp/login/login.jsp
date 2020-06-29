<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/imagens/favicon.png" />
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fontawesome/font-awesome-4.7.0/css/font-awesome.min.css">

    <title>Entrar</title>

    <link href="${pageContext.request.contextPath}/login/login.css" rel="stylesheet">
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
            <img src="${pageContext.request.contextPath}/imagens/bannerLogin.png" class="img-fluid" alt="Banner Encomanager">
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
	                id="usuario" 
	                name="inputUsuarioValue" 
	                type="text" 
	                class="form-control text-center" 
	                placeholder="Usuário"
	                value="<% if(request.getAttribute("usuario") != null) out.print(request.getAttribute("usuario"));%>"
                >
                <!--Mensagem de erro-->
               <% if(mostraErroUsuario) out.print("<span class='text-center text-danger'><i class='fa fa-times' style='margin-right: 3px'></i>Usuário incorreto ou inexistente</span>");%>
              </div>
            </div>

            <div class="form-row form-group justify-content-center">
              <div class="col-8">
                <input 
	                id="senha" 
	                name="inputSenhaValue" 
	                type="password" 
	                class="form-control text-center" 
	                placeholder="Senha"
	                value="<% if(request.getAttribute("senha") != null) out.print(request.getAttribute("senha"));%>"
                >
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