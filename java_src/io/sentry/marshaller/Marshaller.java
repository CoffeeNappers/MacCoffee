package io.sentry.marshaller;

import io.sentry.event.Event;
import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes3.dex */
public interface Marshaller {
    String getContentEncoding();

    String getContentType();

    void marshall(Event event, OutputStream outputStream) throws IOException;

    /* loaded from: classes3.dex */
    public static final class UncloseableOutputStream extends OutputStream {
        private final OutputStream originalStream;

        public UncloseableOutputStream(OutputStream originalStream) {
            this.originalStream = originalStream;
        }

        @Override // java.io.OutputStream
        public void write(int b) throws IOException {
            this.originalStream.write(b);
        }

        @Override // java.io.OutputStream
        public void write(byte[] b) throws IOException {
            this.originalStream.write(b);
        }

        @Override // java.io.OutputStream
        public void write(byte[] b, int off, int len) throws IOException {
            this.originalStream.write(b, off, len);
        }

        @Override // java.io.OutputStream, java.io.Flushable
        public void flush() throws IOException {
            this.originalStream.flush();
        }

        @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
        }
    }
}
