package com.facebook.binaryresource;

import com.facebook.common.internal.Preconditions;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public class ByteArrayBinaryResource implements BinaryResource {
    private final byte[] mBytes;

    public ByteArrayBinaryResource(byte[] bytes) {
        this.mBytes = (byte[]) Preconditions.checkNotNull(bytes);
    }

    @Override // com.facebook.binaryresource.BinaryResource
    public long size() {
        return this.mBytes.length;
    }

    @Override // com.facebook.binaryresource.BinaryResource
    public InputStream openStream() throws IOException {
        return new ByteArrayInputStream(this.mBytes);
    }

    @Override // com.facebook.binaryresource.BinaryResource
    public byte[] read() {
        return this.mBytes;
    }
}
