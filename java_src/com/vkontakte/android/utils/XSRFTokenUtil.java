package com.vkontakte.android.utils;

import com.vkontakte.android.VKApplication;
import java.security.MessageDigest;
import java.security.SecureRandom;
/* loaded from: classes3.dex */
public class XSRFTokenUtil {
    private static final String SECRET_ABC = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890";

    static {
        if (!VKApplication.context.getSharedPreferences(null, 0).contains("xsrf_secret")) {
            StringBuilder secret = new StringBuilder();
            SecureRandom rnd = new SecureRandom();
            for (int i = 0; i < 20; i++) {
                secret.append(SECRET_ABC.charAt(rnd.nextInt(SECRET_ABC.length())));
            }
            VKApplication.context.getSharedPreferences(null, 0).edit().putString("xsrf_secret", secret.toString()).commit();
        }
    }

    private static String convert(byte[] b) {
        String ret = new String();
        for (int i = 0; i < b.length; i++) {
            char[] hex = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
            ret = (ret + String.valueOf(hex[(b[i] & 240) >> 4])) + String.valueOf(hex[b[i] & 15]);
        }
        return ret;
    }

    private static String sha1(String h) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA1");
            byte[] s = md.digest(h.getBytes("UTF-8"));
            return convert(s);
        } catch (Exception e) {
            return "";
        }
    }

    private static String getSecret() {
        return VKApplication.context.getSharedPreferences(null, 0).getString("xsrf_secret", "");
    }

    public static String generateToken(Object param) {
        return sha1(getSecret() + param);
    }

    public static boolean verifyToken(String token, Object param) {
        return token != null && token.equals(sha1(new StringBuilder().append(getSecret()).append(param).toString()));
    }
}
