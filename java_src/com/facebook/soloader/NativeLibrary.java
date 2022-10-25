package com.facebook.soloader;

import android.util.Log;
import java.util.List;
/* loaded from: classes.dex */
public abstract class NativeLibrary {
    private static final String TAG = NativeLibrary.class.getName();
    private List<String> mLibraryNames;
    private final Object mLock = new Object();
    private Boolean mLoadLibraries = true;
    private boolean mLibrariesLoaded = false;
    private volatile UnsatisfiedLinkError mLinkError = null;

    protected NativeLibrary(List<String> libraryNames) {
        this.mLibraryNames = libraryNames;
    }

    public boolean loadLibraries() {
        boolean z;
        synchronized (this.mLock) {
            if (!this.mLoadLibraries.booleanValue()) {
                z = this.mLibrariesLoaded;
            } else {
                try {
                    for (String name : this.mLibraryNames) {
                        SoLoader.loadLibrary(name);
                    }
                    initialNativeCheck();
                    this.mLibrariesLoaded = true;
                    this.mLibraryNames = null;
                } catch (UnsatisfiedLinkError error) {
                    Log.e(TAG, "Failed to load native lib: ", error);
                    this.mLinkError = error;
                    this.mLibrariesLoaded = false;
                }
                this.mLoadLibraries = false;
                z = this.mLibrariesLoaded;
            }
        }
        return z;
    }

    public void ensureLoaded() throws UnsatisfiedLinkError {
        if (!loadLibraries()) {
            throw this.mLinkError;
        }
    }

    protected void initialNativeCheck() throws UnsatisfiedLinkError {
    }

    public UnsatisfiedLinkError getError() {
        return this.mLinkError;
    }
}
