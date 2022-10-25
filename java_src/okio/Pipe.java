package okio;

import java.io.IOException;
/* loaded from: classes3.dex */
public final class Pipe {
    final long maxBufferSize;
    boolean sinkClosed;
    boolean sourceClosed;
    final Buffer buffer = new Buffer();
    private final Sink sink = new PipeSink();
    private final Source source = new PipeSource();

    public Pipe(long maxBufferSize) {
        if (maxBufferSize < 1) {
            throw new IllegalArgumentException("maxBufferSize < 1: " + maxBufferSize);
        }
        this.maxBufferSize = maxBufferSize;
    }

    public Source source() {
        return this.source;
    }

    public Sink sink() {
        return this.sink;
    }

    /* loaded from: classes3.dex */
    final class PipeSink implements Sink {
        final Timeout timeout = new Timeout();

        PipeSink() {
        }

        @Override // okio.Sink
        public void write(Buffer source, long byteCount) throws IOException {
            synchronized (Pipe.this.buffer) {
                if (Pipe.this.sinkClosed) {
                    throw new IllegalStateException("closed");
                }
                while (byteCount > 0) {
                    if (Pipe.this.sourceClosed) {
                        throw new IOException("source is closed");
                    }
                    long bufferSpaceAvailable = Pipe.this.maxBufferSize - Pipe.this.buffer.size();
                    if (bufferSpaceAvailable == 0) {
                        this.timeout.waitUntilNotified(Pipe.this.buffer);
                    } else {
                        long bytesToWrite = Math.min(bufferSpaceAvailable, byteCount);
                        Pipe.this.buffer.write(source, bytesToWrite);
                        byteCount -= bytesToWrite;
                        Pipe.this.buffer.notifyAll();
                    }
                }
            }
        }

        @Override // okio.Sink, java.io.Flushable
        public void flush() throws IOException {
            synchronized (Pipe.this.buffer) {
                if (Pipe.this.sinkClosed) {
                    throw new IllegalStateException("closed");
                }
                while (Pipe.this.buffer.size() > 0) {
                    if (Pipe.this.sourceClosed) {
                        throw new IOException("source is closed");
                    }
                    this.timeout.waitUntilNotified(Pipe.this.buffer);
                }
            }
        }

        @Override // okio.Sink, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            synchronized (Pipe.this.buffer) {
                if (!Pipe.this.sinkClosed) {
                    flush();
                    Pipe.this.sinkClosed = true;
                    Pipe.this.buffer.notifyAll();
                }
            }
        }

        @Override // okio.Sink
        public Timeout timeout() {
            return this.timeout;
        }
    }

    /* loaded from: classes3.dex */
    final class PipeSource implements Source {
        final Timeout timeout = new Timeout();

        PipeSource() {
        }

        @Override // okio.Source
        public long read(Buffer sink, long byteCount) throws IOException {
            long read;
            synchronized (Pipe.this.buffer) {
                if (Pipe.this.sourceClosed) {
                    throw new IllegalStateException("closed");
                }
                while (true) {
                    if (Pipe.this.buffer.size() == 0) {
                        if (Pipe.this.sinkClosed) {
                            read = -1;
                            break;
                        }
                        this.timeout.waitUntilNotified(Pipe.this.buffer);
                    } else {
                        read = Pipe.this.buffer.read(sink, byteCount);
                        Pipe.this.buffer.notifyAll();
                        break;
                    }
                }
                return read;
            }
        }

        @Override // okio.Source, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            synchronized (Pipe.this.buffer) {
                Pipe.this.sourceClosed = true;
                Pipe.this.buffer.notifyAll();
            }
        }

        @Override // okio.Source
        public Timeout timeout() {
            return this.timeout;
        }
    }
}
