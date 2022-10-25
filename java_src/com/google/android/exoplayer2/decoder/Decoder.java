package com.google.android.exoplayer2.decoder;

import java.lang.Exception;
/* loaded from: classes.dex */
public interface Decoder<I, O, E extends Exception> {
    /* renamed from: dequeueInputBuffer */
    I mo369dequeueInputBuffer() throws Exception;

    /* renamed from: dequeueOutputBuffer */
    O mo370dequeueOutputBuffer() throws Exception;

    void flush();

    String getName();

    void queueInputBuffer(I i) throws Exception;

    void release();
}
