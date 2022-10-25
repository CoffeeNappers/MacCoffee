package com.google.android.gms.internal;

import java.util.Arrays;
/* loaded from: classes2.dex */
public class zzxf {
    private static final String TAG = zzxf.class.getSimpleName();
    private static final char[] azs = "0123456789abcdef".toCharArray();
    private final byte[] azn;

    public zzxf(byte[] bArr) {
        this.azn = bArr;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        try {
            return Arrays.equals(this.azn, ((zzxf) obj).getBytes());
        } catch (ClassCastException e) {
            return false;
        }
    }

    public byte[] getBytes() {
        return this.azn;
    }

    public int hashCode() {
        return Arrays.hashCode(this.azn) + 527;
    }

    public zzxf zzzr(int i) {
        return new zzxf(Arrays.copyOfRange(this.azn, 0, i));
    }
}
