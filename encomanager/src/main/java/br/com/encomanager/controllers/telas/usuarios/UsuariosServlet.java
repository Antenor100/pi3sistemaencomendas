package br.com.encomanager.controllers.telas.usuarios;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import br.com.encomanager.util.Criptografia;

/**
 * Servlet implementation class UsuariosServlet
 */
@WebServlet("/UsuariosServlet")
public class UsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> operationProperties = makeMapWithOperationProperties(request);
		String fieldsName = operationProperties.get("fieldsName");		
		String fieldsValue = operationProperties.get("fieldsValue");		
		String[] fieldsValueArray = null;
		
		if (fieldsName.contains("USUSENHA")) {
			
			String[] fieldsNameArray = fieldsName.split(",");
			fieldsValueArray = fieldsValue.split(",");
			
			for (int i = 0; i < fieldsNameArray.length; i++) {
				if (fieldsNameArray[i].equals("USUSENHA")) {
					String senhaAntiga = fieldsValueArray[i];
					
					try {
						String senhaNova = Criptografia.criptografar(senhaAntiga);
						fieldsValueArray[i] = senhaNova;
					} catch (NoSuchAlgorithmException e) {
						e.printStackTrace();
					}
					
				}
			}
					
			String jsonString = request.getParameter("inputWithJson");
			JSONObject jo = new JSONObject(jsonString);
			
			for (String key : jo.keySet()) {
				if (key.equals("fieldsValue")) {
					jo.put("fieldsValue", fieldsValueArray);
				}
			}
			
			request.setAttribute("useAttribute", true);
			request.setAttribute("inputWithJson", jo.toString());
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/CrudServlet");
		rd.forward(request,response);
	}

	private Map<String, String> makeMapWithOperationProperties(HttpServletRequest request) {
		String jsonString = request.getParameter("inputWithJson");
		
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
		}
		
		return operationProperties;
	}
	
}