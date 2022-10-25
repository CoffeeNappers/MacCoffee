package okhttp3.internal.ws;

import android.support.v4.media.TransportMediator;
import android.support.v4.media.session.PlaybackStateCompat;
import java.io.IOException;
import java.util.Random;
import okio.Buffer;
import okio.BufferedSink;
import okio.ByteString;
import okio.Sink;
import okio.Timeout;
/* loaded from: classes3.dex */
final class WebSocketWriter {
    static final /* synthetic */ boolean $assertionsDisabled;
    boolean activeWriter;
    final Buffer buffer = new Buffer();
    final FrameSink frameSink = new FrameSink();
    final boolean isClient;
    final byte[] maskBuffer;
    final byte[] maskKey;
    final Random random;
    final BufferedSink sink;
    boolean writerClosed;

    static {
        $assertionsDisabled = !WebSocketWriter.class.desiredAssertionStatus();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public WebSocketWriter(boolean isClient, BufferedSink sink, Random random) {
        byte[] bArr = null;
        if (sink == null) {
            throw new NullPointerException("sink == null");
        }
        if (random == null) {
            throw new NullPointerException("random == null");
        }
        this.isClient = isClient;
        this.sink = sink;
        this.random = random;
        this.maskKey = isClient ? new byte[4] : null;
        this.maskBuffer = isClient ? new byte[8192] : bArr;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void writePing(ByteString payload) throws IOException {
        synchronized (this) {
            writeControlFrameSynchronized(9, payload);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void writePong(ByteString payload) throws IOException {
        synchronized (this) {
            writeControlFrameSynchronized(10, payload);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void writeClose(int code, ByteString reason) throws IOException {
        ByteString payload = ByteString.EMPTY;
        if (code != 0 || reason != null) {
            if (code != 0) {
                WebSocketProtocol.validateCloseCode(code);
            }
            Buffer buffer = new Buffer();
            buffer.mo1222writeShort(code);
            if (reason != null) {
                buffer.mo1212write(reason);
            }
            payload = buffer.readByteString();
        }
        synchronized (this) {
            writeControlFrameSynchronized(8, payload);
            this.writerClosed = true;
        }
    }

    private void writeControlFrameSynchronized(int opcode, ByteString payload) throws IOException {
        if ($assertionsDisabled || Thread.holdsLock(this)) {
            if (this.writerClosed) {
                throw new IOException("closed");
            }
            int length = payload.size();
            if (length > 125) {
                throw new IllegalArgumentException("Payload size must be less than or equal to 125");
            }
            int b0 = opcode | 128;
            this.sink.mo1215writeByte(b0);
            if (!this.isClient) {
                this.sink.mo1215writeByte(length);
                this.sink.mo1212write(payload);
            } else {
                int b1 = length | 128;
                this.sink.mo1215writeByte(b1);
                this.random.nextBytes(this.maskKey);
                this.sink.mo1213write(this.maskKey);
                byte[] bytes = payload.toByteArray();
                WebSocketProtocol.toggleMask(bytes, bytes.length, this.maskKey, 0L);
                this.sink.mo1213write(bytes);
            }
            this.sink.flush();
            return;
        }
        throw new AssertionError();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Sink newMessageSink(int formatOpcode, long contentLength) {
        if (this.activeWriter) {
            throw new IllegalStateException("Another message writer is active. Did you call close()?");
        }
        this.activeWriter = true;
        this.frameSink.formatOpcode = formatOpcode;
        this.frameSink.contentLength = contentLength;
        this.frameSink.isFirstFrame = true;
        this.frameSink.closed = false;
        return this.frameSink;
    }

    void writeMessageFrameSynchronized(int formatOpcode, long byteCount, boolean isFirstFrame, boolean isFinal) throws IOException {
        if ($assertionsDisabled || Thread.holdsLock(this)) {
            if (this.writerClosed) {
                throw new IOException("closed");
            }
            int b0 = isFirstFrame ? formatOpcode : 0;
            if (isFinal) {
                b0 |= 128;
            }
            this.sink.mo1215writeByte(b0);
            int b1 = 0;
            if (this.isClient) {
                b1 = 0 | 128;
            }
            if (byteCount <= 125) {
                this.sink.mo1215writeByte(b1 | ((int) byteCount));
            } else if (byteCount <= 65535) {
                this.sink.mo1215writeByte(b1 | TransportMediator.KEYCODE_MEDIA_PLAY);
                this.sink.mo1222writeShort((int) byteCount);
            } else {
                this.sink.mo1215writeByte(b1 | TransportMediator.KEYCODE_MEDIA_PAUSE);
                this.sink.mo1220writeLong(byteCount);
            }
            if (this.isClient) {
                this.random.nextBytes(this.maskKey);
                this.sink.mo1213write(this.maskKey);
                long written = 0;
                while (written < byteCount) {
                    int toRead = (int) Math.min(byteCount, this.maskBuffer.length);
                    int read = this.buffer.read(this.maskBuffer, 0, toRead);
                    if (read == -1) {
                        throw new AssertionError();
                    }
                    WebSocketProtocol.toggleMask(this.maskBuffer, read, this.maskKey, written);
                    this.sink.mo1214write(this.maskBuffer, 0, read);
                    written += read;
                }
            } else {
                this.sink.write(this.buffer, byteCount);
            }
            this.sink.emit();
            return;
        }
        throw new AssertionError();
    }

    /* loaded from: classes3.dex */
    final class FrameSink implements Sink {
        boolean closed;
        long contentLength;
        int formatOpcode;
        boolean isFirstFrame;

        FrameSink() {
        }

        @Override // okio.Sink
        public void write(Buffer source, long byteCount) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            WebSocketWriter.this.buffer.write(source, byteCount);
            boolean deferWrite = this.isFirstFrame && this.contentLength != -1 && WebSocketWriter.this.buffer.size() > this.contentLength - PlaybackStateCompat.ACTION_PLAY_FROM_URI;
            long emitCount = WebSocketWriter.this.buffer.completeSegmentByteCount();
            if (emitCount > 0 && !deferWrite) {
                synchronized (WebSocketWriter.this) {
                    WebSocketWriter.this.writeMessageFrameSynchronized(this.formatOpcode, emitCount, this.isFirstFrame, false);
                }
                this.isFirstFrame = false;
            }
        }

        @Override // okio.Sink, java.io.Flushable
        public void flush() throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            synchronized (WebSocketWriter.this) {
                WebSocketWriter.this.writeMessageFrameSynchronized(this.formatOpcode, WebSocketWriter.this.buffer.size(), this.isFirstFrame, false);
            }
            this.isFirstFrame = false;
        }

        @Override // okio.Sink
        public Timeout timeout() {
            return WebSocketWriter.this.sink.timeout();
        }

        @Override // okio.Sink, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            synchronized (WebSocketWriter.this) {
                WebSocketWriter.this.writeMessageFrameSynchronized(this.formatOpcode, WebSocketWriter.this.buffer.size(), this.isFirstFrame, true);
            }
            this.closed = true;
            WebSocketWriter.this.activeWriter = false;
        }
    }
}
