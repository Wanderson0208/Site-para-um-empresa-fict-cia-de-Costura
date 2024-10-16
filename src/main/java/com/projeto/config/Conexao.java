package com.projeto.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	
	// abaixo o método chama excessçai de SQL
		public Connection conectar() throws SQLException {
			try {
				// Classe do mysql
				Class.forName("com.mysql.cj.jdbc.Driver"); 
				// Retorno do drive do banco com usuario, senha e outros
				return DriverManager.getConnection(
				"jdbc:mysql://localhost/projetodelta?useTimezona=true&serverTimezone=UTC&user=root&password=");
				
			}catch(ClassNotFoundException e) {
				throw new RuntimeException(e);
			}
		}
		

}
