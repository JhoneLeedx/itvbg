package com.yxt.jhonelee.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by JhoneLee on 2016/10/26.
 */

public class Md5Util {

    //加密md5
    public static String EncoderByMd5(String str)  {
        //确定计算方法
        MessageDigest md5= null;
        String newstr=null;
        try {
            md5 = MessageDigest.getInstance("MD5");
            //加密后的字符串
            newstr=BASE64Encoder.encode(md5.digest(str.getBytes("utf-8")));
            return newstr;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return newstr;
    }
    /**判断用户密码是否正确
     * @param newpasswd  用户输入的密码
     * @param oldpasswd  数据库中存储的密码－－用户密码的摘要
     * @return
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     */
    public static boolean checkpassword(String newpasswd,String oldpasswd) throws NoSuchAlgorithmException, UnsupportedEncodingException{

        if(EncoderByMd5(newpasswd).equals(oldpasswd))
            return true;
        else
            return false;
    }
}
