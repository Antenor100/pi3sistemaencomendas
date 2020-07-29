package br.com.encomanager.controllers.login;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.encomanager.models.conexao.MySqlConnector;
import br.com.encomanager.models.manipulacao.DBM;
import br.com.encomanager.util.Criptografia;
import br.com.encomanager.util.Registro;

@WebServlet("/ValidaLogin")
public class ValidaLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userValue;
	private String passwordValue;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			this.userValue = request.getParameter("inputUsuarioValue");
			this.passwordValue = request.getParameter("inputSenhaValue");
			
			DBM dbm = new DBM(MySqlConnector.abreConexao());
			
			List<Registro> query = dbm.select("SELECT USUNOME,USUSENHA FROM TGPUSU WHERE USUNOME = '?'", new Object[] {this.userValue});
			
			if (query.size() == 0) {
				request.setAttribute("erro", "usuario");
				
				this.returnFormValues(request);
				
				request.getRequestDispatcher("/login/login.jsp").forward(request, response);
				
			} else {
				for (Registro registro : query) {
					String registroSenha = registro.getColumnAsString("USUSENHA");
					
					String criptPasswordValue = null;
					
					try {
						criptPasswordValue = Criptografia.criptografar(this.passwordValue);
						
					} catch (NoSuchAlgorithmException e) {
						e.printStackTrace();
					}
					
					if (criptPasswordValue.equals(registroSenha)) {
						request.getRequestDispatcher("/home/home.jsp").forward(request, response);
						
					} else {
						request.setAttribute("erro", "senha");
						
						this.returnFormValues(request);
						
						request.getRequestDispatcher("/login/login.jsp").forward(request, response);
					}
				}	
			}	
			
			MySqlConnector.fecharConexao();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	private void returnFormValues(HttpServletRequest request) {
		request.setAttribute("usuario", this.userValue);
		request.setAttribute("senha", this.passwordValue);
	}	
}
