package br.com.encomanager.util;

public class StringUtils {
	
	/**
	 * 
	 * @param query
	 * String que contem par�metros que s�o passados utilizando o caracter "?". Ex: "O nome do usu�rio � ?".
	 * 
	 * @param params
	 * Array de Object que contem os par�metros da string respectivamente. Ex: New Object[] {"jo�o"}.
	 * 
	 * @return String
	 */
	public static String stringWithParams(String query, Object[] params) {
		String[] dividedQuery = query.trim().split("\\?");
        
        StringBuilder sb = new StringBuilder();
        
        for (int i = 0; i < params.length; i++) {
			sb.append(dividedQuery[i] + params[i]);
			
			if (i+1 == params.length) {
				sb.append(dividedQuery[i+1]);
			}
		}
        
        return sb.toString().trim();
	}
	
}
