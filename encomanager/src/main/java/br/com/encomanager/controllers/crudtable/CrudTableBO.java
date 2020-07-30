package br.com.encomanager.controllers.crudtable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import br.com.encomanager.util.Registro;

public class CrudTableBO {
	
	private String tableName;
	private String[] columnsDescricao;
	private String[] columnsDataType;
	private String pkField;
	private String servletClassName;
	private CrudTableDAO ctd;
	private String jspName;
	private String pkFieldIsText;
	private String whereCondition;
	
	public CrudTableBO(String tableName) {
		this.tableName = tableName;
		this.ctd = new CrudTableDAO(this.tableName);
	}
	
	public CrudTableBO(String tableName, String[] columnsDescricao, String[] columnsDataType, String pkField, String servletClassName, String jspName, String pkFieldIsText) {
		this.tableName = tableName;
		this.columnsDescricao = columnsDescricao;
		this.columnsDataType = columnsDataType;
		this.pkField = pkField;
		this.servletClassName = servletClassName;
		this.ctd = new CrudTableDAO(this.tableName);
		this.jspName = jspName;
		this.pkFieldIsText = pkFieldIsText;
	}
	
	public String getInitialJson(boolean retornaRegistros) throws Exception {
		
		//JSON base para tela
		JSONObject registrosJson = new JSONObject();
		
		//Lista de objetos com valores
		List<Object[]> arrayValoresRegistro = new ArrayList<Object[]>();
		
		if (retornaRegistros) {
			List<Registro> query = this.ctd.getAllRegisters();
		
			for (Registro registro : query) {
				arrayValoresRegistro.add(registro.getValues());
			}		
		}
		
		registrosJson.accumulate("values", arrayValoresRegistro);		
		registrosJson.accumulate("columns", this.ctd.getColunas(this.tableName));	
		registrosJson.accumulate("columnsDescricao", this.columnsDescricao);
		registrosJson.accumulate("columnsDataType", this.columnsDataType);
		registrosJson.accumulate("pkField", this.pkField);
		registrosJson.accumulate("servletClassName", this.servletClassName);
		registrosJson.accumulate("tableName", this.tableName);
		registrosJson.accumulate("jspName", this.jspName);
		registrosJson.accumulate("pkFieldIsText", this.pkFieldIsText);
		
		return registrosJson.toString();	
	}
	
	public String getValues(String whereContidion) throws Exception {
		List<Registro> registros = ctd.getFilteredRegisters(this.tableName, whereContidion);
		
		//JSON base para tela
		JSONObject registrosJson = new JSONObject();
		
		List<Object[]> arrayValoresRegistros = new ArrayList<Object[]>();
		
		for (Registro registro : registros) {
			arrayValoresRegistros.add(registro.getValues());
		}		
		
		registrosJson.accumulate("values", arrayValoresRegistros);

		return registrosJson.toString();
	}

	public void createNewRegister(Map<String, String> mapNewData) throws Exception {
		String requiredColumns = mapNewData.get("fieldsName");
		String[] stringValues = mapNewData.get("fieldsValue").split(",");
		String[] dataType = mapNewData.get("fieldsDataType").split(",");
			
		this.ctd.persistNewRegister(requiredColumns, stringValues, dataType);
	}

	public void updateRegister(Map<String, String> mapNewData) throws Exception {
		this.ctd.updateRegister(mapNewData.get("pkFieldName"), mapNewData.get("pkFieldValue"), mapNewData.get("pkFieldIsText"), mapNewData.get("fieldsName").split(","),  mapNewData.get("fieldsValue").split(","),  mapNewData.get("fieldsDataType").split(","));
	}

	public void deleteRegister(Map<String, String> mapNewData) throws Exception {
		ctd.deleteRegister(mapNewData.get("tableName"), mapNewData.get("pkFieldName"), mapNewData.get("pkFieldValue"), mapNewData.get("pkFieldIsText"));
	}

}
