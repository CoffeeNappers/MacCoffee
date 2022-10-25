package com.google.android.gms.common.data;

import java.util.NoSuchElementException;
/* loaded from: classes2.dex */
public class zzg<T> extends zzb<T> {
    private T Cn;

    public zzg(DataBuffer<T> dataBuffer) {
        super(dataBuffer);
    }

    @Override // com.google.android.gms.common.data.zzb, java.util.Iterator
    public T next() {
        if (!hasNext()) {
            throw new NoSuchElementException(new StringBuilder(46).append("Cannot advance the iterator beyond ").append(this.BS).toString());
        }
        this.BS++;
        if (this.BS == 0) {
            this.Cn = this.BR.get(0);
            if (!(this.Cn instanceof zzc)) {
                String valueOf = String.valueOf(this.Cn.getClass());
                throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 44).append("DataBuffer reference of type ").append(valueOf).append(" is not movable").toString());
            }
        } else {
            ((zzc) this.Cn).zzfy(this.BS);
        }
        return this.Cn;
    }
}
