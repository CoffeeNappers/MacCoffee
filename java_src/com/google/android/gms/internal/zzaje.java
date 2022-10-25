package com.google.android.gms.internal;

import java.io.IOException;
import java.io.Reader;
import java.nio.CharBuffer;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class zzaje extends Reader {
    private List<String> bcR;
    private boolean closed = false;
    private int bcS;
    private int bcU = this.bcS;
    private int bcT;
    private int bcV = this.bcT;
    private boolean bcW = false;

    public zzaje() {
        this.bcR = null;
        this.bcR = new ArrayList();
    }

    private long zzci(long j) {
        long j2 = 0;
        while (this.bcT < this.bcR.size() && j2 < j) {
            int zzcub = zzcub();
            long j3 = j - j2;
            if (j3 < zzcub) {
                this.bcS = (int) (this.bcS + j3);
                j2 += j3;
            } else {
                j2 += zzcub;
                this.bcS = 0;
                this.bcT++;
            }
        }
        return j2;
    }

    private String zzcua() {
        if (this.bcT < this.bcR.size()) {
            return this.bcR.get(this.bcT);
        }
        return null;
    }

    private int zzcub() {
        String zzcua = zzcua();
        if (zzcua == null) {
            return 0;
        }
        return zzcua.length() - this.bcS;
    }

    private void zzcuc() throws IOException {
        if (this.closed) {
            throw new IOException("Stream already closed");
        }
        if (this.bcW) {
            return;
        }
        throw new IOException("Reader needs to be frozen before read operations can be called");
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        zzcuc();
        this.closed = true;
    }

    @Override // java.io.Reader
    public void mark(int i) throws IOException {
        zzcuc();
        this.bcU = this.bcS;
        this.bcV = this.bcT;
    }

    @Override // java.io.Reader
    public boolean markSupported() {
        return true;
    }

    @Override // java.io.Reader
    public int read() throws IOException {
        zzcuc();
        String zzcua = zzcua();
        if (zzcua == null) {
            return -1;
        }
        char charAt = zzcua.charAt(this.bcS);
        zzci(1L);
        return charAt;
    }

    @Override // java.io.Reader, java.lang.Readable
    public int read(CharBuffer charBuffer) throws IOException {
        zzcuc();
        int remaining = charBuffer.remaining();
        int i = 0;
        String zzcua = zzcua();
        while (remaining > 0 && zzcua != null) {
            int min = Math.min(zzcua.length() - this.bcS, remaining);
            charBuffer.put(this.bcR.get(this.bcT), this.bcS, this.bcS + min);
            remaining -= min;
            i += min;
            zzci(min);
            zzcua = zzcua();
        }
        if (i > 0 || zzcua != null) {
            return i;
        }
        return -1;
    }

    @Override // java.io.Reader
    public int read(char[] cArr, int i, int i2) throws IOException {
        zzcuc();
        int i3 = 0;
        String zzcua = zzcua();
        while (zzcua != null && i3 < i2) {
            int min = Math.min(zzcub(), i2 - i3);
            zzcua.getChars(this.bcS, this.bcS + min, cArr, i + i3);
            zzci(min);
            i3 += min;
            zzcua = zzcua();
        }
        if (i3 > 0 || zzcua != null) {
            return i3;
        }
        return -1;
    }

    @Override // java.io.Reader
    public boolean ready() throws IOException {
        zzcuc();
        return true;
    }

    @Override // java.io.Reader
    public void reset() throws IOException {
        this.bcS = this.bcU;
        this.bcT = this.bcV;
    }

    @Override // java.io.Reader
    public long skip(long j) throws IOException {
        zzcuc();
        return zzci(j);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (String str : this.bcR) {
            sb.append(str);
        }
        return sb.toString();
    }

    public void zzctz() {
        if (this.bcW) {
            throw new IllegalStateException("Trying to freeze frozen StringListReader");
        }
        this.bcW = true;
    }

    public void zzsq(String str) {
        if (this.bcW) {
            throw new IllegalStateException("Trying to add string after reading");
        }
        if (str.length() <= 0) {
            return;
        }
        this.bcR.add(str);
    }
}
