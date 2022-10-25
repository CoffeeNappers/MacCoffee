package com.facebook.common.webp;

import android.graphics.BitmapFactory;
import android.os.Build;
import android.util.Base64;
import java.io.UnsupportedEncodingException;
/* loaded from: classes.dex */
public class WebpSupportStatus {
    private static final int EXTENDED_WEBP_HEADER_LENGTH = 21;
    private static final int SIMPLE_WEBP_HEADER_LENGTH = 20;
    private static final String VP8X_WEBP_BASE64 = "UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA==";
    private static final byte[] WEBP_NAME_BYTES;
    private static final byte[] WEBP_RIFF_BYTES;
    private static final byte[] WEBP_VP8L_BYTES;
    private static final byte[] WEBP_VP8X_BYTES;
    private static final byte[] WEBP_VP8_BYTES;
    public static final boolean sIsExtendedWebpSupported;
    public static final boolean sIsSimpleWebpSupported;
    public static final boolean sIsWebpSupportRequired;
    public static WebpBitmapFactory sWebpBitmapFactory;
    private static boolean sWebpLibraryChecked;
    public static boolean sWebpLibraryPresent;

    static {
        boolean z = true;
        sIsWebpSupportRequired = Build.VERSION.SDK_INT <= 17;
        if (Build.VERSION.SDK_INT < 14) {
            z = false;
        }
        sIsSimpleWebpSupported = z;
        sIsExtendedWebpSupported = isExtendedWebpSupported();
        sWebpBitmapFactory = null;
        sWebpLibraryPresent = false;
        sWebpLibraryChecked = false;
        WEBP_RIFF_BYTES = asciiBytes("RIFF");
        WEBP_NAME_BYTES = asciiBytes("WEBP");
        WEBP_VP8_BYTES = asciiBytes("VP8 ");
        WEBP_VP8L_BYTES = asciiBytes("VP8L");
        WEBP_VP8X_BYTES = asciiBytes("VP8X");
    }

    public static WebpBitmapFactory loadWebpBitmapFactoryIfExists() {
        if (sWebpLibraryChecked) {
            WebpBitmapFactory loadedWebpBitmapFactory = sWebpBitmapFactory;
            return loadedWebpBitmapFactory;
        }
        WebpBitmapFactory loadedWebpBitmapFactory2 = null;
        try {
            loadedWebpBitmapFactory2 = (WebpBitmapFactory) Class.forName("com.facebook.webpsupport.WebpBitmapFactoryImpl").newInstance();
        } catch (Throwable th) {
        }
        sWebpLibraryChecked = true;
        return loadedWebpBitmapFactory2;
    }

    private static byte[] asciiBytes(String value) {
        try {
            return value.getBytes("ASCII");
        } catch (UnsupportedEncodingException uee) {
            throw new RuntimeException("ASCII not found!", uee);
        }
    }

    private static boolean isExtendedWebpSupported() {
        if (Build.VERSION.SDK_INT < 17) {
            return false;
        }
        if (Build.VERSION.SDK_INT == 17) {
            byte[] decodedBytes = Base64.decode(VP8X_WEBP_BASE64, 0);
            BitmapFactory.Options opts = new BitmapFactory.Options();
            opts.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(decodedBytes, 0, decodedBytes.length, opts);
            if (opts.outHeight != 1 || opts.outWidth != 1) {
                return false;
            }
        }
        return true;
    }

    public static boolean isWebpSupportedByPlatform(byte[] imageHeaderBytes, int offset, int headerSize) {
        if (isSimpleWebpHeader(imageHeaderBytes, offset)) {
            return sIsSimpleWebpSupported;
        }
        if (isLosslessWebpHeader(imageHeaderBytes, offset)) {
            return sIsExtendedWebpSupported;
        }
        if (isExtendedWebpHeader(imageHeaderBytes, offset, headerSize) && !isAnimatedWebpHeader(imageHeaderBytes, offset)) {
            return sIsExtendedWebpSupported;
        }
        return false;
    }

    public static boolean isAnimatedWebpHeader(byte[] imageHeaderBytes, int offset) {
        boolean isVp8x = matchBytePattern(imageHeaderBytes, offset + 12, WEBP_VP8X_BYTES);
        boolean hasAnimationBit = (imageHeaderBytes[offset + 20] & 2) == 2;
        return isVp8x && hasAnimationBit;
    }

    public static boolean isSimpleWebpHeader(byte[] imageHeaderBytes, int offset) {
        return matchBytePattern(imageHeaderBytes, offset + 12, WEBP_VP8_BYTES);
    }

    public static boolean isLosslessWebpHeader(byte[] imageHeaderBytes, int offset) {
        return matchBytePattern(imageHeaderBytes, offset + 12, WEBP_VP8L_BYTES);
    }

    public static boolean isExtendedWebpHeader(byte[] imageHeaderBytes, int offset, int headerSize) {
        return headerSize >= 21 && matchBytePattern(imageHeaderBytes, offset + 12, WEBP_VP8X_BYTES);
    }

    public static boolean isExtendedWebpHeaderWithAlpha(byte[] imageHeaderBytes, int offset) {
        boolean isVp8x = matchBytePattern(imageHeaderBytes, offset + 12, WEBP_VP8X_BYTES);
        boolean hasAlphaBit = (imageHeaderBytes[offset + 20] & 16) == 16;
        return isVp8x && hasAlphaBit;
    }

    public static boolean isWebpHeader(byte[] imageHeaderBytes, int offset, int headerSize) {
        return headerSize >= 20 && matchBytePattern(imageHeaderBytes, offset, WEBP_RIFF_BYTES) && matchBytePattern(imageHeaderBytes, offset + 8, WEBP_NAME_BYTES);
    }

    private static boolean matchBytePattern(byte[] byteArray, int offset, byte[] pattern) {
        if (pattern == null || byteArray == null || pattern.length + offset > byteArray.length) {
            return false;
        }
        for (int i = 0; i < pattern.length; i++) {
            if (byteArray[i + offset] != pattern[i]) {
                return false;
            }
        }
        return true;
    }
}
