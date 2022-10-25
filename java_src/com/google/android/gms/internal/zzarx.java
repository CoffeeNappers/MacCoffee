package com.google.android.gms.internal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzarx implements Cloneable {
    private zzarv<?, ?> btM;
    private List<zzasc> btN = new ArrayList();
    private Object value;

    private byte[] toByteArray() throws IOException {
        byte[] bArr = new byte[zzx()];
        zza(zzart.zzbe(bArr));
        return bArr;
    }

    /* renamed from: cq */
    public final zzarx clone() {
        int i = 0;
        zzarx zzarxVar = new zzarx();
        try {
            zzarxVar.btM = this.btM;
            if (this.btN == null) {
                zzarxVar.btN = null;
            } else {
                zzarxVar.btN.addAll(this.btN);
            }
            if (this.value != null) {
                if (this.value instanceof zzasa) {
                    zzarxVar.value = (zzasa) ((zzasa) this.value).clone();
                } else if (this.value instanceof byte[]) {
                    zzarxVar.value = ((byte[]) this.value).clone();
                } else if (this.value instanceof byte[][]) {
                    byte[][] bArr = (byte[][]) this.value;
                    byte[][] bArr2 = new byte[bArr.length];
                    zzarxVar.value = bArr2;
                    for (int i2 = 0; i2 < bArr.length; i2++) {
                        bArr2[i2] = (byte[]) bArr[i2].clone();
                    }
                } else if (this.value instanceof boolean[]) {
                    zzarxVar.value = ((boolean[]) this.value).clone();
                } else if (this.value instanceof int[]) {
                    zzarxVar.value = ((int[]) this.value).clone();
                } else if (this.value instanceof long[]) {
                    zzarxVar.value = ((long[]) this.value).clone();
                } else if (this.value instanceof float[]) {
                    zzarxVar.value = ((float[]) this.value).clone();
                } else if (this.value instanceof double[]) {
                    zzarxVar.value = ((double[]) this.value).clone();
                } else if (this.value instanceof zzasa[]) {
                    zzasa[] zzasaVarArr = (zzasa[]) this.value;
                    zzasa[] zzasaVarArr2 = new zzasa[zzasaVarArr.length];
                    zzarxVar.value = zzasaVarArr2;
                    while (true) {
                        int i3 = i;
                        if (i3 >= zzasaVarArr.length) {
                            break;
                        }
                        zzasaVarArr2[i3] = (zzasa) zzasaVarArr[i3].clone();
                        i = i3 + 1;
                    }
                }
            }
            return zzarxVar;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzarx)) {
            return false;
        }
        zzarx zzarxVar = (zzarx) obj;
        if (this.value != null && zzarxVar.value != null) {
            if (this.btM != zzarxVar.btM) {
                return false;
            }
            return !this.btM.bkp.isArray() ? this.value.equals(zzarxVar.value) : this.value instanceof byte[] ? Arrays.equals((byte[]) this.value, (byte[]) zzarxVar.value) : this.value instanceof int[] ? Arrays.equals((int[]) this.value, (int[]) zzarxVar.value) : this.value instanceof long[] ? Arrays.equals((long[]) this.value, (long[]) zzarxVar.value) : this.value instanceof float[] ? Arrays.equals((float[]) this.value, (float[]) zzarxVar.value) : this.value instanceof double[] ? Arrays.equals((double[]) this.value, (double[]) zzarxVar.value) : this.value instanceof boolean[] ? Arrays.equals((boolean[]) this.value, (boolean[]) zzarxVar.value) : Arrays.deepEquals((Object[]) this.value, (Object[]) zzarxVar.value);
        } else if (this.btN != null && zzarxVar.btN != null) {
            return this.btN.equals(zzarxVar.btN);
        } else {
            try {
                return Arrays.equals(toByteArray(), zzarxVar.toByteArray());
            } catch (IOException e) {
                throw new IllegalStateException(e);
            }
        }
    }

    public int hashCode() {
        try {
            return Arrays.hashCode(toByteArray()) + 527;
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zzart zzartVar) throws IOException {
        if (this.value != null) {
            this.btM.zza(this.value, zzartVar);
            return;
        }
        for (zzasc zzascVar : this.btN) {
            zzascVar.zza(zzartVar);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zzasc zzascVar) {
        this.btN.add(zzascVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Multi-variable type inference failed */
    public <T> T zzb(zzarv<?, T> zzarvVar) {
        if (this.value == null) {
            this.btM = zzarvVar;
            this.value = zzarvVar.zzay(this.btN);
            this.btN = null;
        } else if (!this.btM.equals(zzarvVar)) {
            throw new IllegalStateException("Tried to getExtension with a different Extension.");
        }
        return (T) this.value;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzx() {
        int i = 0;
        if (this.value != null) {
            return this.btM.zzct(this.value);
        }
        Iterator<zzasc> it = this.btN.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = it.next().zzx() + i2;
        }
    }
}
