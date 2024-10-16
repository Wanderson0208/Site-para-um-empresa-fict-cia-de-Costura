package com.projeto.bean;

public class Adm {
	
	private long idAdm;
	private String email;
	private String senha;
	
	
	
	public Adm() {
		super();
	}

	public Adm(long idAdm, String email, String senha) {
		
		super();
		this.idAdm = idAdm;
		this.email = email;
		this.senha = senha;
		
	}
	
	

	public long getIdAdm() {
		return idAdm;
	}

	public void setIdAdm(long idAdm) {
		this.idAdm = idAdm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
