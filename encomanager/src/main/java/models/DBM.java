package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DBM {
	//Atributos
	private Statement stm = null;
	
	//Construtores
	public DBM(Connection con) {
		try {
			Statement stm = con.createStatement();
			this.stm = stm;
			
		} catch (Exception e) {
			System.out.println("Erro ao criar Statement!");
			e.printStackTrace();
		}  
	}
	
	public DBM(Statement stm) {
		this.stm = stm;
	}
	
	//Metódos publicos
	
	//DQL functions
	
	//Select com colunas requeridas
	public List<?> select(String tableName, String requiredColumns) {
		try {                
	        //Prepara a string do SELECT
	        String sql = "SELECT " + requiredColumns + " FROM " + tableName;	       
	        
	        List<?> recordsList = getRecordsList(sql);	        
	        
	        return recordsList;
	        
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro ao executar select");
			return null;
		}
	}
		
	//Select com columas requeridas e clausula where
	public List<?> select(String tableName, String requiredColumns, String whereQuery) {
		try {                
	        //Prepara a string do SELECT
	        String sql = "SELECT " + requiredColumns + " FROM " + tableName + " WHERE " + whereQuery;	       
	        
	        List<?> recordsList = getRecordsList(sql);	        
	        
	        return recordsList;
	        
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro ao executar select");
			return null;
		}
	}
	
	//DML functions	
	
	//INSERT
	public void insert(String tableName, String requiredColumns, String stringValues) {
		try {                
	        //Prepara a string do INSERT
	        String sql = "INSERT INTO " + tableName + "("+ requiredColumns +") " + "VALUES(" + stringValues + ")";
	        
	        //Executa INSERT  
	        this.stm.executeUpdate(sql);
	        
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro ao executar insert");
		} 
	}
	
	//DELETE
	public void delete(String tableName, String deleteWhereCodition) {
		try {                
	        //Prepara a string do DELETE
	        String sql = "DELETE FROM " + tableName + " WHERE " + deleteWhereCodition ;
	       
	        //Executa DELETE  
	        this.stm.executeUpdate(sql);
	        
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro ao executar delete");
		} 
	}
	
	//UPDATE
	public void update(String tableName, String columnAndValueList, String updateWhereCondition) {
		try {                
	        //Prepara a string do UPDATE
	        String sql = "UPDATE " + tableName + " SET " + columnAndValueList + " WHERE " + updateWhereCondition;
	       
	        //Executa UPDATE  
	        this.stm.executeUpdate(sql);
	        
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro ao executar update");
		} 
	}
	
	//Métodos privados
	
	//Retorna lista com os registros do select
	private List<?> getRecordsList(String sql) throws Exception{
		ResultSet rs = this.stm.executeQuery(sql);
		
		List<List<Map<String, Object>>> resultadoQuery = new ArrayList<List<Map<String, Object>>>();
        
        while(rs.next() != false) {
        	int columnsCount = rs.getMetaData().getColumnCount();
        	
        	 List<Map<String, Object>> rowList = new ArrayList<Map<String,Object>>();
        	
        	for (int i = 1; i <= columnsCount; i++) {
        		String columnName = rs.getMetaData().getColumnName(i);
	        	Object columnValue = rs.getObject(i);
	        	
	        	Map<String, Object> columnMap = new HashMap<String, Object>();
	        	columnMap.put(columnName, columnValue);
	        	
	        	rowList.add(columnMap);
			}
    	
        	resultadoQuery.add(rowList);
        }      
        return resultadoQuery;
	}
}
