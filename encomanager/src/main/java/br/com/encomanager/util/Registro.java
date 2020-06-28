package br.com.encomanager.util;

public class Registro {

	private String[] columns;
	private Object[] values;
	
	public Registro(String[] columns, Object[] values) {
		this.columns = columns;
		this.values = values;
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
