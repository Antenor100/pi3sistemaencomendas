package br.com.encomanager.models.conexao;                   
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
	
/**
 * Classe utilizada para manipular as conexões com o SGBD MySql.
 * 
 * @Obs Os dados da conexão como: ip, usuário, senha e outros são passados diretamente dentro do fonte desta classe "MySqlConnector.java".
 */
public class MySqlConnector {

	private static String status = "Não conectou...";
	
	//Método de Conexão
	private static Connection getConexao(boolean isClose) {

		Connection connection = null; //Variavel do tipo Connection

		try {				
			//Configurando a nossa conexão com um banco de dados//
			final String serverName = "localhost:3306"; //caminho do servidor do BD
			final String mydatabase = "encomanager"; //nome do seu banco de dados
			final String urlParams = "useTimezone=true&serverTimezone=UTC";
			final String username = "root"; //nome de um usuário de seu BD
			final String password = "admin"; //sua senha de acesso
			String url = "jdbc:mysql://" + serverName + "/" + mydatabase + "?" + urlParams;
					
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
			
			//Seta status da conexão
			if (connection != null) {
				status = ("STATUS-> Conectado com sucesso!");
			} else {
				status = ("STATUS-> Não foi possivel realizar conexão");
			}
			return connection;

		} catch (Exception e) {
			//Não conseguindo se conectar ao banco
			System.out.println("Nao foi possivel conectar ao Banco de Dados.");
			e.printStackTrace();
			return null;
			
		} finally {
			if (!isClose) {
				System.out.println(status);
			}	
		}
	}

	//Método que abre sua conexão.
	public static Connection abreConexao() {
		return getConexao(false);
	}
	
	//Método que fecha sua conexão
	public static boolean fecharConexao() {	
		try {
			MySqlConnector.getConexao(true).close();
			status = "STATUS-> Conexão finalizada!";
			return true;
		} catch (Exception e) {
			System.out.println("Erro ao fechar conexão");
			e.printStackTrace();
			return false;
		} finally {
			System.out.println(status);
		}
	}
	
	//Método que reinicia sua conexão//
	public static Connection reiniciarConexao() {
		System.out.println("Reiniciando conexão");
		fecharConexao();
		return MySqlConnector.getConexao(false);
	}
	
	//Método que retorna o status da sua conexão
	public static void statusConexao() {
		System.out.println(status);
	}
}