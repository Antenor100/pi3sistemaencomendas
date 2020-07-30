package br.com.encomanager.controllers.crudtable;

import java.util.ArrayList;
import java.util.List;

import br.com.encomanager.models.conexao.MySqlConnector;
import br.com.encomanager.models.manipulacao.DBM;
import br.com.encomanager.util.Criptografia;
import br.com.encomanager.util.Registro;

public class CrudTableDAO {
	
	private String tableName;
	
	public CrudTableDAO(String tableName) {
		this.tableName = tableName;
	}
	
	public List<Registro> getAllRegisters() throws Exception {	
		DBM dbm = new DBM(MySqlConnector.abreConexao());
		
		List<Registro> listRegistro = dbm.select(this.tableName, "*");		
		
		MySqlConnector.fecharConexao();
		
		return listRegistro;
	}	
	
	public List<Registro> getFilteredRegisters(String tableName, String whereContidion) throws Exception {
		DBM dbm = new DBM(MySqlConnector.abreConexao());
		
		List<Registro> listRegistro = dbm.select(tableName, "*", whereContidion);
		
		MySqlConnector.fecharConexao();
		
		return listRegistro;
	}	
	
	public void updateRegister(String pkField, String pkValue, String pkFieldIsText, String[] fields, String[] fieldsValue, String[] fieldsDataType) throws Exception {	
		DBM dbm = new DBM(MySqlConnector.abreConexao());
		
		String[] columnAndValueArray = new String[fields.length];
		List<String> valuesTransformed = transformDataFromDB(fieldsValue, fieldsDataType);
		
		int count = 0;
		for (String value : valuesTransformed) {
			String groupColumnAndValue = fields[count] + "=" + value;
			columnAndValueArray[count] = groupColumnAndValue;
			count++;
		}
		
		String updateWhereCondition = null;
		
		if (pkFieldIsText != null && pkFieldIsText.equals("true")) {
			updateWhereCondition = pkField + "=" + "'" + pkValue + "'";
		} else {
			updateWhereCondition = pkField + "=" + pkValue;
		}
		
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < columnAndValueArray.length; i++) {
			sb.append(columnAndValueArray[i] + ",");
		}
		
		String columnAndValueFinalizedString = sb.toString().substring(0, sb.toString().length() - 1);
		
		dbm.update(this.tableName, columnAndValueFinalizedString, updateWhereCondition);
		
		MySqlConnector.fecharConexao();
	}	
	
	public void deleteRegister(String tableName, String pkField, String pkValue, String pkFieldIsText) throws Exception {	
		DBM dbm = new DBM(MySqlConnector.abreConexao());
		
		String deleteWhereCodition = null;
		
		if (pkFieldIsText != null && pkFieldIsText.equals("true")) {
			deleteWhereCodition = pkField + "=" + "'" + pkValue + "'";
		} else {
			deleteWhereCodition = pkField + "=" + pkValue;
		}
		
		dbm.delete(tableName, deleteWhereCodition);
		
		MySqlConnector.fecharConexao();
	}	
	
	public void persistNewRegister(String requiredColumns, String[] stringValues, String[] dataType) throws Exception {	
		DBM dbm = new DBM(MySqlConnector.abreConexao());
		
		String newRequiredColumns = requiredColumns;
		List<String> newStringValuesList = transformDataFromDB(stringValues, dataType);
		String newStringValues = newStringValuesList.toString().replace("[", "").replace("]", "");
		
		dbm.insert(this.tableName, newRequiredColumns, newStringValues);
		
		MySqlConnector.fecharConexao();	
	}
	
	public String[] getColunas(String tableName) throws Exception {
		DBM dbm = new DBM(MySqlConnector.abreConexao());
		
		String[] columnsArray = dbm.getTableColumns(tableName);
		
		MySqlConnector.fecharConexao();	
		
		return columnsArray;
	}

	private List<String> transformDataFromDB(String[] stringValues, String[] dataTypeArray) {
		List<String> transformedDataList = new ArrayList<String>();
		
		for (int i = 0; i < dataTypeArray.length; i++) {
			if (dataTypeArray[i].equals("checkbox")) {
				if (stringValues[i].equals("true")) {
					transformedDataList.add("1");
				} else {
					transformedDataList.add("0");
				}
						
			} else if (dataTypeArray[i].equals("date")) {
				transformedDataList.add("\'" + stringValues[i] + "\'");
				
			} else if (dataTypeArray[i].equals("email")) {
				transformedDataList.add("\'" + stringValues[i] + "\'");
				
			} else if (dataTypeArray[i].equals("number")) {
				transformedDataList.add(stringValues[i]);
				
			} else if (dataTypeArray[i].equals("password")) {
				transformedDataList.add("\'" + stringValues[i] + "\'");
				
			} else if (dataTypeArray[i].equals("text")) {
				transformedDataList.add("\'" + stringValues[i] + "\'");
				
			} else if (dataTypeArray[i].equals("time")) {
				transformedDataList.add("\'" + stringValues[i] + "\'");
			
			} else if (dataTypeArray[i].equals("datetime-local")) {
				String[] arrayDateTime = stringValues[i].split("T");
				
				if (arrayDateTime[1].split(":").length > 2) {arrayDateTime[1] = arrayDateTime[1].substring(0, arrayDateTime[1].length() - 3);}
				
				transformedDataList.add("STR_TO_DATE(\'" + arrayDateTime[0] + " " + arrayDateTime[1] + ":00" + "\', \'%Y-%m-%d %H:%i:%s\')");
			}		
		}
		
		return transformedDataList;
	}
}
