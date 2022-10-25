package com.facebook.cache.common;

import com.facebook.common.internal.ByteStreams;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes.dex */
public class WriterCallbacks {
    public static WriterCallback from(final InputStream is) {
        return new WriterCallback() { // from class: com.facebook.cache.common.WriterCallbacks.1
            @Override // com.facebook.cache.common.WriterCallback
            public void write(OutputStream os) throws IOException {
                ByteStreams.copy(is, os);
            }
        };
    }

    public static WriterCallback from(final byte[] data) {
        return new WriterCallback() { // from class: com.facebook.cache.common.WriterCallbacks.2
            @Override // com.facebook.cache.common.WriterCallback
            public void write(OutputStream os) throws IOException {
                os.write(data);
            }
        };
    }
}
