package com.projeto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdmDAO {

	// Cria um atributo do tipo Connection
	private Connection connection;

	// construtor da classe vazio
	public AdmDAO() {

	}

	// construtor da classe com a conexão
	public AdmDAO(Connection connection) {

		this.connection = connection;

	}

	// método logar
	public boolean logar(String email, String senha) {

		boolean valor = true;

		try {

			// verificar se existe nome e email informados
			String consultarLoginSQL = "SELECT * FROM adm where email = ? and senha = ?";

			PreparedStatement preparedStatement_ = connection.prepareStatement(consultarLoginSQL);
			preparedStatement_.setString(1, email);
			preparedStatement_.setString(2, senha);

			// executar o sql
			ResultSet resultSet = preparedStatement_.executeQuery();

			// abaixo, se não encontrado
			if (!resultSet.next()) {

				valor = false;

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		// abaixo, retorno o conteúdo de valor
		return valor;

	}

}
