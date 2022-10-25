package com.google.android.gms.common.data;

import com.google.android.gms.common.internal.zzaa;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* loaded from: classes2.dex */
public class zzb<T> implements Iterator<T> {
    protected final DataBuffer<T> BR;
    protected int BS = -1;

    public zzb(DataBuffer<T> dataBuffer) {
        this.BR = (DataBuffer) zzaa.zzy(dataBuffer);
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return this.BS < this.BR.getCount() + (-1);
    }

    @Override // java.util.Iterator
    public T next() {
        if (!hasNext()) {
            throw new NoSuchElementException(new StringBuilder(46).append("Cannot advance the iterator beyond ").append(this.BS).toString());
        }
        DataBuffer<T> dataBuffer = this.BR;
        int i = this.BS + 1;
        this.BS = i;
        return dataBuffer.get(i);
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("Cannot remove elements from a DataBufferIterator");
    }
}
