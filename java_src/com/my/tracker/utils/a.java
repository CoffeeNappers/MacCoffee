package com.my.tracker.utils;

import java.security.MessageDigest;
/* compiled from: EncryptionUtils.java */
/* loaded from: classes2.dex */
public final class a {
    public static String a(String str) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("md5");
            messageDigest.update(str.getBytes());
            byte[] digest = messageDigest.digest();
            StringBuilder sb = new StringBuilder();
            int length = digest.length;
            for (int i = 0; i < length; i++) {
                sb.append(String.format("%02X", Byte.valueOf(digest[i])));
            }
            return sb.toString().toLowerCase();
        } catch (Exception e) {
            return null;
        }
    }
}
