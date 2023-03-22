<!-- Syntax importante para converter para usar Java/JSP no código HTML5 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Syntax para acessar funções do JSP com o prefixo c, por exemplo: c.SetNome() -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<html lang="pt-br">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Nome da página -->
  <title>Jogo Loteria - Cadastrar</title>

  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
</head>
<body class="bg-gradient-primary">
  <div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Cadastrar!</h1>
              </div>
              <!-- Código para executar erros na tela, caso existam -->
              <c:if test="${not empty errors }">
                <div class="alert alert-danger" role="alert">
            	 <c:forEach var="error" items="${errors}">
    				${error.message}<br />
				</c:forEach>
				</div>
			  </c:if>
			  
			  <!-- O method="post" permite que este Submit seja tratado como um Post, permitindo acesso para envio ao banco-->
              <form method="post" class="user" action="<c:url value="register/salvausuario"/>">
              <!-- Através desse <c:url value="register/salvausuario"/>", este formulario será enviado para o método que configura o /salvausuario -->
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                  	<!-- Campo para preencher um usuario no front, cujo qual vai retornar um valor para o Usuario através do Usuario.SetNome(this.input) -->
                    <input name="usuario.nome" value="${usuario.nome}" minlength="3" maxlength="15" type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="Nome">
                    <!-- Placeholder representa o nome que esta ali mesmo sem preencher nenhuma informação -->
                  </div>
                </div>
                <div class="form-group">
                  <!-- Campo para preencher um email no front, que igualmente através do Usuario.SetEmail(this.input) vai lhe disponibilizar este E-Mail -->
                  <input name="usuario.email" value="${usuario.email}" type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email">
                  <!-- Através do Type="email", o próprio Front do HTML5 válida se ele cumpre os requisitos de um E-Mail -->
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                  	<!-- Campo para preencher uma senha no front, que igualmente através do Usuario.SetSenha(this.input) vai lhe disponibilizar esta Senha -->
                    <input name="usuario.senha" type="password" minlength="6" maxlength="20" class="form-control form-control-user" id="exampleInputPassword" placeholder="Senha">
                    <!-- Class e Id são comandos do HTML5 para customizar e caracterizar, neste caso, o input -->
                  </div>
                  <div class="col-sm-6">
                  	<!-- Campo para preencher a confirmação da senha, e devolver ela NÃO para o Usuario, mas sim diretamente no parametro de RegisterController.salvausuario(Usuario, *confirmaSenha*) -->
                    <input name="confirmaSenha" type="password" minlength="6" maxlength="20" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Confirme a Senha">
                    <!-- Dentro do método salvausuario, é validado se este input de confirmaSenha é igual a Senha -->
                  </div>
                </div>
                <!-- Ao clicar em Cadastrar, todas informações passadas nos Campos vão ser entregues para o form, que consequentemente, vai entregar os resultados no método RegisterController.salvausuario -->
                <button type="submit" class="btn btn-primary btn-user btn-block">
                  Cadastrar
                </button>   
              </form>
              <hr>
              <div class="text-center">
              	<!-- Uma URL que permite redirecionar para Login, caso você já tenha uma conta -->
                <a class="small" href="<c:url value="login"/>">Ja tem uma conta? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/sb-admin-2.min.js"></script>
</body>
</html>
