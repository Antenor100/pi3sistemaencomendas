package br.com.encomanager.util;

public class StringUtils {
	
	/**
	 * 
	 * @param query
	 * String que contem parâmetros que são passados utilizando o caracter "?". Ex: "O nome do usuário é ?".
	 * 
	 * @param params
	 * Array de Object que contem os parâmetros da string respectivamente. Ex: New Object[] {"joão"}.
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
