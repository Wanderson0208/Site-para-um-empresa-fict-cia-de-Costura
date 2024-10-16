package com.projeto.bean;

public class Relatos {
	
	private long idRelato;
	private String descricaoRelato;
	private String nomeUsuarios;
	private String emailUsuarios;
	
	
	
	public Relatos() {
	
		super();
	
	}

	public Relatos(long idRelato, String descricaoRelato, String nomeUsuarios, String emailUsuarios) {
		
		super();
		
		this.idRelato = idRelato;
		this.descricaoRelato = descricaoRelato;
		this.nomeUsuarios = nomeUsuarios;
		this.emailUsuarios = emailUsuarios;
	
	}
	
	

	public long getIdRelato() {
		return idRelato;
	}

	public void setIdRelato(long idRelato) {
		this.idRelato = idRelato;
	}

	public String getDescricaoRelato() {
		return descricaoRelato;
	}

	public void setDescricaoRelato(String descricaoRelato) {
		this.descricaoRelato = descricaoRelato;
	}

	public String getNomeUsuarios() {
		return nomeUsuarios;
	}

	public void setNomeUsuarios(String nomeUsuarios) {
		this.nomeUsuarios = nomeUsuarios;
	}

	public String getEmailUsuarios() {
		return emailUsuarios;
	}

	public void setEmailUsuarios(String emailUsuarios) {
		this.emailUsuarios = emailUsuarios;
	}
	
	
	
	

	

}
