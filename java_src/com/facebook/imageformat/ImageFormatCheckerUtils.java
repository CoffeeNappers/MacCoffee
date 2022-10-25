package com.facebook.imageformat;

import com.facebook.common.internal.Preconditions;
import java.io.UnsupportedEncodingException;
/* loaded from: classes.dex */
public class ImageFormatCheckerUtils {
    public static byte[] asciiBytes(String value) {
        Preconditions.checkNotNull(value);
        try {
            return value.getBytes("ASCII");
        } catch (UnsupportedEncodingException uee) {
            throw new RuntimeException("ASCII not found!", uee);
        }
    }

    public static boolean startsWithPattern(byte[] byteArray, byte[] pattern) {
        Preconditions.checkNotNull(byteArray);
        Preconditions.checkNotNull(pattern);
        if (pattern.length > byteArray.length) {
            return false;
        }
        for (int i = 0; i < pattern.length; i++) {
            if (byteArray[i] != pattern[i]) {
                return false;
            }
        }
        return true;
    }

    private ImageFormatCheckerUtils() {
    }
}
