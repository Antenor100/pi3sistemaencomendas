package controllers;

import java.sql.Connection;

import models.conexao.MySqlConnector;
import models.manipulacao.DBM;

public class teste {	
	public static void main(String[] args) {
		/*		
		Connection con = MySqlConnector.abreConexao();
		MySqlConnector.statusConexao();
		MySqlConnector.reiniciarConexao();
		MySqlConnector.fecharConexao();
		MySqlConnector.statusConexao();
		*/
		
		//Manipulando tabela usuario
		
		//Abre coneção
		Connection con = MySqlConnector.abreConexao();
		
		//Instancia classe de manipulação
		DBM dbm = new DBM(con);
		
		//Insere usuario
		dbm.insert("USUARIO", "LOGIN, SENHA", "'spielberg', '12345'");
		
		//Deleta usuario
		dbm.delete("USUARIO", "CODUSU = 4");
		
		//Altera usuario
		dbm.update("USUARIO", "LOGIN = 'antenorZika', SENHA = 'zika'", "CODUSU = 5");
		
		//Executa select
		System.out.println("SELECT1-----");
		System.out.println(dbm.select("USUARIO", "*").toString());
		System.out.println("");
		
		System.out.println("SELECT2-----");
		System.out.println(dbm.select("USUARIO", "*", "CODUSU = 5").toString());
		System.out.println("");
		
		System.out.println("SELECT3-----");
		System.out.println(dbm.select("USUARIO", "SENHA", "CODUSU = 5").toString());
		
		MySqlConnector.fecharConexao();		
	}	
}
	