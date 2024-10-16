package com.projeto.bean;

public class Produto {
	
	private long idProduto;
	private String descricao;
	private double valor;
	private String tamanho;
	private int quantidade;
	private String promocao;
	private String imagem;
	
	
	
	public Produto() {
		
		super();
		
	}

	public Produto(long idProduto, String descricao, double valor, String tamanho, int quantidade, String promocao, String imagem) {
		
		super();
		this.idProduto = idProduto;
		this.descricao = descricao;
		this.valor = valor;
		this.tamanho = tamanho;
		this.quantidade = quantidade;
		this.promocao = promocao;
		this.imagem = imagem;
		
	}

	
	
	
	public long getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(long idProduto) {
		this.idProduto = idProduto;
	}


	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}
	

	public String getTamanho() {
		return tamanho;
	}

	public void setTamanho(String tamanho) {
		this.tamanho = tamanho;
	}
	

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	

	public String getPromocao() {
		return promocao;
	}

	public void setPromocao(String promocao) {
		this.promocao = promocao;
	}
	
	
	public String getImagem() {
		return imagem;
	}
	
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

}
