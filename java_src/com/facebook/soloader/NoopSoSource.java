package com.facebook.soloader;

import java.io.File;
/* loaded from: classes.dex */
public class NoopSoSource extends SoSource {
    @Override // com.facebook.soloader.SoSource
    public int loadLibrary(String soName, int loadFlags) {
        return 1;
    }

    @Override // com.facebook.soloader.SoSource
    public File unpackLibrary(String soName) {
        throw new UnsupportedOperationException("unpacking not supported in test mode");
    }
}
