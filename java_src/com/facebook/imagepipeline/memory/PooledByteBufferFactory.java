package com.facebook.imagepipeline.memory;

import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public interface PooledByteBufferFactory {
    /* renamed from: newByteBuffer */
    PooledByteBuffer mo230newByteBuffer(int i);

    /* renamed from: newByteBuffer */
    PooledByteBuffer mo231newByteBuffer(InputStream inputStream) throws IOException;

    /* renamed from: newByteBuffer */
    PooledByteBuffer mo232newByteBuffer(InputStream inputStream, int i) throws IOException;

    /* renamed from: newByteBuffer */
    PooledByteBuffer mo233newByteBuffer(byte[] bArr);

    /* renamed from: newOutputStream */
    PooledByteBufferOutputStream mo234newOutputStream();

    /* renamed from: newOutputStream */
    PooledByteBufferOutputStream mo235newOutputStream(int i);
}
