package com.crashlytics.android.core.internal.models;
/* loaded from: classes.dex */
public class ThreadData {
    public static final int IMPORTANCE_CRASHED_THREAD = 4;
    public final FrameData[] frames;
    public final int importance;
    public final String name;

    /* loaded from: classes.dex */
    public static final class FrameData {
        public final long address;
        public final String file;
        public final int importance;
        public final long offset;
        public final String symbol;

        public FrameData(long address, int importance) {
            this(address, "", importance);
        }

        public FrameData(long address, String symbol, int importance) {
            this(address, symbol, "", 0L, importance);
        }

        public FrameData(long address, String symbol, String file, long offset, int importance) {
            this.address = address;
            this.symbol = symbol;
            this.file = file;
            this.offset = offset;
            this.importance = importance;
        }
    }

    public ThreadData(int importance, FrameData[] frames) {
        this(null, importance, frames);
    }

    public ThreadData(String name, int importance, FrameData[] frames) {
        this.name = name;
        this.importance = importance;
        this.frames = frames;
    }
}
