package com.danikula.videocache;
/* loaded from: classes.dex */
public interface Source {
    void close() throws ProxyCacheException;

    int length() throws ProxyCacheException;

    void open(int i) throws ProxyCacheException;

    int read(byte[] bArr) throws ProxyCacheException;
}
