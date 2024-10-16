package com.projeto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projeto.bean.Servico;
import com.projeto.config.Conexao;

public class ServicoDAO {

	private Connection connection;

	public ServicoDAO() {

	}

	public ServicoDAO(Connection connection) {

		this.connection = connection;

	}

	// primeiro método para listar todos os registros ou 1 específico
	public List<Servico> buscarServicos(String filtro, String valorDeBusca) {

		List<Servico> servicos = new ArrayList<>();

		try {

			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			String consultaSQL = "SELECT * FROM servico";

			if ("buscarPorNome".equals(filtro)) {

				consultaSQL += " WHERE nomeServ LIKE ?";

			}

			PreparedStatement preparedStatement = connection.prepareStatement(consultaSQL);

			if ("buscarPorNome".equals(filtro)) {

				preparedStatement.setString(1, valorDeBusca);

			}

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Servico servico = new Servico();

				servico.setIdServico(resultSet.getLong("idServico"));
				servico.setNomeServico(resultSet.getString("nomeServ"));
				servico.setDescricaoServico(resultSet.getString("descricaoServ"));
				servico.setImagemServ(resultSet.getString("imagemServ"));

				servicos.add(servico);

			}

			resultSet.close();
			preparedStatement.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace(); // Lide com a exceção apropriadamente

		}

		return servicos;

	}

	// método para apagar um registro
	public boolean apagarServico(String idServico) {

		try {

			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			// definindo a variável que vai conter o comando sql
			String apagarServicoSQL = "DELETE from servico where idServico = ?";
			// preencher o valor da interrogação acima
			PreparedStatement preparedStatement = connection.prepareStatement(apagarServicoSQL);
			preparedStatement.setString(1, idServico);
			// por fim, a execução de toda a instrução
			preparedStatement.executeUpdate();

			// Não esqueça de fechar a conexão e liberar recursos
			preparedStatement.close();
			connection.close();
			return true;

		} catch (SQLException e) {

			e.printStackTrace(); // Lide com a exceção apropriadamente
			return false;

		}

	}

	// método para inserir um registro
	public boolean inserirServico(Servico servico) {

		try {

			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			// preparar para inserir o serviço no banco de dados
			/* */
			String inserirServicoSQL = "INSERT INTO servico (idServico, nomeServ, descricaoServ, imagemServ) VALUES (?, ?, ?, ?)";

			PreparedStatement preparedStatement = connection.prepareStatement(inserirServicoSQL);

			preparedStatement.setLong(1, servico.getIdServico());
			preparedStatement.setString(2, servico.getNomeServico());
			preparedStatement.setString(3, servico.getDescricaoServico());
			preparedStatement.setString(4, servico.getImagemServ());

			// por fim, a execução de toda a instrução
			preparedStatement.executeUpdate();

			// Não esqueça de fechar a conexão e liberar recursos
			preparedStatement.close();
			connection.close();
			return true;
			// }

		} catch (SQLException e) {

			e.printStackTrace();
			return false;

		}

	}

	// método para a busca por id
	public List<Servico> buscarId(String id) {

		// prepara um array para armazenar o produto localizado
		List<Servico> arrayServicos = new ArrayList<>();

		try {

			// prepara a consulta para localizar o id que foi passado como parametro
			String consultaSQL = "SELECT * FROM servico where idServico = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(consultaSQL);
			preparedStatement.setString(1, id);

			// executa o código sql
			ResultSet resultSet = preparedStatement.executeQuery();

			// enquanto existir registro, preenche o array com o produto
			while (resultSet.next()) {

				Servico servico = new Servico();

				servico.setIdServico(resultSet.getLong("idServico"));
				servico.setNomeServico(resultSet.getString("nomeServ"));
				servico.setDescricaoServico(resultSet.getString("descricaoServ"));

				// adiciona ao array o contato preenchido
				arrayServicos.add(servico);

			}

			resultSet.close();
			preparedStatement.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		// retorna o registro que foi localizado
		return arrayServicos;

	}

	// Método para editar o servico
	public boolean editarServico(Servico servico) {

		try {

			// prepara a instrução de atualização
			String editarServicoSQL = "UPDATE servico SET nomeServ = ?, descricaoServ = ? where idServico = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(editarServicoSQL);

			// preenche a sequencia das interrogações na linha do sql

			preparedStatement.setString(1, servico.getNomeServico());
			preparedStatement.setString(2, servico.getDescricaoServico());
			preparedStatement.setLong(3, servico.getIdServico());

			// por fim, a execução de toda a instrução
			preparedStatement.executeUpdate();

			// Não esqueça de fechar a conexão e liberar recursos
			preparedStatement.close();
			connection.close();
			return true;

		} catch (Exception e) {

			return false;

		}

	}

	// editar imagem
	public boolean editarImagem(String id, String imagem) {
		
		try {
			
			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			String editarServicoSQL = "UPDATE servico SET imagemServ = ? where idServico = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(editarServicoSQL);
			preparedStatement.setString(1, imagem);
			preparedStatement.setString(2, id);

			// por fim, a execução de toda a instrução
			preparedStatement.executeUpdate();
			// Não esqueça de fechar a conexão e liberar recursos
			preparedStatement.close();
			connection.close();
			return true;

		} catch (Exception e) {
			return false;
		}
	}

}
