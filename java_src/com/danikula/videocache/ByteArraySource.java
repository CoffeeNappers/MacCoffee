package com.danikula.videocache;

import java.io.ByteArrayInputStream;
/* loaded from: classes.dex */
public class ByteArraySource implements Source {
    private ByteArrayInputStream arrayInputStream;
    private final byte[] data;

    public ByteArraySource(byte[] data) {
        this.data = data;
    }

    @Override // com.danikula.videocache.Source
    public int read(byte[] buffer) throws ProxyCacheException {
        return this.arrayInputStream.read(buffer, 0, buffer.length);
    }

    @Override // com.danikula.videocache.Source
    public int length() throws ProxyCacheException {
        return this.data.length;
    }

    @Override // com.danikula.videocache.Source
    public void open(int offset) throws ProxyCacheException {
        this.arrayInputStream = new ByteArrayInputStream(this.data);
        this.arrayInputStream.skip(offset);
    }

    @Override // com.danikula.videocache.Source
    public void close() throws ProxyCacheException {
    }
}
