package br.com.encomanager.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Criptografia {
	public static String criptografar(String value) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(value.getBytes(), 0, value.length());
		return new BigInteger(1, md.digest()).toString(16);
	}
}
