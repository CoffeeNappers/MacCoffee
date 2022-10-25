package com.wmspanel.libstream;

import android.util.Log;
import com.wmspanel.libstream.Streamer;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.SocketChannel;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public abstract class a {
    private static final String TAG = "BaseConnection";
    static final int i = 20480;
    private SocketChannel a;
    protected Streamer.MODE b;
    protected d c;
    protected int d;
    protected String e;
    protected int f;
    protected long g;
    protected long h;
    private ByteBuffer j;
    private ByteBuffer k;
    protected int l;
    protected long m;
    protected long n;
    protected long o;
    protected long p;
    protected long q;
    protected long r;

    abstract int a(ByteBuffer byteBuffer);

    abstract void c();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void d();

    /* JADX INFO: Access modifiers changed from: package-private */
    public a(d dVar, int i2, Streamer.MODE mode, String str, int i3) throws IOException {
        this(dVar, i2, mode, str, i3, i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public a(d dVar, int i2, Streamer.MODE mode, String str, int i3, int i4) throws IOException {
        this.l = 0;
        this.m = 0L;
        this.n = 0L;
        this.o = 0L;
        this.p = 0L;
        this.q = 0L;
        this.r = 0L;
        this.c = dVar;
        this.d = i2;
        this.b = mode;
        this.e = str;
        this.f = i3;
        this.g = 0L;
        this.h = 0L;
        this.k = ByteBuffer.allocate(4096);
        this.j = ByteBuffer.allocate(i4 + 1024);
        this.j.position(0);
        this.j.limit(0);
        this.a = SocketChannel.open();
        this.a.configureBlocking(false);
    }

    Streamer.MODE a() {
        return this.b;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void connect() throws IOException {
        Log.d(TAG, "Connect");
        try {
            a(Streamer.CONNECTION_STATE.INITIALIZED, Streamer.STATUS.SUCCESS);
            this.a.register(this.c.w(), 8, this);
            this.a.connect(new InetSocketAddress(this.e, this.f));
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    public void a(String str) throws IOException {
        byte[] bytes = str.getBytes("US-ASCII");
        send(bytes, 0, bytes.length);
    }

    public void a(byte[] bArr) throws IOException {
        send(bArr, 0, bArr.length);
    }

    public void send(byte[] buffer, int offset, int count) throws IOException {
        if (this.j == null) {
            close();
            return;
        }
        this.j.compact();
        this.j.put(buffer, offset, count);
        this.j.flip();
        int write = this.a.write(this.j);
        if (write > 0) {
            this.l = 0;
            this.g = write + this.g;
        }
        if (this.j.hasRemaining()) {
            a(5);
        }
    }

    public int b() {
        if (this.j == null) {
            return 0;
        }
        return this.j.remaining();
    }

    public void b(byte[] bArr) throws IOException {
        append(bArr, 0, bArr.length);
    }

    public void append(byte[] buffer, int offset, int count) throws IOException {
        if (this.j == null) {
            close();
            return;
        }
        this.j.compact();
        this.j.put(buffer, offset, count);
        this.j.flip();
    }

    public void e() {
        this.l++;
        if (this.l > 5) {
            Log.w(TAG, "inactivity timeout expired");
        }
    }

    private void a(ByteBuffer byteBuffer, int i2) {
        if (byteBuffer.position() <= i2) {
            byteBuffer.clear();
            return;
        }
        int position = byteBuffer.position() - i2;
        int i3 = 0;
        while (i2 < position) {
            byteBuffer.put(i3, byteBuffer.get(i2));
            i2++;
            i3++;
        }
        byteBuffer.position(position);
    }

    public void a(SelectionKey selectionKey) {
        if (selectionKey != null) {
            try {
                if (selectionKey.isConnectable() && this.a.finishConnect()) {
                    this.l = 0;
                    a(1);
                    c();
                }
                if (selectionKey.isReadable()) {
                    int read = this.a.read(this.k);
                    if (read <= 0) {
                        close();
                        return;
                    }
                    this.l = 0;
                    this.h = read + this.h;
                    a(this.k, a(this.k));
                }
                if (selectionKey.isWritable()) {
                    f();
                }
            } catch (Exception e) {
                Log.e(TAG, Log.getStackTraceString(e));
                close();
            }
        }
    }

    private void a(int i2) {
        if (this.a != null) {
            SelectionKey keyFor = this.a.keyFor(this.c.w());
            if (keyFor == null) {
                close();
            } else {
                keyFor.interestOps(i2);
            }
        }
    }

    private void f() {
        try {
            int write = this.a.write(this.j);
            if (write > 0) {
                this.l = 0;
                this.g = write + this.g;
            }
            if (!this.j.hasRemaining()) {
                a(1);
                d();
            }
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public synchronized void close() {
        if (this.a != null) {
            try {
                this.a.close();
                SelectionKey keyFor = this.a.keyFor(this.c.w());
                if (keyFor != null) {
                    keyFor.cancel();
                }
                this.a = null;
            } catch (IOException e) {
                Log.e(TAG, Log.getStackTraceString(e));
            }
        }
    }

    public void release() {
        close();
    }

    public long g() {
        return this.g;
    }

    public long h() {
        return this.h;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void a(BufferItem bufferItem) {
        if (bufferItem.n() < this.q) {
            this.q = 0L;
        }
        long n = (bufferItem.n() - this.q) - 1;
        if (this.m != 0 && n != 0) {
            Log.w(TAG, "audio frames lost " + n);
            this.n = n + this.n;
        }
        this.q = bufferItem.n();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void b(BufferItem bufferItem) {
        if (bufferItem.n() < this.r) {
            this.r = 0L;
        }
        long n = (bufferItem.n() - this.r) - 1;
        if (this.o != 0 && n != 0) {
            Log.w(TAG, "video frames lost " + n);
            this.p = n + this.p;
        }
        this.r = bufferItem.n();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long i() {
        return this.m;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long j() {
        return this.n;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long k() {
        return this.o;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long l() {
        return this.p;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void a(Streamer.CONNECTION_STATE connection_state, Streamer.STATUS status) {
        if (this.c != null) {
            this.c.a(this.d, connection_state, status);
        }
    }
}
