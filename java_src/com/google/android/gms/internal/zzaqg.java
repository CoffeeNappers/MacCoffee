package com.google.android.gms.internal;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public final class zzaqg extends zzaqr {
    private static final Writer bpO = new Writer() { // from class: com.google.android.gms.internal.zzaqg.1
        @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            throw new AssertionError();
        }

        @Override // java.io.Writer, java.io.Flushable
        public void flush() throws IOException {
            throw new AssertionError();
        }

        @Override // java.io.Writer
        public void write(char[] cArr, int i, int i2) {
            throw new AssertionError();
        }
    };
    private static final zzape bpP = new zzape("closed");
    private final List<zzaoy> bpN;
    private String bpQ;
    private zzaoy bpR;

    public zzaqg() {
        super(bpO);
        this.bpN = new ArrayList();
        this.bpR = zzapa.bou;
    }

    private zzaoy bv() {
        return this.bpN.get(this.bpN.size() - 1);
    }

    private void zzd(zzaoy zzaoyVar) {
        if (this.bpQ != null) {
            if (!zzaoyVar.aY() || bN()) {
                ((zzapb) bv()).zza(this.bpQ, zzaoyVar);
            }
            this.bpQ = null;
        } else if (this.bpN.isEmpty()) {
            this.bpR = zzaoyVar;
        } else {
            zzaoy bv = bv();
            if (!(bv instanceof zzaov)) {
                throw new IllegalStateException();
            }
            ((zzaov) bv).zzc(zzaoyVar);
        }
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr bA() throws IOException {
        zzd(zzapa.bou);
        return this;
    }

    public zzaoy bu() {
        if (!this.bpN.isEmpty()) {
            String valueOf = String.valueOf(this.bpN);
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 34).append("Expected one JSON element but was ").append(valueOf).toString());
        }
        return this.bpR;
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr bw() throws IOException {
        zzaov zzaovVar = new zzaov();
        zzd(zzaovVar);
        this.bpN.add(zzaovVar);
        return this;
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr bx() throws IOException {
        if (this.bpN.isEmpty() || this.bpQ != null) {
            throw new IllegalStateException();
        }
        if (!(bv() instanceof zzaov)) {
            throw new IllegalStateException();
        }
        this.bpN.remove(this.bpN.size() - 1);
        return this;
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr by() throws IOException {
        zzapb zzapbVar = new zzapb();
        zzd(zzapbVar);
        this.bpN.add(zzapbVar);
        return this;
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr bz() throws IOException {
        if (this.bpN.isEmpty() || this.bpQ != null) {
            throw new IllegalStateException();
        }
        if (!(bv() instanceof zzapb)) {
            throw new IllegalStateException();
        }
        this.bpN.remove(this.bpN.size() - 1);
        return this;
    }

    @Override // com.google.android.gms.internal.zzaqr, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.bpN.isEmpty()) {
            throw new IOException("Incomplete document");
        }
        this.bpN.add(bpP);
    }

    @Override // com.google.android.gms.internal.zzaqr, java.io.Flushable
    public void flush() throws IOException {
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr zza(Number number) throws IOException {
        if (number == null) {
            return bA();
        }
        if (!isLenient()) {
            double doubleValue = number.doubleValue();
            if (Double.isNaN(doubleValue) || Double.isInfinite(doubleValue)) {
                String valueOf = String.valueOf(number);
                throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 33).append("JSON forbids NaN and infinities: ").append(valueOf).toString());
            }
        }
        zzd(new zzape(number));
        return this;
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr zzcs(long j) throws IOException {
        zzd(new zzape((Number) Long.valueOf(j)));
        return this;
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr zzdh(boolean z) throws IOException {
        zzd(new zzape(Boolean.valueOf(z)));
        return this;
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr zzus(String str) throws IOException {
        if (this.bpN.isEmpty() || this.bpQ != null) {
            throw new IllegalStateException();
        }
        if (!(bv() instanceof zzapb)) {
            throw new IllegalStateException();
        }
        this.bpQ = str;
        return this;
    }

    @Override // com.google.android.gms.internal.zzaqr
    public zzaqr zzut(String str) throws IOException {
        if (str == null) {
            return bA();
        }
        zzd(new zzape(str));
        return this;
    }
}
