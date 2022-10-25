package com.mp4parser.streaming;

import java.nio.ByteBuffer;
/* loaded from: classes2.dex */
public interface StreamingSample {
    ByteBuffer getContent();

    long getDuration();

    SampleExtension[] getExtensions();
}
