package com.my.target.core.utils;

import java.security.MessageDigest;
/* compiled from: EncryptionUtils.java */
/* loaded from: classes2.dex */
public final class f {
    public static String a(String str) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("md5");
            messageDigest.update(str.getBytes());
            byte[] digest = messageDigest.digest();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < digest.length; i++) {
                sb.append(String.format("%02X", Byte.valueOf(digest[i])));
            }
            return sb.toString().toLowerCase();
        } catch (Exception e) {
            return null;
        }
    }
}
