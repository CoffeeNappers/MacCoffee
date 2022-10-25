package com.vk.music.utils;

import android.os.Bundle;
import android.os.Parcelable;
import android.util.SparseArray;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public final class Bundler {
    private final Bundle bundle = new Bundle();

    public Bundle put(String key, byte val) {
        this.bundle.putByte(key, val);
        return this.bundle;
    }

    public Bundle put(String key, char val) {
        this.bundle.putChar(key, val);
        return this.bundle;
    }

    public Bundle put(String key, boolean val) {
        this.bundle.putBoolean(key, val);
        return this.bundle;
    }

    public Bundle put(String key, short val) {
        this.bundle.putShort(key, val);
        return this.bundle;
    }

    public Bundle put(String key, int val) {
        this.bundle.putInt(key, val);
        return this.bundle;
    }

    public Bundle put(String key, float val) {
        this.bundle.putFloat(key, val);
        return this.bundle;
    }

    public Bundle put(String key, double val) {
        this.bundle.putDouble(key, val);
        return this.bundle;
    }

    public Bundle put(String key, byte[] val) {
        this.bundle.putByteArray(key, val);
        return this.bundle;
    }

    public Bundle put(String key, char[] val) {
        this.bundle.putCharArray(key, val);
        return this.bundle;
    }

    public Bundle put(String key, boolean[] val) {
        this.bundle.putBooleanArray(key, val);
        return this.bundle;
    }

    public Bundle put(String key, short[] val) {
        this.bundle.putShortArray(key, val);
        return this.bundle;
    }

    public Bundle put(String key, int[] val) {
        this.bundle.putIntArray(key, val);
        return this.bundle;
    }

    public Bundle put(String key, float[] val) {
        this.bundle.putFloatArray(key, val);
        return this.bundle;
    }

    public Bundle put(String key, double[] val) {
        this.bundle.putDoubleArray(key, val);
        return this.bundle;
    }

    public Bundle put(String key, CharSequence val) {
        this.bundle.putCharSequence(key, val);
        return this.bundle;
    }

    public Bundle put(String key, CharSequence[] val) {
        this.bundle.putCharSequenceArray(key, val);
        return this.bundle;
    }

    public Bundle putCharSequenceArrayList(String key, ArrayList<CharSequence> val) {
        this.bundle.putCharSequenceArrayList(key, val);
        return this.bundle;
    }

    public Bundle put(String key, String val) {
        this.bundle.putString(key, val);
        return this.bundle;
    }

    public Bundle put(String key, String[] val) {
        this.bundle.putStringArray(key, val);
        return this.bundle;
    }

    public Bundle putStringArrayList(String key, ArrayList<String> val) {
        this.bundle.putStringArrayList(key, val);
        return this.bundle;
    }

    public Bundle put(String key, Parcelable val) {
        this.bundle.putParcelable(key, val);
        return this.bundle;
    }

    public Bundle put(String key, Parcelable[] val) {
        this.bundle.putParcelableArray(key, val);
        return this.bundle;
    }

    public Bundle putParcelableArrayList(String key, ArrayList<? extends Parcelable> val) {
        this.bundle.putParcelableArrayList(key, val);
        return this.bundle;
    }

    public Bundle put(String key, SparseArray<? extends Parcelable> val) {
        this.bundle.putSparseParcelableArray(key, val);
        return this.bundle;
    }
}
