package com.vkontakte.android.audio.utils;
/* loaded from: classes2.dex */
public class ProgressSnap {
    private int mLastProgress = -1;
    private final int mSnap;

    public ProgressSnap(int snap) {
        this.mSnap = snap;
    }

    public int progress(int progress) {
        int p = progress / this.mSnap;
        if (p > this.mLastProgress) {
            this.mLastProgress = p;
            return this.mSnap * p;
        }
        return -1;
    }

    public int progress(double count, double total) {
        return progress((int) ((count / total) * 100.0d));
    }

    public int progress(float count, float total) {
        return progress((int) ((count / total) * 100.0d));
    }

    public int progress(long count, long total) {
        return progress(count, total);
    }

    public int progress(int count, int total) {
        return progress(count, total);
    }
}
