package com.wmspanel.libstream;

import io.fabric.sdk.android.services.common.CommonUtils;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/* loaded from: classes3.dex */
class o {
    private static final String TAG = "Utils";

    o() {
    }

    public static String g(byte[] bArr, int i, int i2) {
        if (i >= bArr.length) {
            return "";
        }
        if (i2 > bArr.length - i) {
            i2 = bArr.length - i;
        }
        StringBuilder sb = new StringBuilder(i2 * 2);
        for (int i3 = i; i3 < i + i2; i3++) {
            sb.append(String.format("%02x", Byte.valueOf(bArr[i3])));
        }
        return sb.toString();
    }

    public static String g(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest messageDigest = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
        messageDigest.update(str.getBytes("US-ASCII"));
        byte[] digest = messageDigest.digest();
        return g(digest, 0, digest.length);
    }

    public static int a(ByteBuffer byteBuffer, byte[] bArr) {
        boolean z;
        for (int position = byteBuffer.position(); position < byteBuffer.limit(); position++) {
            for (int i = 0; i < bArr.length && position + i < byteBuffer.limit(); i++) {
                if (byteBuffer.get(position + i) != bArr[i]) {
                    z = false;
                    break;
                }
            }
            z = true;
            if (z) {
                return position;
            }
        }
        return -1;
    }

    public static boolean b(ByteBuffer byteBuffer, byte[] bArr) {
        boolean z;
        if (byteBuffer.limit() - byteBuffer.position() < bArr.length) {
            return false;
        }
        int i = 0;
        while (true) {
            if (i >= bArr.length) {
                z = true;
                break;
            } else if (byteBuffer.get(byteBuffer.position() + i) != bArr[i]) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        if (!z) {
            return false;
        }
        byteBuffer.position(byteBuffer.position() + bArr.length);
        return true;
    }
}
