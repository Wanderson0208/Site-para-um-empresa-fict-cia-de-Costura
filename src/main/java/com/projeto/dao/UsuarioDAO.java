package com.projeto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projeto.bean.Relatos;
import com.projeto.bean.Usuario;
import com.projeto.config.Conexao;

public class UsuarioDAO {

	// Cria um atributo do tipo Connection
	private Connection connection;

	// construtor da classe vazio
	public UsuarioDAO() {

	}

	// construtor da classe com a conexão
	public UsuarioDAO(Connection connection) {

		this.connection = connection;

	}

	// primeiro método para listar todos os registros ou 1 específico
	public List<Usuario> buscarUsuarios(String filtro, String valorDeBusca) {

		List<Usuario> usuarios = new ArrayList<>();

		try {

			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			String consultaSQL = "SELECT * FROM usuario";

			if ("buscarPorNome".equals(filtro)) {

				consultaSQL += " WHERE nome LIKE ?";

			}

			PreparedStatement preparedStatement = connection.prepareStatement(consultaSQL);

			if ("buscarPorNome".equals(filtro)) {

				preparedStatement.setString(1, valorDeBusca);

			}

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Usuario usuario = new Usuario();

				usuario.setIdUsuario(resultSet.getLong("idUsuario"));
				usuario.setNome(resultSet.getString("nome"));
				usuario.setEmail(resultSet.getString("email"));
				usuario.setSenha(resultSet.getString("senha"));
				usuario.setTelefone(resultSet.getString("telefone"));

				usuarios.add(usuario);

			}

			resultSet.close();
			preparedStatement.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace(); // Lide com a exceção apropriadamente

		}

		return usuarios;

	}

	// método para inserir um registro
	public boolean inserirUsuario(Usuario usuario) {

		try {

			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			// preparar para inserir o Usuario no banco de dados
			/* */
			String inserirUsuarioSQL = "INSERT INTO usuario (idUsuario, nome, email, senha, telefone) VALUES (?, ?, ?, ?, ?)";

			PreparedStatement preparedStatement = connection.prepareStatement(inserirUsuarioSQL);

			preparedStatement.setLong(1, usuario.getIdUsuario());
			preparedStatement.setString(2, usuario.getNome());
			preparedStatement.setString(3, usuario.getEmail());
			preparedStatement.setString(4, usuario.getSenha());
			preparedStatement.setString(5, usuario.getTelefone());

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

	// método para apagar um registro
	public boolean apagarUsuario(String idUsuario) {

		try {

			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			// definindo a variável que vai conter o comando sql
			String apagarUsuarioSQL = "DELETE from usuario where idUsuario = ?";

			// preencher o valor da interrogação acima
			PreparedStatement preparedStatement = connection.prepareStatement(apagarUsuarioSQL);
			preparedStatement.setString(1, idUsuario);

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

	// método para a busca por id
	public List<Usuario> buscarId(String id) {

		// prepara um array para armazenar o contato localizado
		List<Usuario> arrayUsuarios = new ArrayList<>();

		try {

			// prepara a consulta para localizar o id que foi passado como parametro
			String consultaSQL = "SELECT * FROM usuario where idUsuario = ?";

			PreparedStatement preparedStatement = connection.prepareStatement(consultaSQL);
			preparedStatement.setString(1, id);

			// executa o código sql
			ResultSet resultSet = preparedStatement.executeQuery();

			// enquanto existir registro, preenche o array com o usuario
			while (resultSet.next()) {

				Usuario usuario = new Usuario();

				usuario.setIdUsuario(resultSet.getInt("idUsuario"));
				usuario.setNome(resultSet.getString("nome"));
				usuario.setEmail(resultSet.getString("email"));
				usuario.setSenha(resultSet.getString("senha"));
				usuario.setTelefone(resultSet.getString("telefone"));

				// adiciona ao array o usuario preenchido
				arrayUsuarios.add(usuario);

			}

			resultSet.close();
			preparedStatement.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		// retorna o registro que foi localizado
		return arrayUsuarios;

	}

	// Método para editar o usuario
	public boolean editarUsuario(Usuario usuario) {

		try {

			// prepara a instrução de atualização
			String editarUsuarioSQL = "UPDATE usuario SET nome = ?, email = ?, senha = ?, telefone = ? where idUsuario = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(editarUsuarioSQL);

			// preenche a sequencia das interrogações na linha do sql
			preparedStatement.setString(1, usuario.getNome());
			preparedStatement.setString(2, usuario.getEmail());
			preparedStatement.setString(3, usuario.getSenha());
			preparedStatement.setString(4, usuario.getTelefone());
			preparedStatement.setLong(5, usuario.getIdUsuario());

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

	// buscar email >> vou construir esse modelo retornando um string
	public String buscarEmail(String email) {

		try {

			// primeira etapa: verificar se já existe o email
			String consultarEmailSQL = "SELECT * FROM usuario where email = ?";

			PreparedStatement preparedStatement_ = connection.prepareStatement(consultarEmailSQL);
			preparedStatement_.setString(1, email);

			// executar o sql
			ResultSet resultSet = preparedStatement_.executeQuery();

			if (resultSet.next()) {

				email = "Encontrado";

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		// abaixo, retorno o conteúdo de email
		return email;
	}

	// buscar telefone >> vou construir esse modelo retornando um string
	public String buscarTelefone(String telefone) {

		try {

			// primeira etapa: verificar se já existe o telefone
			String consultarTelefoneSQL = "SELECT * FROM usuario where telefone = ?";

			PreparedStatement preparedStatement_ = connection.prepareStatement(consultarTelefoneSQL);
			preparedStatement_.setString(1, telefone);

			// executar o sql
			ResultSet resultSet = preparedStatement_.executeQuery();

			if (resultSet.next()) {

				telefone = "Encontrado";

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		// abaixo, retorno o conteúdo de telefone
		return telefone;

	}

	// método logar
	public boolean logar(String email, String senha) {

		boolean valor = true;

		try {

			// verificar se existe nome e email informados
			String consultarLoginSQL = "SELECT * FROM usuario where email = ? and senha = ?";

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

	// buscar Relatos
	/*public List<Relatos> buscarRelatos(String valorDeBusca) {

		List<Relatos> arrayRelatos = new ArrayList<>();

		try {

			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			String consultaSQL = "SELECT * FROM relatos where idUsuarios = ?";

			PreparedStatement preparedStatement = connection.prepareStatement(consultaSQL);
			preparedStatement.setString(1, valorDeBusca);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Relatos relato = new Relatos();

				relato.setIdRelato(resultSet.getLong("idRelato"));
				relato.setDescricaoRelato(resultSet.getString("descricaoRelato"));
				relato.setIdUsuarios(resultSet.getInt("idUsuarios"));
				relato.setNomeUsuarios(resultSet.getString("nomeUsuarios"));
				arrayRelatos.add(relato);

			}

			resultSet.close();
			preparedStatement.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return arrayRelatos;

	}*/

	
	//bucar TODOS relatos
	public List<Relatos> buscarRelatosAll() {

		List<Relatos> arrayRelatos = new ArrayList<>();

		try {


			String consultaSQL = "SELECT * FROM relatos";

			PreparedStatement preparedStatement = connection.prepareStatement(consultaSQL);
			
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Relatos relato = new Relatos();

				relato.setIdRelato(resultSet.getLong("idRelato"));
				relato.setDescricaoRelato(resultSet.getString("descricaoRelato"));
				relato.setNomeUsuarios(resultSet.getString("nomeUsuarios"));
				relato.setEmailUsuarios(resultSet.getString("emailUsuarios"));

				arrayRelatos.add(relato);

			}

			resultSet.close();
			preparedStatement.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace(); // Lide com a exceção apropriadamente

		}

		return arrayRelatos;

	}
	
	// Inserir Relatos
	public boolean inserirRelato(Relatos relato) {
		
		try {
			
			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			String inserirRelatoSQL = "INSERT INTO relatos (idRelato, descricaoRelato, nomeUsuarios, emailUsuarios) VALUES (?, ?, ?, ?)";

			PreparedStatement preparedStatement = connection.prepareStatement(inserirRelatoSQL);
			
			preparedStatement.setLong(1, relato.getIdRelato());
			preparedStatement.setString(2, relato.getDescricaoRelato());
			preparedStatement.setString(3, relato.getNomeUsuarios());
			preparedStatement.setString(4, relato.getEmailUsuarios());

			
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
	
	// primeiro método para listar todos os registros ou 1 específico
		public List<Relatos> pesquisarRelatos(String filtro, String valorDeBusca) {

			List<Relatos> relatos = new ArrayList<>();

			try {

				Conexao conexao = new Conexao();
				Connection connection = conexao.conectar();

				String consultaSQL = "SELECT * FROM relatos";

				if ("buscarPorNome".equals(filtro)) {

					consultaSQL += " WHERE nomeUsuarios LIKE ?";

				}

				PreparedStatement preparedStatement = connection.prepareStatement(consultaSQL);

				if ("buscarPorNome".equals(filtro)) {

					preparedStatement.setString(1, valorDeBusca);

				}

				ResultSet resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {

					Relatos relato = new Relatos();

					relato.setIdRelato(resultSet.getLong("idRelato"));
					relato.setDescricaoRelato(resultSet.getString("descricaoRelato"));
					relato.setNomeUsuarios(resultSet.getString("nomeUsuarios"));
					relato.setEmailUsuarios(resultSet.getString("emailUsuarios"));


					relatos.add(relato);

				}

				resultSet.close();
				preparedStatement.close();
				connection.close();

			} catch (SQLException e) {

				e.printStackTrace(); // Lide com a exceção apropriadamente

			}

			return relatos;

		}
		
		// método para apagar um relato
		public boolean apagarRelato(String idRelato) {

			try {

				Conexao conexao = new Conexao();
				Connection connection = conexao.conectar();

				// definindo a variável que vai conter o comando sql
				String apagarRelatoSQL = "DELETE from relatos where idRelato = ?";

				// preencher o valor da interrogação acima
				PreparedStatement preparedStatement = connection.prepareStatement(apagarRelatoSQL);
				preparedStatement.setString(1, idRelato);

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
	
}
