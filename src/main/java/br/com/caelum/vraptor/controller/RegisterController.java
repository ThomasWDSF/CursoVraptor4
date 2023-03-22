package br.com.caelum.vraptor.controller;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.UsuarioDAO;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.model.Usuario;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;

//Quando a URL "register" for acessada, ela caira nestes métodos
@Path("register")
//Anotação obrigatória para configurar essa classe no Hibernate
@Controller
public class RegisterController {

	//Injeções são formas de trazer objetos do projeto, para se usar na classe injetada
	@Inject EntityManager em;
	@Inject Result result;
	@Inject UsuarioDAO usuarioDao;
	@Inject Validator validator;
	
	//Ao ser redirecionado para a URL, você cai numa página vazia, apenas com o Front aguardando ações
	@Get("")
	public void register() {

	}
	//Manter os resultados na tela mesmo após erro
	@IncludeParameters
	//Método executado ao clicar em "Cadastrar"
	@Post("salvausuario")
	public void salvaUsuario(@Valid Usuario usuario, String confirmaSenha) {
		
		//Validar se a confirmação de senha é igual a senha
		boolean senhaIgual = confirmaSenha.equals(usuario.getSenha());
		validator.addIf(!senhaIgual, new SimpleMessage("confirmaSenha", "A confirmação está diferente da senha"));
		
		//Caso exista um erro no Usuario, retorna para a tela de cadastro
		validator.onErrorRedirectTo(this).register();
		
		//Método DAO para inserir ou atualizar um novo Usuario no banco, caso ele passe pelo validator
		usuarioDao.insertOrUpdate(usuario);
		
		//Após os processos acima passarem, acessa a página de Dashboard
		result.redirectTo(DashboardController.class).dashboard();
	}
}
