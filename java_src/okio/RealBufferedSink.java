package okio;

import android.support.v4.media.session.PlaybackStateCompat;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class RealBufferedSink implements BufferedSink {
    public final Buffer buffer = new Buffer();
    boolean closed;
    public final Sink sink;

    /* JADX INFO: Access modifiers changed from: package-private */
    public RealBufferedSink(Sink sink) {
        if (sink == null) {
            throw new NullPointerException("sink == null");
        }
        this.sink = sink;
    }

    @Override // okio.BufferedSink
    public Buffer buffer() {
        return this.buffer;
    }

    @Override // okio.Sink
    public void write(Buffer source, long byteCount) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.write(source, byteCount);
        mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: write */
    public BufferedSink mo1212write(ByteString byteString) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1212write(byteString);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeUtf8 */
    public BufferedSink mo1226writeUtf8(String string) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1226writeUtf8(string);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeUtf8 */
    public BufferedSink mo1227writeUtf8(String string, int beginIndex, int endIndex) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1227writeUtf8(string, beginIndex, endIndex);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeUtf8CodePoint */
    public BufferedSink mo1228writeUtf8CodePoint(int codePoint) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1228writeUtf8CodePoint(codePoint);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeString */
    public BufferedSink mo1225writeString(String string, Charset charset) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1225writeString(string, charset);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeString */
    public BufferedSink mo1224writeString(String string, int beginIndex, int endIndex, Charset charset) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1224writeString(string, beginIndex, endIndex, charset);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: write */
    public BufferedSink mo1213write(byte[] source) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1213write(source);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: write */
    public BufferedSink mo1214write(byte[] source, int offset, int byteCount) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1214write(source, offset, byteCount);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    public long writeAll(Source source) throws IOException {
        if (source == null) {
            throw new IllegalArgumentException("source == null");
        }
        long totalBytesRead = 0;
        while (true) {
            long readCount = source.read(this.buffer, PlaybackStateCompat.ACTION_PLAY_FROM_URI);
            if (readCount != -1) {
                totalBytesRead += readCount;
                mo1211emitCompleteSegments();
            } else {
                return totalBytesRead;
            }
        }
    }

    @Override // okio.BufferedSink
    public BufferedSink write(Source source, long byteCount) throws IOException {
        while (byteCount > 0) {
            long read = source.read(this.buffer, byteCount);
            if (read == -1) {
                throw new EOFException();
            }
            byteCount -= read;
            mo1211emitCompleteSegments();
        }
        return this;
    }

    @Override // okio.BufferedSink
    /* renamed from: writeByte */
    public BufferedSink mo1215writeByte(int b) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1215writeByte(b);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeShort */
    public BufferedSink mo1222writeShort(int s) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1222writeShort(s);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeShortLe */
    public BufferedSink mo1223writeShortLe(int s) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1223writeShortLe(s);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeInt */
    public BufferedSink mo1218writeInt(int i) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1218writeInt(i);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeIntLe */
    public BufferedSink mo1219writeIntLe(int i) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1219writeIntLe(i);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeLong */
    public BufferedSink mo1220writeLong(long v) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1220writeLong(v);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeLongLe */
    public BufferedSink mo1221writeLongLe(long v) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1221writeLongLe(v);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeDecimalLong */
    public BufferedSink mo1216writeDecimalLong(long v) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1216writeDecimalLong(v);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: writeHexadecimalUnsignedLong */
    public BufferedSink mo1217writeHexadecimalUnsignedLong(long v) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        this.buffer.mo1217writeHexadecimalUnsignedLong(v);
        return mo1211emitCompleteSegments();
    }

    @Override // okio.BufferedSink
    /* renamed from: emitCompleteSegments */
    public BufferedSink mo1211emitCompleteSegments() throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        long byteCount = this.buffer.completeSegmentByteCount();
        if (byteCount > 0) {
            this.sink.write(this.buffer, byteCount);
        }
        return this;
    }

    @Override // okio.BufferedSink
    public BufferedSink emit() throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        long byteCount = this.buffer.size();
        if (byteCount > 0) {
            this.sink.write(this.buffer, byteCount);
        }
        return this;
    }

    @Override // okio.BufferedSink
    public OutputStream outputStream() {
        return new OutputStream() { // from class: okio.RealBufferedSink.1
            @Override // java.io.OutputStream
            public void write(int b) throws IOException {
                if (RealBufferedSink.this.closed) {
                    throw new IOException("closed");
                }
                RealBufferedSink.this.buffer.mo1215writeByte((int) ((byte) b));
                RealBufferedSink.this.mo1211emitCompleteSegments();
            }

            @Override // java.io.OutputStream
            public void write(byte[] data, int offset, int byteCount) throws IOException {
                if (RealBufferedSink.this.closed) {
                    throw new IOException("closed");
                }
                RealBufferedSink.this.buffer.mo1214write(data, offset, byteCount);
                RealBufferedSink.this.mo1211emitCompleteSegments();
            }

            @Override // java.io.OutputStream, java.io.Flushable
            public void flush() throws IOException {
                if (!RealBufferedSink.this.closed) {
                    RealBufferedSink.this.flush();
                }
            }

            @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
            public void close() throws IOException {
                RealBufferedSink.this.close();
            }

            public String toString() {
                return RealBufferedSink.this + ".outputStream()";
            }
        };
    }

    @Override // okio.BufferedSink, okio.Sink, java.io.Flushable
    public void flush() throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        if (this.buffer.size > 0) {
            this.sink.write(this.buffer, this.buffer.size);
        }
        this.sink.flush();
    }

    @Override // okio.Sink, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.closed) {
            Throwable thrown = null;
            try {
                if (this.buffer.size > 0) {
                    this.sink.write(this.buffer, this.buffer.size);
                }
            } catch (Throwable e) {
                thrown = e;
            }
            try {
                this.sink.close();
            } catch (Throwable e2) {
                if (thrown == null) {
                    thrown = e2;
                }
            }
            this.closed = true;
            if (thrown != null) {
                Util.sneakyRethrow(thrown);
            }
        }
    }

    @Override // okio.Sink
    public Timeout timeout() {
        return this.sink.timeout();
    }

    public String toString() {
        return "buffer(" + this.sink + ")";
    }
}
