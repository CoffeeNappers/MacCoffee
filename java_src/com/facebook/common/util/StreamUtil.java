package com.facebook.common.util;

import com.facebook.common.internal.ByteStreams;
import com.facebook.common.internal.Preconditions;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public class StreamUtil {
    public static byte[] getBytesFromStream(InputStream is) throws IOException {
        return getBytesFromStream(is, is.available());
    }

    public static byte[] getBytesFromStream(InputStream inputStream, int hint) throws IOException {
        ByteArrayOutputStream byteOutput = new ByteArrayOutputStream(hint) { // from class: com.facebook.common.util.StreamUtil.1
            @Override // java.io.ByteArrayOutputStream
            public byte[] toByteArray() {
                return this.count == this.buf.length ? this.buf : super.toByteArray();
            }
        };
        ByteStreams.copy(inputStream, byteOutput);
        return byteOutput.toByteArray();
    }

    public static long skip(InputStream inputStream, long bytesCount) throws IOException {
        Preconditions.checkNotNull(inputStream);
        Preconditions.checkArgument(bytesCount >= 0);
        long toSkip = bytesCount;
        while (toSkip > 0) {
            long skipped = inputStream.skip(toSkip);
            if (skipped > 0) {
                toSkip -= skipped;
            } else if (inputStream.read() != -1) {
                toSkip--;
            } else {
                return bytesCount - toSkip;
            }
        }
        return bytesCount;
    }
}
