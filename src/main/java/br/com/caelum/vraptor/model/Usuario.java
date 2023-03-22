package br.com.caelum.vraptor.model;

import javax.persistence.Entity;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

//Transforma esse Objeto em uma entidade para o banco, podendo ser acessado pelo Hibernate
@Entity
public class Usuario extends Model{

	//Através do NotEmpty e Size, o validator agora sabe quais erros esse Atributo pode triggerar
	@NotEmpty(message="{usuario.nome.embranco}")
	@Size(min=4, max=20, message="{usuario.nome.size}")
	private String nome;
	
	@NotEmpty(message="{usuario.email.embranco}")
	@Email (message="{usuario.email.invalido}")
	private String email;
	
	@NotEmpty (message="{usuario.senha.embranco}")
	@Size(min=6, max=20, message="{usuario.senha.size}")
	private String senha;

	public String getNome() {
		return this.nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getSenha() {
		return this.senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}

}
