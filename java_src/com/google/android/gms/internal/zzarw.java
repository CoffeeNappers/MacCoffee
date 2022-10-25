package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public final class zzarw implements Cloneable {
    private static final zzarx btI = new zzarx();
    private boolean btJ;
    private int[] btK;
    private zzarx[] btL;
    private int mSize;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzarw() {
        this(10);
    }

    zzarw(int i) {
        this.btJ = false;
        int idealIntArraySize = idealIntArraySize(i);
        this.btK = new int[idealIntArraySize];
        this.btL = new zzarx[idealIntArraySize];
        this.mSize = 0;
    }

    private int idealByteArraySize(int i) {
        for (int i2 = 4; i2 < 32; i2++) {
            if (i <= (1 << i2) - 12) {
                return (1 << i2) - 12;
            }
        }
        return i;
    }

    private int idealIntArraySize(int i) {
        return idealByteArraySize(i * 4) / 4;
    }

    private boolean zza(int[] iArr, int[] iArr2, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            if (iArr[i2] != iArr2[i2]) {
                return false;
            }
        }
        return true;
    }

    private boolean zza(zzarx[] zzarxVarArr, zzarx[] zzarxVarArr2, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            if (!zzarxVarArr[i2].equals(zzarxVarArr2[i2])) {
                return false;
            }
        }
        return true;
    }

    private int zzahj(int i) {
        int i2 = 0;
        int i3 = this.mSize - 1;
        while (i2 <= i3) {
            int i4 = (i2 + i3) >>> 1;
            int i5 = this.btK[i4];
            if (i5 < i) {
                i2 = i4 + 1;
            } else if (i5 <= i) {
                return i4;
            } else {
                i3 = i4 - 1;
            }
        }
        return i2 ^ (-1);
    }

    /* renamed from: cp */
    public final zzarw clone() {
        int size = size();
        zzarw zzarwVar = new zzarw(size);
        System.arraycopy(this.btK, 0, zzarwVar.btK, 0, size);
        for (int i = 0; i < size; i++) {
            if (this.btL[i] != null) {
                zzarwVar.btL[i] = (zzarx) this.btL[i].clone();
            }
        }
        zzarwVar.mSize = size;
        return zzarwVar;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzarw)) {
            return false;
        }
        zzarw zzarwVar = (zzarw) obj;
        if (size() != zzarwVar.size()) {
            return false;
        }
        return zza(this.btK, zzarwVar.btK, this.mSize) && zza(this.btL, zzarwVar.btL, this.mSize);
    }

    public int hashCode() {
        int i = 17;
        for (int i2 = 0; i2 < this.mSize; i2++) {
            i = (((i * 31) + this.btK[i2]) * 31) + this.btL[i2].hashCode();
        }
        return i;
    }

    public boolean isEmpty() {
        return size() == 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int size() {
        return this.mSize;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(int i, zzarx zzarxVar) {
        int zzahj = zzahj(i);
        if (zzahj >= 0) {
            this.btL[zzahj] = zzarxVar;
            return;
        }
        int i2 = zzahj ^ (-1);
        if (i2 < this.mSize && this.btL[i2] == btI) {
            this.btK[i2] = i;
            this.btL[i2] = zzarxVar;
            return;
        }
        if (this.mSize >= this.btK.length) {
            int idealIntArraySize = idealIntArraySize(this.mSize + 1);
            int[] iArr = new int[idealIntArraySize];
            zzarx[] zzarxVarArr = new zzarx[idealIntArraySize];
            System.arraycopy(this.btK, 0, iArr, 0, this.btK.length);
            System.arraycopy(this.btL, 0, zzarxVarArr, 0, this.btL.length);
            this.btK = iArr;
            this.btL = zzarxVarArr;
        }
        if (this.mSize - i2 != 0) {
            System.arraycopy(this.btK, i2, this.btK, i2 + 1, this.mSize - i2);
            System.arraycopy(this.btL, i2, this.btL, i2 + 1, this.mSize - i2);
        }
        this.btK[i2] = i;
        this.btL[i2] = zzarxVar;
        this.mSize++;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzarx zzahh(int i) {
        int zzahj = zzahj(i);
        if (zzahj < 0 || this.btL[zzahj] == btI) {
            return null;
        }
        return this.btL[zzahj];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzarx zzahi(int i) {
        return this.btL[i];
    }
}
