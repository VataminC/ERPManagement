package com.alliswell.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @Author: All is well
 */
public class MD5Util {

    private MD5Util(){}

    /**
     * 使用MD5对数据进行加密
     * @param str   要加密的数据
     */
    public static void MD5Digest(String str){
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] digest = md5.digest(str.getBytes());
            String s = MD5Util.convertByteToHexString(digest);
            System.out.println(s);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }


    private static String convertByteToHexString(byte[] bytes){
        String result = "";
        for (int i = 0; i < bytes.length; i++) {
            int temp = bytes[i] & 0xff;
            String tempHex = Integer.toHexString(temp);
            if(tempHex.length()<2){
                result += "0"+tempHex;
            }else{
                result += tempHex;
            }
        }
        return result;
    }
}
