package com.facebook.soloader;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
/* loaded from: classes.dex */
public abstract class SoSource {
    public static final int LOAD_FLAG_ALLOW_IMPLICIT_PROVISION = 1;
    public static final int LOAD_RESULT_IMPLICITLY_PROVIDED = 2;
    public static final int LOAD_RESULT_LOADED = 1;
    public static final int LOAD_RESULT_NOT_FOUND = 0;
    public static final int PREPARE_FLAG_ALLOW_ASYNC_INIT = 1;

    public abstract int loadLibrary(String str, int i) throws IOException;

    public abstract File unpackLibrary(String str) throws IOException;

    /* JADX INFO: Access modifiers changed from: protected */
    public void prepare(int flags) throws IOException {
    }

    public void addToLdLibraryPath(Collection<String> paths) {
    }
}
