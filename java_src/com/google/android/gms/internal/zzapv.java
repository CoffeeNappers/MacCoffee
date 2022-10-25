package com.google.android.gms.internal;

import java.math.BigDecimal;
/* loaded from: classes2.dex */
public final class zzapv extends Number {
    private final String value;

    public zzapv(String str) {
        this.value = str;
    }

    @Override // java.lang.Number
    public double doubleValue() {
        return Double.parseDouble(this.value);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzapv)) {
            return false;
        }
        zzapv zzapvVar = (zzapv) obj;
        return this.value == zzapvVar.value || this.value.equals(zzapvVar.value);
    }

    @Override // java.lang.Number
    public float floatValue() {
        return Float.parseFloat(this.value);
    }

    public int hashCode() {
        return this.value.hashCode();
    }

    @Override // java.lang.Number
    public int intValue() {
        try {
            return Integer.parseInt(this.value);
        } catch (NumberFormatException e) {
            try {
                return (int) Long.parseLong(this.value);
            } catch (NumberFormatException e2) {
                return new BigDecimal(this.value).intValue();
            }
        }
    }

    @Override // java.lang.Number
    public long longValue() {
        try {
            return Long.parseLong(this.value);
        } catch (NumberFormatException e) {
            return new BigDecimal(this.value).longValue();
        }
    }

    public String toString() {
        return this.value;
    }
}
