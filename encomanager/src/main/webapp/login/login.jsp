<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="shortcut icon" href="../imagens/favicon.png" />
    <link href="../resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="../resources/bootstrap/bootstrap.min.js"></script>
    <script src="../resources/jquery/jquery-3.4.1.min.js"></script>

    <title>Entrar</title>

    <link href="login.css" rel="stylesheet">
  </head>

  <body>
    <div class="container-fluid">
      <div class="row justify-content-center">
        <!--Container do banner-->
        <div class="row mb-5 justify-content-center">
          <div class="col-8 col-md-5">
            <img src="../imagens/bannerLogin.png" class="img-fluid" alt="Banner Encomanager">
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
                <input id="usuario" name="inputUsuarioValue" type="text" class="form-control text-center" placeholder="Usuário">
              </div>
            </div>
            <div class="form-row form-group justify-content-center">
              <div class="col-8">
                <input id="senha" name="inputSenhaValue" type="password" class="form-control text-center" placeholder="Senha">
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