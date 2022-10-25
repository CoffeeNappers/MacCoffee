package com.facebook.common.internal;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public class Files {
    private Files() {
    }

    static byte[] readFile(InputStream in, long expectedSize) throws IOException {
        if (expectedSize > 2147483647L) {
            throw new OutOfMemoryError("file is too large to fit in a byte array: " + expectedSize + " bytes");
        }
        if (expectedSize == 0) {
            return ByteStreams.toByteArray(in);
        }
        return ByteStreams.toByteArray(in, (int) expectedSize);
    }

    public static byte[] toByteArray(File file) throws IOException {
        FileInputStream in;
        FileInputStream in2 = null;
        try {
            in = new FileInputStream(file);
        } catch (Throwable th) {
            th = th;
        }
        try {
            byte[] readFile = readFile(in, in.getChannel().size());
            if (in != null) {
                in.close();
            }
            return readFile;
        } catch (Throwable th2) {
            th = th2;
            in2 = in;
            if (in2 != null) {
                in2.close();
            }
            throw th;
        }
    }
}
