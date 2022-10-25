package com.google.android.gms.tagmanager;
/* loaded from: classes2.dex */
class zzdl extends Number implements Comparable<zzdl> {
    private double aHO;
    private long aHP;
    private boolean aHQ = false;

    private zzdl(double d) {
        this.aHO = d;
    }

    private zzdl(long j) {
        this.aHP = j;
    }

    public static zzdl zza(Double d) {
        return new zzdl(d.doubleValue());
    }

    public static zzdl zzbv(long j) {
        return new zzdl(j);
    }

    public static zzdl zzpw(String str) throws NumberFormatException {
        try {
            return new zzdl(Long.parseLong(str));
        } catch (NumberFormatException e) {
            try {
                return new zzdl(Double.parseDouble(str));
            } catch (NumberFormatException e2) {
                throw new NumberFormatException(String.valueOf(str).concat(" is not a valid TypedNumber"));
            }
        }
    }

    @Override // java.lang.Number
    public byte byteValue() {
        return (byte) longValue();
    }

    @Override // java.lang.Number
    public double doubleValue() {
        return zzchc() ? this.aHP : this.aHO;
    }

    public boolean equals(Object obj) {
        return (obj instanceof zzdl) && compareTo((zzdl) obj) == 0;
    }

    @Override // java.lang.Number
    public float floatValue() {
        return (float) doubleValue();
    }

    public int hashCode() {
        return new Long(longValue()).hashCode();
    }

    @Override // java.lang.Number
    public int intValue() {
        return zzche();
    }

    @Override // java.lang.Number
    public long longValue() {
        return zzchd();
    }

    @Override // java.lang.Number
    public short shortValue() {
        return zzchf();
    }

    public String toString() {
        return zzchc() ? Long.toString(this.aHP) : Double.toString(this.aHO);
    }

    @Override // java.lang.Comparable
    /* renamed from: zza */
    public int compareTo(zzdl zzdlVar) {
        return (!zzchc() || !zzdlVar.zzchc()) ? Double.compare(doubleValue(), zzdlVar.doubleValue()) : new Long(this.aHP).compareTo(Long.valueOf(zzdlVar.aHP));
    }

    public boolean zzchb() {
        return !zzchc();
    }

    public boolean zzchc() {
        return this.aHQ;
    }

    public long zzchd() {
        return zzchc() ? this.aHP : (long) this.aHO;
    }

    public int zzche() {
        return (int) longValue();
    }

    public short zzchf() {
        return (short) longValue();
    }
}
