package com.projeto.bean;

public class Servico {
	
	private long idServico;
	private String nomeServico;
	private String descricaoServico;
	private String imagemServ;
	
	
	
	public Servico() {
		
		super();
	
	}
	
	public Servico(long idServico, String nomeServico, String descricaoServico, String imagemServ) {
		
		super();
		
		this.idServico = idServico;
		this.nomeServico = nomeServico;
		this.descricaoServico = descricaoServico;
		this.imagemServ = imagemServ;
	
	}



	public long getIdServico() {
		return idServico;
	}

	public void setIdServico(long idServico) {
		this.idServico = idServico;
	}

	public String getNomeServico() {
		return nomeServico;
	}

	public void setNomeServico(String nomeServico) {
		this.nomeServico = nomeServico;
	}

	public String getDescricaoServico() {
		return descricaoServico;
	}

	public void setDescricaoServico(String descricaoServico) {
		this.descricaoServico = descricaoServico;
	}

	public String getImagemServ() {
		return imagemServ;
	}

	public void setImagemServ(String imagemServ) {
		this.imagemServ = imagemServ;
	}
	
	

	
}
