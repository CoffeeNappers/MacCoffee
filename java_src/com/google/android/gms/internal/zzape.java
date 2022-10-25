package com.google.android.gms.internal;

import java.math.BigInteger;
/* loaded from: classes2.dex */
public final class zzape extends zzaoy {
    private static final Class<?>[] bow = {Integer.TYPE, Long.TYPE, Short.TYPE, Float.TYPE, Double.TYPE, Byte.TYPE, Boolean.TYPE, Character.TYPE, Integer.class, Long.class, Short.class, Float.class, Double.class, Byte.class, Boolean.class, Character.class};
    private Object value;

    public zzape(Boolean bool) {
        setValue(bool);
    }

    public zzape(Number number) {
        setValue(number);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzape(Object obj) {
        setValue(obj);
    }

    public zzape(String str) {
        setValue(str);
    }

    private static boolean zza(zzape zzapeVar) {
        if (zzapeVar.value instanceof Number) {
            Number number = (Number) zzapeVar.value;
            return (number instanceof BigInteger) || (number instanceof Long) || (number instanceof Integer) || (number instanceof Short) || (number instanceof Byte);
        }
        return false;
    }

    private static boolean zzcm(Object obj) {
        if (obj instanceof String) {
            return true;
        }
        Class<?> cls = obj.getClass();
        for (Class<?> cls2 : bow) {
            if (cls2.isAssignableFrom(cls)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.gms.internal.zzaoy
    public Number aT() {
        return this.value instanceof String ? new zzapv((String) this.value) : (Number) this.value;
    }

    @Override // com.google.android.gms.internal.zzaoy
    public String aU() {
        return be() ? aT().toString() : bd() ? bc().toString() : (String) this.value;
    }

    @Override // com.google.android.gms.internal.zzaoy
    Boolean bc() {
        return (Boolean) this.value;
    }

    public boolean bd() {
        return this.value instanceof Boolean;
    }

    public boolean be() {
        return this.value instanceof Number;
    }

    public boolean bf() {
        return this.value instanceof String;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        zzape zzapeVar = (zzape) obj;
        if (this.value == null) {
            return zzapeVar.value == null;
        } else if (zza(this) && zza(zzapeVar)) {
            return aT().longValue() == zzapeVar.aT().longValue();
        } else if (!(this.value instanceof Number) || !(zzapeVar.value instanceof Number)) {
            return this.value.equals(zzapeVar.value);
        } else {
            double doubleValue = aT().doubleValue();
            double doubleValue2 = zzapeVar.aT().doubleValue();
            if (doubleValue == doubleValue2 || (Double.isNaN(doubleValue) && Double.isNaN(doubleValue2))) {
                z = true;
            }
            return z;
        }
    }

    @Override // com.google.android.gms.internal.zzaoy
    public boolean getAsBoolean() {
        return bd() ? bc().booleanValue() : Boolean.parseBoolean(aU());
    }

    @Override // com.google.android.gms.internal.zzaoy
    public double getAsDouble() {
        return be() ? aT().doubleValue() : Double.parseDouble(aU());
    }

    @Override // com.google.android.gms.internal.zzaoy
    public int getAsInt() {
        return be() ? aT().intValue() : Integer.parseInt(aU());
    }

    @Override // com.google.android.gms.internal.zzaoy
    public long getAsLong() {
        return be() ? aT().longValue() : Long.parseLong(aU());
    }

    public int hashCode() {
        if (this.value == null) {
            return 31;
        }
        if (zza(this)) {
            long longValue = aT().longValue();
            return (int) (longValue ^ (longValue >>> 32));
        } else if (!(this.value instanceof Number)) {
            return this.value.hashCode();
        } else {
            long doubleToLongBits = Double.doubleToLongBits(aT().doubleValue());
            return (int) (doubleToLongBits ^ (doubleToLongBits >>> 32));
        }
    }

    void setValue(Object obj) {
        if (obj instanceof Character) {
            this.value = String.valueOf(((Character) obj).charValue());
            return;
        }
        zzapq.zzbt((obj instanceof Number) || zzcm(obj));
        this.value = obj;
    }
}
