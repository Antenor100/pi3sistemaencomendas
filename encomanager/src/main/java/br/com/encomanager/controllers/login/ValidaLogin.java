package br.com.encomanager.controllers.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.encomanager.models.conexao.MySqlConnector;
import br.com.encomanager.models.manipulacao.DBM;
import br.com.encomanager.util.Registro;

@WebServlet("/ValidaLogin")
public class ValidaLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userValue = request.getParameter("inputUsuarioValue");
		String passwordValue = request.getParameter("inputSenhaValue");
		
		DBM dbm = new DBM(MySqlConnector.abreConexao());
		
		List<Registro> query = dbm.select("SELECT USUNOME,USUSENHA FROM TGPUSU WHERE USUNOME = '?'", new Object[] {userValue});
		
		for (Registro registro : query) {
			String sv = registro.getColumnAsString("USUNOME");
			Integer iv = registro.getColumnAsInteger("USUSENHA");
		}
	}

}
