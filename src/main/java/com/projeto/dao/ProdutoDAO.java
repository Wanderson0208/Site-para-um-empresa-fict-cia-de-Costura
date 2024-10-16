package com.projeto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projeto.bean.Produto;
import com.projeto.config.Conexao;

public class ProdutoDAO {

	// Cria um atributo do tipo Connection
	private Connection connection;

	// construtor da classe vazio
	public ProdutoDAO() {

	}

	// construtor da classe com a conexão
	public ProdutoDAO(Connection connection) {
		this.connection = connection;
	}

	// primeiro método para listar todos os registros ou 1 específico
	public List<Produto> buscarProdutos(String filtro, String valorDeBusca) {

		List<Produto> produtos = new ArrayList<>();

		try {

			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			String consultaSQL = "SELECT * FROM produtos";

			if ("buscarPorNome".equals(filtro)) {

				consultaSQL += " WHERE descricao LIKE ?";

			}

			PreparedStatement preparedStatement = connection.prepareStatement(consultaSQL);

			if ("buscarPorNome".equals(filtro)) {

				preparedStatement.setString(1, valorDeBusca);

			}

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Produto produto = new Produto();

				produto.setIdProduto(resultSet.getLong("idProduto"));
				produto.setDescricao(resultSet.getString("descricao"));
				produto.setValor(resultSet.getDouble("valor"));
				produto.setTamanho(resultSet.getString("tamanho"));
				produto.setQuantidade(resultSet.getInt("quantidade"));
				produto.setPromocao(resultSet.getString("promocao"));
				produto.setImagem(resultSet.getString("imagem"));

				produtos.add(produto);

			}

			resultSet.close();
			preparedStatement.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace(); // Lide com a exceção apropriadamente

		}

		return produtos;

	}

	// método para apagar um registro
	public boolean apagarProduto(String idProduto) {

		try {
			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			// definindo a variável que vai conter o comando sql
			String apagarProdutoSQL = "DELETE from produtos where idProduto = ?";
			// preencher o valor da interrogação acima
			PreparedStatement preparedStatement = connection.prepareStatement(apagarProdutoSQL);
			preparedStatement.setString(1, idProduto);
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
	public boolean inserirProduto(Produto produto) {

		try {

			Conexao conexao = new Conexao();
			Connection connection = conexao.conectar();

			// preparar para inserir o PRODUTO no banco de dados
			/* */
			String inserirProdutoSQL = "INSERT INTO produtos (idProduto, descricao, valor, tamanho, quantidade, promocao) VALUES (?, ?, ?, ?, ?, ?)";

			PreparedStatement preparedStatement = connection.prepareStatement(inserirProdutoSQL);

			preparedStatement.setLong(1, produto.getIdProduto());
			preparedStatement.setString(2, produto.getDescricao());
			preparedStatement.setDouble(3, produto.getValor());
			preparedStatement.setString(4, produto.getTamanho());
			preparedStatement.setInt(5, produto.getQuantidade());
			preparedStatement.setString(6, produto.getPromocao());

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
	public List<Produto> buscarId(String id) {

		// prepara um array para armazenar o produto localizado
		List<Produto> arrayProdutos = new ArrayList<>();

		try {

			// prepara a consulta para localizar o id que foi passado como parametro
			String consultaSQL = "SELECT * FROM produtos where idProduto = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(consultaSQL);
			preparedStatement.setString(1, id);

			// executa o código sql
			ResultSet resultSet = preparedStatement.executeQuery();

			// enquanto existir registro, preenche o array com o produto
			while (resultSet.next()) {

				Produto produto = new Produto();

				produto.setIdProduto(resultSet.getLong("idProduto"));
				produto.setDescricao(resultSet.getString("descricao"));
				produto.setValor(resultSet.getDouble("valor"));
				produto.setTamanho(resultSet.getString("tamanho"));
				produto.setQuantidade(resultSet.getInt("quantidade"));
				produto.setPromocao(resultSet.getString("promocao"));

				// adiciona ao array o contato preenchido
				arrayProdutos.add(produto);

			}

			resultSet.close();
			preparedStatement.close();
			connection.close();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		// retorna o registro que foi localizado
		return arrayProdutos;

	}

	// Método para editar o produto
	public boolean editarProduto(Produto produto) {

		try {

			// prepara a instrução de atualização
			String editarProdutoSQL = "UPDATE produtos SET descricao = ?, valor = ?, tamanho = ?, quantidade = ?, promocao = ? where idProduto = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(editarProdutoSQL);

			// preenche a sequencia das interrogações na linha do sql

			preparedStatement.setString(1, produto.getDescricao());
			preparedStatement.setDouble(2, produto.getValor());
			preparedStatement.setString(3, produto.getTamanho());
			preparedStatement.setInt(4, produto.getQuantidade());
			preparedStatement.setString(5, produto.getPromocao());
			preparedStatement.setLong(6, produto.getIdProduto());

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

			String editarProdutoSQL = "UPDATE produtos SET imagem = ? where idProduto = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(editarProdutoSQL);
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
