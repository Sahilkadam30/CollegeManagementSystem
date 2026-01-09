package com.college.servlet;

import java.security.MessageDigest;

public class PasswordUtil {
	 public static String encryptPassword(String password) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("SHA-256");
	            byte[] bytes = md.digest(password.getBytes());

	            StringBuilder sb = new StringBuilder();
	            for (byte b : bytes) {
	                sb.append(String.format("%02x", b));
	            }
	            return sb.toString();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
}
