package com.viscu.UI.util;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @ Create by ostreamBaba on 18-5-28
 * @ 论坛系统 明文加密工具
 */
public class MD5Util {
    private static final String SALT="TobeNo1"; //加盐 彩虹表破解
    public static String encode(String password){
        password+=SALT;
        MessageDigest MD5;
        try{
            MD5=MessageDigest.getInstance("MD5");
        }catch (NoSuchAlgorithmException e){
            throw new RuntimeException(e);
        }

        char[] charArray=password.toCharArray();
        byte[] byteArray=new byte[password.length()];

        for (int i = 0; i < password.length(); i++) {
            byteArray[i]=(byte)charArray[i];
        }

        byte[] Md5Array=MD5.digest(byteArray);

        StringBuilder hexValue=new StringBuilder();

        for (byte aMd5Array : Md5Array) {
            int val = (int) aMd5Array & 0xff;
            if (val < 16) {
                hexValue.append( "0" );
            }
            hexValue.append( Integer.toHexString( val ) );
        }
        return hexValue.toString();
    }

    public static void main(String[] args) {
        String MD5Password= MD5Util.encode("admin");
        System.out.println(MD5Password);
    }

}
