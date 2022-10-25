package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public final class zzaov extends zzaoy implements Iterable<zzaoy> {
    private final List<zzaoy> aOH = new ArrayList();

    @Override // com.google.android.gms.internal.zzaoy
    public Number aT() {
        if (this.aOH.size() == 1) {
            return this.aOH.get(0).aT();
        }
        throw new IllegalStateException();
    }

    @Override // com.google.android.gms.internal.zzaoy
    public String aU() {
        if (this.aOH.size() == 1) {
            return this.aOH.get(0).aU();
        }
        throw new IllegalStateException();
    }

    public boolean equals(Object obj) {
        return obj == this || ((obj instanceof zzaov) && ((zzaov) obj).aOH.equals(this.aOH));
    }

    @Override // com.google.android.gms.internal.zzaoy
    public boolean getAsBoolean() {
        if (this.aOH.size() == 1) {
            return this.aOH.get(0).getAsBoolean();
        }
        throw new IllegalStateException();
    }

    @Override // com.google.android.gms.internal.zzaoy
    public double getAsDouble() {
        if (this.aOH.size() == 1) {
            return this.aOH.get(0).getAsDouble();
        }
        throw new IllegalStateException();
    }

    @Override // com.google.android.gms.internal.zzaoy
    public int getAsInt() {
        if (this.aOH.size() == 1) {
            return this.aOH.get(0).getAsInt();
        }
        throw new IllegalStateException();
    }

    @Override // com.google.android.gms.internal.zzaoy
    public long getAsLong() {
        if (this.aOH.size() == 1) {
            return this.aOH.get(0).getAsLong();
        }
        throw new IllegalStateException();
    }

    public int hashCode() {
        return this.aOH.hashCode();
    }

    @Override // java.lang.Iterable
    public Iterator<zzaoy> iterator() {
        return this.aOH.iterator();
    }

    public int size() {
        return this.aOH.size();
    }

    public zzaoy zzagm(int i) {
        return this.aOH.get(i);
    }

    public void zzc(zzaoy zzaoyVar) {
        if (zzaoyVar == null) {
            zzaoyVar = zzapa.bou;
        }
        this.aOH.add(zzaoyVar);
    }
}
