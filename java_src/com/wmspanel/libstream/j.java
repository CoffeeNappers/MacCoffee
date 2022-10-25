package com.wmspanel.libstream;

import android.util.Log;
import java.nio.ByteBuffer;
/* loaded from: classes3.dex */
class j {
    private static final String TAG = "RtmpHelper";
    static final byte aQ = 3;
    static final byte aT = 2;
    static final byte aU = 1;
    static final byte aW = 20;
    static final byte bQ = 0;
    static final byte bR = 1;
    static final byte bS = 2;
    static final byte bT = 3;
    static final byte bU = 5;
    static final byte bV = 8;
    static final byte bW = 9;
    static final byte bX = 10;
    static final byte bY = 8;
    static final byte bZ = 2;
    static final byte ca = 3;
    static final byte cb = 5;
    static final byte cc = 6;
    static final byte cd = 4;
    static final byte ce = 4;
    static final byte cf = 6;
    static final byte cg = 7;
    static final byte ch = 8;
    static final byte ci = 9;
    static final byte cj = 18;

    j() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ByteBuffer byteBuffer, String str) {
        byteBuffer.put((byte) (str.length() >> 8));
        byteBuffer.put((byte) (str.length() & 255));
        byteBuffer.put(str.getBytes());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void b(ByteBuffer byteBuffer, String str) {
        byteBuffer.put((byte) 2);
        byteBuffer.put((byte) (str.length() >> 8));
        byteBuffer.put((byte) (str.length() & 255));
        byteBuffer.put(str.getBytes());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ByteBuffer byteBuffer, double d) {
        byteBuffer.put(bQ);
        byteBuffer.putDouble(d);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void f(ByteBuffer byteBuffer) {
        byteBuffer.put((byte) 5);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void g(ByteBuffer byteBuffer) {
        byteBuffer.put((byte) 3);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void h(ByteBuffer byteBuffer) {
        byteBuffer.put(bQ);
        byteBuffer.put(bQ);
        byteBuffer.put((byte) 9);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ByteBuffer byteBuffer, byte b) {
        byteBuffer.put((byte) 1);
        byteBuffer.put(b);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int c(ByteBuffer byteBuffer, int i) {
        return ((byteBuffer.get(i) & 255) << 16) | ((byteBuffer.get(i + 1) & 255) << 8) | (byteBuffer.get(i + 2) & 255);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void c(byte[] bArr, int i, int i2) {
        bArr[i] = (byte) (i2 >> 16);
        bArr[i + 1] = (byte) (i2 >> 8);
        bArr[i + 2] = (byte) i2;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void d(byte[] bArr, int i, int i2) {
        bArr[i] = (byte) i2;
        bArr[i + 1] = (byte) (i2 >> 8);
        bArr[i + 2] = (byte) (i2 >> 16);
        bArr[i + 3] = (byte) (i2 >> 24);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void e(byte[] bArr, int i, int i2) {
        bArr[i + 3] = (byte) i2;
        bArr[i + 2] = (byte) (i2 >> 8);
        bArr[i + 1] = (byte) (i2 >> 16);
        bArr[i] = (byte) (i2 >> 24);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int d(ByteBuffer byteBuffer, int i) {
        return ((byteBuffer.get(i) & 255) << 24) | ((byteBuffer.get(i + 1) & 255) << 16) | ((byteBuffer.get(i + 2) & 255) << 8) | (byteBuffer.get(i + 3) & 255);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int e(ByteBuffer byteBuffer, int i) {
        return ((byteBuffer.get(i + 3) & 255) << 24) | ((byteBuffer.get(i + 2) & 255) << 16) | ((byteBuffer.get(i + 1) & 255) << 8) | (byteBuffer.get(i) & 255);
    }

    /* loaded from: classes3.dex */
    static class a extends Exception {
        a() {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void f(ByteBuffer byteBuffer, int i) throws a {
        if (byteBuffer.get(i) != 5) {
            Log.e(TAG, "rtmp_read_null buffer not null[" + ((int) byteBuffer.get(i)) + "]");
            throw new a();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String g(ByteBuffer byteBuffer, int i) throws a {
        if (byteBuffer.position() - i < 3) {
            Log.e(TAG, "rtmp_read_string buffer too small[" + (byteBuffer.position() - i) + "]");
            throw new a();
        } else if (byteBuffer.get(i) != 2) {
            Log.e(TAG, "rtmp_read_string buffer not string[" + ((int) byteBuffer.get(i)) + "]");
            throw new a();
        } else {
            int i2 = ((byteBuffer.get(i + 1) & 255) << 8) | (byteBuffer.get(i + 2) & 255);
            if (i2 + 3 > byteBuffer.limit()) {
                throw new a();
            }
            return new String(byteBuffer.array(), i + 3, i2);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static double h(ByteBuffer byteBuffer, int i) throws a {
        if (byteBuffer.position() - i < 9) {
            Log.e(TAG, "rtmp_read_number buffer too small[" + (byteBuffer.position() - i) + "]");
            throw new a();
        } else if (byteBuffer.get(i) != 0) {
            Log.e(TAG, "rtmp_read_number buffer not number[" + ((int) byteBuffer.get(i)) + "]");
            throw new a();
        } else {
            return byteBuffer.getDouble(i + 1);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ByteBuffer byteBuffer, int i) {
        if (i >= byteBuffer.position()) {
            byteBuffer.position(0);
            return;
        }
        int position = byteBuffer.position() - i;
        for (int i2 = 0; i2 < position; i2++) {
            byteBuffer.put(i2, byteBuffer.get(i + i2));
        }
        byteBuffer.position(position);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void i(ByteBuffer byteBuffer, int i) throws a {
        if (byteBuffer.get(i) != 3) {
            Log.e(TAG, "object not foubd[" + ((int) byteBuffer.get(i)) + "]");
            throw new a();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int j(ByteBuffer byteBuffer, int i) throws a {
        return byteBuffer.get(i) == 2 ? 2 : -1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String k(ByteBuffer byteBuffer, int i) throws a {
        if (byteBuffer.position() - i < 3) {
            Log.e(TAG, "rtmp_get_field_name buffer too small[" + (byteBuffer.position() - i) + "]");
            throw new a();
        } else if (byteBuffer.get(i) == 0 && byteBuffer.get(i + 1) == 0) {
            if (byteBuffer.get(i + 2) != 9) {
                Log.e(TAG, "object end expected");
                throw new a();
            }
            return null;
        } else {
            int i2 = (byteBuffer.get(i + 1) & 255) | ((byteBuffer.get(i) & 255) << 8);
            if (i2 + 2 > byteBuffer.limit()) {
                throw new a();
            }
            return new String(byteBuffer.array(), i + 2, i2);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void i(ByteBuffer byteBuffer) {
        byteBuffer.position(0);
    }
}
