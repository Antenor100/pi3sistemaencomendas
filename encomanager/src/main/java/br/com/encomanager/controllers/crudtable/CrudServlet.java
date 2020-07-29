package br.com.encomanager.controllers.crudtable;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class UsuariosServlet
 */
@WebServlet("/CrudServlet")
public class CrudServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> operationProperties = makeMapWithOperationProperties(request);
		String crudTipoOperacao = operationProperties.get("crudTipoOperacao");
		
		CrudTableBO ctb = new CrudTableBO(operationProperties.get("tableName"));
		
		try {
			if (crudTipoOperacao.equals("create")) {
				ctb.createNewRegister(operationProperties);
				request.setAttribute("sucesso", "O registro foi adicionado!");
				
			} else if (crudTipoOperacao.equals("update")) {
				ctb.updateRegister(operationProperties);
				request.setAttribute("sucesso", "O registro foi alterado!");
				
			} else if (crudTipoOperacao.equals("delete")) {
				ctb.deleteRegister(operationProperties);
				request.setAttribute("sucesso", "O registro foi removido!");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erro", e.getMessage());
		
		} finally {
			request.getRequestDispatcher(request.getParameter("jspName")).forward(request, response);
		}
	}

	private Map<String, String> makeMapWithOperationProperties(HttpServletRequest request) {
		
		Boolean useAttribute = (Boolean) request.getAttribute("useAttribute");
		
		String jsonString = null;
		
		if (useAttribute != null && useAttribute) {
			jsonString = (String) request.getAttribute("inputWithJson");
		} else {
			jsonString = request.getParameter("inputWithJson");				
		}
		
		
		JSONObject jo = new JSONObject(jsonString);
		
		Map<String, String> operationProperties = new HashMap<String, String>();
		
		operationProperties.put("crudTipoOperacao", jo.get("crudTipoOperacao").toString());
		operationProperties.put("tableName", jo.get("tableName").toString());
		
		operationProperties.put("fieldsName", jo.get("fieldsName").toString().replace("[", "").replace("]", "").replaceAll("\"", ""));
		operationProperties.put("fieldsValue", jo.get("fieldsValue").toString().replace("[", "").replace("]", "").replaceAll("\"", ""));
		operationProperties.put("fieldsDataType", jo.get("fieldsDataType").toString().replace("[", "").replace("]", "").replaceAll("\"", ""));
		
		if (!jo.isNull("pkFieldName") && !jo.isNull("pkFieldValue")) {
			operationProperties.put("pkFieldName", jo.get("pkFieldName").toString());
			operationProperties.put("pkFieldValue", jo.get("pkFieldValue").toString());
			operationProperties.put("pkFieldIsText", jo.get("pkFieldIsText").toString());
		}
		
		return operationProperties;
	}
	
}
