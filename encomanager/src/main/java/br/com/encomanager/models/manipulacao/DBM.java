package br.com.encomanager.models.manipulacao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import br.com.encomanager.util.Registro;
import br.com.encomanager.util.StringUtils;

/**
 * 
 * Classe utilizada para executar operações no banco de dados. (Data Base
 * Manipulation).
 *
 */
public class DBM {
	// Atributos
	private Statement stm;
	private Connection con;
	
	// Construtores
	public DBM(Connection con) throws Exception {
		this.con = con;
		Statement stm = con.createStatement();
		this.stm = stm;
	}

	public DBM(Statement stm) {
		this.stm = stm;
	}

	// Metódos publicos

	// DQL functions

	/**
	 * 
	 * @param tableName       Nome da tabela alvo
	 * 
	 * @param requiredColumns Colunas que serão returnadas Ex: "column1, column2"
	 * 
	 * @return List<?>
	 */
	public List<Registro> select(String tableName, String requiredColumns) throws Exception {
		// Prepara a string do SELECT
		String sql = "SELECT " + requiredColumns + " FROM " + tableName;

		List<Registro> recordsList = getRecordsList(sql);

		return recordsList;
	}

	/**
	 * 
	 * @param tableName       Nome da tabela alvo
	 * 
	 * @param requiredColumns Colunas que serão returnadas Ex: "column1, column2"
	 * 
	 * @param whereQuery      Clausula where Ex: "column = 123"
	 * 
	 * @return List<?>
	 */
	public List<Registro> select(String tableName, String requiredColumns, String whereQuery) throws Exception {
		// Prepara a string do SELECT
		String sql = "SELECT " + requiredColumns + " FROM " + tableName + " WHERE " + whereQuery;

		List<Registro> recordsList = getRecordsList(sql);

		return recordsList;
	}

	/**
	 * 
	 * @param query      String com a query que aceita parâmetros Ex: "select * from
	 *                   table where column = ?"
	 * 
	 * @param parameters Array de objetos que possa ser convertido pra string, que
	 *                   contem os valores dos parâmetros respectivamente
	 * 
	 * @return List<?>
	 */
	public List<Registro> select(String query, Object[] parameters) throws Exception {
		String sqlFinal = StringUtils.stringWithParams(query, parameters);

		List<Registro> recordsList = getRecordsList(sqlFinal);

		return recordsList;
	}

	// DML functions

	/**
	 * 
	 * @param tableName       Nome da tabela alvo
	 * 
	 * @param requiredColumns Colunas que terão o seu valor setado Ex: "column1,
	 *                        column2"
	 * 
	 * @param stringValues    Valores das colunas passadas no parâmetro
	 *                        "requiredColumns" Ex: "1,'teste',null"
	 */
	public void insert(String tableName, String requiredColumns, String stringValues) throws Exception {
		// Prepara a string do INSERT
		String sql = "INSERT INTO " + tableName + "(" + requiredColumns + ") " + "VALUES(" + stringValues + ")";

		// Executa INSERT
		this.stm.executeUpdate(sql);
	}

	/**
	 * 
	 * @param tableName           Nome da tabela alvo
	 * 
	 * @param deleteWhereCodition Clausula "where" para remoção de registro Ex:
	 *                            "column = 1"
	 */
	public void delete(String tableName, String deleteWhereCodition) throws Exception {
		// Prepara a string do DELETE
		String sql = "DELETE FROM " + tableName + " WHERE " + deleteWhereCodition;

		// Executa DELETE
		this.stm.executeUpdate(sql);
	}

	/**
	 * 
	 * @param tableName            Nome da tabela alvo
	 * 
	 * @param columnAndValueList   String que contem as colunas e os valores para o
	 *                             update Ex: "column = 1, column2 = 'teste'"
	 * 
	 * @param updateWhereCondition
	 * 
	 */
	public void update(String tableName, String columnAndValueList, String updateWhereCondition) throws Exception {
		// Prepara a string do UPDATE
		String sql = "UPDATE " + tableName + " SET " + columnAndValueList + " WHERE " + updateWhereCondition;

		// Executa UPDATE
		this.stm.executeUpdate(sql);	
	}

	/**
	 * 
	 * @param query      String com a query que aceita parâmetros Ex: "update table
	 *                   set column = ? where column2 = ?"
	 * 
	 * @param parameters Array de objetos que possa ser convertido pra string, que
	 *                   contem os valores dos parâmetros respectivamente
	 * 
	 */
	public void execute(String query, Object[] parameters) throws Exception {
		String sqlFinal = StringUtils.stringWithParams(query, parameters);

		this.stm.execute(sqlFinal);	
	}

	/**
	 * @paramtableName     	Nome da tabela alvo.
	 * 
	 * @return 				String[] - Array de string
	 * 
	 */
	public String[] getTableColumns(String tableName) throws SQLException {
				
		ResultSet columns = this.con.getMetaData().getColumns(null,null, tableName, null);
		
		List<String> columnsList = new ArrayList<String>();
		
		while(columns.next()) {
			columnsList.add(columns.getString("COLUMN_NAME"));
		}	
			
		String[] arrayColunas = new String[columnsList.size()];
		
		int count = 0;
		for (String column : columnsList) {
			arrayColunas[count] = column;
			count++;
		}
		
		return arrayColunas;
	}
	
	// Métodos privados
	private List<Registro> getRecordsList(String sql) throws Exception {
		ResultSet rs = this.stm.executeQuery(sql);

		List<Registro> resultadoQuery = new ArrayList<Registro>();

		while (rs.next() != false) {
			int columnsCount = rs.getMetaData().getColumnCount();

			String[] columns = new String[columnsCount];
			Object[] values = new Object[columnsCount];
			String[] valuesDataType = new String[columnsCount];

			for (int i = 1; i <= columnsCount; i++) {
				columns[i - 1] = rs.getMetaData().getColumnName(i);
				values[i - 1] = rs.getObject(i);
				valuesDataType[i - 1] = rs.getMetaData().getColumnTypeName(i);
			}

			resultadoQuery.add(new Registro(columns, values, valuesDataType));
		}

		return resultadoQuery;
	}
}
