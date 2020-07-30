package br.com.encomanager.controllers.telas.agendaEncomendas;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.encomanager.controllers.crudtable.CrudTableBO;

/**
 * Servlet implementation class AgendaEncomendasServlet
 */
@WebServlet("/AgendaEncomendasServlet")
public class AgendaEncomendasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgendaEncomendasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tableNameDois = request.getParameter("tableNameDois");
		String whereConditionTableDois = request.getParameter("whereConditionTableDois");
		
		String tableNameTres = request.getParameter("tableNameTres");
		String whereConditionTableTres = request.getParameter("whereConditionTableTres");
		
		String selectedRowIndex = request.getParameter("selectedRowIndex");
		
		try {
			CrudTableBO ctb1 = new CrudTableBO(tableNameDois);
			CrudTableBO ctb2 = new CrudTableBO(tableNameTres);
			request.setAttribute("valuesTable2", ctb1.getValues(whereConditionTableDois));
			request.setAttribute("valuesTable3", ctb2.getValues(whereConditionTableTres));
		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erro2", e.getMessage());
		
		} finally {
			request.setAttribute("selectedRowIndex", selectedRowIndex);
			request.getRequestDispatcher("/telas/gerarEncomenda/gerarEncomenda.jsp").forward(request, response);
		}
	}
	
}
