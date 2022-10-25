package com.facebook.common.util;

import android.util.Base64;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/* loaded from: classes.dex */
public class SecureHashUtil {
    static final byte[] HEX_CHAR_TABLE = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102};

    public static String makeSHA1Hash(String text) {
        try {
            return makeSHA1Hash(text.getBytes("utf-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static String makeSHA1Hash(byte[] bytes) {
        return makeHash(bytes, CommonUtils.SHA1_INSTANCE);
    }

    public static String makeSHA256Hash(byte[] bytes) {
        return makeHash(bytes, "SHA-256");
    }

    public static String makeSHA1HashBase64(byte[] bytes) {
        try {
            MessageDigest md = MessageDigest.getInstance(CommonUtils.SHA1_INSTANCE);
            md.update(bytes, 0, bytes.length);
            byte[] sha1hash = md.digest();
            return Base64.encodeToString(sha1hash, 11);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static String makeMD5Hash(String text) {
        try {
            return makeMD5Hash(text.getBytes("utf-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static String makeMD5Hash(byte[] bytes) {
        return makeHash(bytes, CommonUtils.MD5_INSTANCE);
    }

    public static String convertToHex(byte[] raw) throws UnsupportedEncodingException {
        StringBuilder sb = new StringBuilder(raw.length);
        for (byte b : raw) {
            int v = b & 255;
            sb.append((char) HEX_CHAR_TABLE[v >>> 4]);
            sb.append((char) HEX_CHAR_TABLE[v & 15]);
        }
        return sb.toString();
    }

    private static String makeHash(byte[] bytes, String algorithm) {
        try {
            MessageDigest md = MessageDigest.getInstance(algorithm);
            md.update(bytes, 0, bytes.length);
            byte[] hash = md.digest();
            return convertToHex(hash);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e2) {
            throw new RuntimeException(e2);
        }
    }
}
