package com.facebook.imagepipeline.memory;
/* loaded from: classes.dex */
public class BitmapCounterProvider {
    private static final long KB = 1024;
    public static final int MAX_BITMAP_COUNT = 384;
    public static final int MAX_BITMAP_TOTAL_SIZE = getMaxSizeHardCap();
    private static final long MB = 1048576;
    private static BitmapCounter sBitmapCounter;

    private static int getMaxSizeHardCap() {
        int maxMemory = (int) Math.min(Runtime.getRuntime().maxMemory(), 2147483647L);
        return ((long) maxMemory) > 16777216 ? (maxMemory / 4) * 3 : maxMemory / 2;
    }

    public static BitmapCounter get() {
        if (sBitmapCounter == null) {
            sBitmapCounter = new BitmapCounter(MAX_BITMAP_COUNT, MAX_BITMAP_TOTAL_SIZE);
        }
        return sBitmapCounter;
    }
}
