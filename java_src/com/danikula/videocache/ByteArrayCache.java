package com.danikula.videocache;

import java.io.ByteArrayInputStream;
import java.util.Arrays;
/* loaded from: classes.dex */
public class ByteArrayCache implements Cache {
    private volatile boolean completed;
    private volatile byte[] data;

    public ByteArrayCache() {
        this(new byte[0]);
    }

    public ByteArrayCache(byte[] data) {
        this.data = (byte[]) Preconditions.checkNotNull(data);
    }

    @Override // com.danikula.videocache.Cache
    public int read(byte[] buffer, long offset, int length) throws ProxyCacheException {
        if (offset >= this.data.length) {
            return -1;
        }
        if (offset > 2147483647L) {
            throw new IllegalArgumentException("Too long offset for memory cache " + offset);
        }
        return new ByteArrayInputStream(this.data).read(buffer, (int) offset, length);
    }

    @Override // com.danikula.videocache.Cache
    public int available() throws ProxyCacheException {
        return this.data.length;
    }

    @Override // com.danikula.videocache.Cache
    public void append(byte[] newData, int length) throws ProxyCacheException {
        Preconditions.checkNotNull(this.data);
        Preconditions.checkArgument(length >= 0 && length <= newData.length);
        byte[] appendedData = Arrays.copyOf(this.data, this.data.length + length);
        System.arraycopy(newData, 0, appendedData, this.data.length, length);
        this.data = appendedData;
    }

    @Override // com.danikula.videocache.Cache
    public void close() throws ProxyCacheException {
    }

    @Override // com.danikula.videocache.Cache
    public void complete() {
        this.completed = true;
    }

    @Override // com.danikula.videocache.Cache
    public boolean isCompleted() {
        return this.completed;
    }
}
