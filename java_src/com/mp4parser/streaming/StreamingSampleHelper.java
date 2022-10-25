package com.mp4parser.streaming;
/* loaded from: classes2.dex */
public class StreamingSampleHelper {
    static boolean hasSampleExtension(StreamingSample streamingSample, Class<? extends SampleExtension> clazz) {
        SampleExtension[] extensions;
        for (SampleExtension sampleExtension : streamingSample.getExtensions()) {
            if (clazz.isAssignableFrom(sampleExtension.getClass())) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static <B extends SampleExtension> B getSampleExtension(StreamingSample streamingSample, Class<B> clazz) {
        for (SampleExtension sampleExtension : streamingSample.getExtensions()) {
            B b = (B) sampleExtension;
            if (clazz.isAssignableFrom(b.getClass())) {
                return b;
            }
        }
        return null;
    }
}
