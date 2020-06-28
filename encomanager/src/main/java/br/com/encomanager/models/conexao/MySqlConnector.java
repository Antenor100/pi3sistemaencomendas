package br.com.encomanager.models.conexao;                   
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
	
/**
 * Classe utilizada para manipular as conex�es com o SGBD MySql.
 * 
 * @Obs Os dados da conex�o como: ip, usu�rio, senha e outros s�o passados diretamente dentro do fonte desta classe "MySqlConnector.java".
 */
public class MySqlConnector {

	private static String status = "N�o conectou...";
	
	//M�todo de Conex�o
	private static Connection getConexao(boolean isClose) {

		Connection connection = null; //Variavel do tipo Connection

		try {				
			//Configurando a nossa conex�o com um banco de dados//
			final String serverName = "localhost:3306"; //caminho do servidor do BD
			final String mydatabase = "encomanager"; //nome do seu banco de dados
			final String urlParams = "useTimezone=true&serverTimezone=UTC";
			final String username = "root"; //nome de um usu�rio de seu BD
			final String password = "admin"; //sua senha de acesso
			String url = "jdbc:mysql://" + serverName + "/" + mydatabase + "?" + urlParams;
					
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
			
			//Seta status da conex�o
			if (connection != null) {
				status = ("STATUS-> Conectado com sucesso!");
			} else {
				status = ("STATUS-> N�o foi possivel realizar conex�o");
			}
			return connection;

		} catch (Exception e) {
			//N�o conseguindo se conectar ao banco
			System.out.println("Nao foi possivel conectar ao Banco de Dados.");
			e.printStackTrace();
			return null;
			
		} finally {
			if (!isClose) {
				System.out.println(status);
			}	
		}
	}

	//M�todo que abre sua conex�o.
	public static Connection abreConexao() {
		return getConexao(false);
	}
	
	//M�todo que fecha sua conex�o
	public static boolean fecharConexao() {	
		try {
			MySqlConnector.getConexao(true).close();
			status = "STATUS-> Conex�o finalizada!";
			return true;
		} catch (Exception e) {
			System.out.println("Erro ao fechar conex�o");
			e.printStackTrace();
			return false;
		} finally {
			System.out.println(status);
		}
	}
	
	//M�todo que reinicia sua conex�o//
	public static Connection reiniciarConexao() {
		System.out.println("Reiniciando conex�o");
		fecharConexao();
		return MySqlConnector.getConexao(false);
	}
	
	//M�todo que retorna o status da sua conex�o
	public static void statusConexao() {
		System.out.println(status);
	}
}