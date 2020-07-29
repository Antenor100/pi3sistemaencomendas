package br.com.encomanager.util;

import org.json.JSONObject;

public class Registro {

	private String[] columns;
	private Object[] values;
	private Object[] valuesDataType;

	public Registro(String[] columns, Object[] values, String[] valuesDataType) {
		this.columns = columns;
		this.values = values;
		this.valuesDataType = valuesDataType;
	}
	
	public String[] getColumns() {
		return columns;
	}

	public Object[] getValues() {
		return values;
	}

	public Object[] getValuesDataType() {
		return valuesDataType;
	}
	
	public JSONObject getRegistroAsJson() {
		JSONObject registroAsJson = new JSONObject();		
		
		for (int i = 0; i < columns.length; i++) {
			registroAsJson.append(columns[i], values[i]);
			
		}	
		return registroAsJson;
	}
	
	public String getColumnAsString(String columnName) {
		Integer indexOfCollumn = buscaColunaIndex(columnName);
		String columnValue = null;
				
		if (indexOfCollumn != null) {
			columnValue = (String) this.values[indexOfCollumn];
		}
		
		if (columnName != null) {
			return columnValue;
		}
		
		return null;
	}
	
	public Integer getColumnAsInteger(String columnName) {
		Integer indexOfCollumn = buscaColunaIndex(columnName);
		Integer columnValue = null;
				
		if (indexOfCollumn != null) {
			columnValue = new Integer((String) this.values[indexOfCollumn]);
		}
		
		if (columnName != null) {
			return columnValue;
		}
		
		return null;
	}
	
	//Timestamp
	
	//bigdecimal
	
	//boolean
	
	private Integer buscaColunaIndex(String columnName) {
		Integer indexOfCollumn = null;
		
		for (int i = 0; i < this.columns.length; i++) {
			if (this.columns[i].equals(columnName)) indexOfCollumn = i;			
		}
		
		return indexOfCollumn;
	}
}
