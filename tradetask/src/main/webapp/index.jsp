<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Entrar</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
  </head>
  <body class="text-center">
    <form class="form-login">
      <h1 class="h3 mb-3 font-weight-normal">Entrar</h1>
      <label class="sr-only" for="inputUser">Usuário</label>
      <input class="form-control" type="text" id="inputUser" placeholder="Usuário" required autofocus>
      <label class="sr-only" for="inputPassword">Senha</label>
      <input class="form-control" type="password" id="inputPassword" placeholder="Senha" required>
      <div class="checkbox mt-2 mb-3">
        <label>
          <input type="checkbox" value="rememberLogin"> Lembrar de mim
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="button" onclick="validateLogin()">Entrar</button>
    </form>
  </body>
</html>