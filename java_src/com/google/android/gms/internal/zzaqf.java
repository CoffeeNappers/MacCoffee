package com.google.android.gms.internal;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zzaqf extends zzaqp {
    private static final Reader bpL = new Reader() { // from class: com.google.android.gms.internal.zzaqf.1
        @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            throw new AssertionError();
        }

        @Override // java.io.Reader
        public int read(char[] cArr, int i, int i2) throws IOException {
            throw new AssertionError();
        }
    };
    private static final Object bpM = new Object();
    private final List<Object> bpN;

    public zzaqf(zzaoy zzaoyVar) {
        super(bpL);
        this.bpN = new ArrayList();
        this.bpN.add(zzaoyVar);
    }

    private Object br() {
        return this.bpN.get(this.bpN.size() - 1);
    }

    private Object bs() {
        return this.bpN.remove(this.bpN.size() - 1);
    }

    private void zza(zzaqq zzaqqVar) throws IOException {
        if (bq() != zzaqqVar) {
            String valueOf = String.valueOf(zzaqqVar);
            String valueOf2 = String.valueOf(bq());
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 18 + String.valueOf(valueOf2).length()).append("Expected ").append(valueOf).append(" but was ").append(valueOf2).toString());
        }
    }

    @Override // com.google.android.gms.internal.zzaqp
    public void beginArray() throws IOException {
        zza(zzaqq.BEGIN_ARRAY);
        this.bpN.add(((zzaov) br()).iterator());
    }

    @Override // com.google.android.gms.internal.zzaqp
    public void beginObject() throws IOException {
        zza(zzaqq.BEGIN_OBJECT);
        this.bpN.add(((zzapb) br()).entrySet().iterator());
    }

    @Override // com.google.android.gms.internal.zzaqp
    public zzaqq bq() throws IOException {
        if (this.bpN.isEmpty()) {
            return zzaqq.END_DOCUMENT;
        }
        Object br = br();
        if (br instanceof Iterator) {
            boolean z = this.bpN.get(this.bpN.size() - 2) instanceof zzapb;
            Iterator it = (Iterator) br;
            if (!it.hasNext()) {
                return z ? zzaqq.END_OBJECT : zzaqq.END_ARRAY;
            } else if (z) {
                return zzaqq.NAME;
            } else {
                this.bpN.add(it.next());
                return bq();
            }
        } else if (br instanceof zzapb) {
            return zzaqq.BEGIN_OBJECT;
        } else {
            if (br instanceof zzaov) {
                return zzaqq.BEGIN_ARRAY;
            }
            if (!(br instanceof zzape)) {
                if (br instanceof zzapa) {
                    return zzaqq.NULL;
                }
                if (br != bpM) {
                    throw new AssertionError();
                }
                throw new IllegalStateException("JsonReader is closed");
            }
            zzape zzapeVar = (zzape) br;
            if (zzapeVar.bf()) {
                return zzaqq.STRING;
            }
            if (zzapeVar.bd()) {
                return zzaqq.BOOLEAN;
            }
            if (!zzapeVar.be()) {
                throw new AssertionError();
            }
            return zzaqq.NUMBER;
        }
    }

    public void bt() throws IOException {
        zza(zzaqq.NAME);
        Map.Entry entry = (Map.Entry) ((Iterator) br()).next();
        this.bpN.add(entry.getValue());
        this.bpN.add(new zzape((String) entry.getKey()));
    }

    @Override // com.google.android.gms.internal.zzaqp, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.bpN.clear();
        this.bpN.add(bpM);
    }

    @Override // com.google.android.gms.internal.zzaqp
    public void endArray() throws IOException {
        zza(zzaqq.END_ARRAY);
        bs();
        bs();
    }

    @Override // com.google.android.gms.internal.zzaqp
    public void endObject() throws IOException {
        zza(zzaqq.END_OBJECT);
        bs();
        bs();
    }

    @Override // com.google.android.gms.internal.zzaqp
    public boolean hasNext() throws IOException {
        zzaqq bq = bq();
        return (bq == zzaqq.END_OBJECT || bq == zzaqq.END_ARRAY) ? false : true;
    }

    @Override // com.google.android.gms.internal.zzaqp
    public boolean nextBoolean() throws IOException {
        zza(zzaqq.BOOLEAN);
        return ((zzape) bs()).getAsBoolean();
    }

    @Override // com.google.android.gms.internal.zzaqp
    public double nextDouble() throws IOException {
        zzaqq bq = bq();
        if (bq != zzaqq.NUMBER && bq != zzaqq.STRING) {
            String valueOf = String.valueOf(zzaqq.NUMBER);
            String valueOf2 = String.valueOf(bq);
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 18 + String.valueOf(valueOf2).length()).append("Expected ").append(valueOf).append(" but was ").append(valueOf2).toString());
        }
        double asDouble = ((zzape) br()).getAsDouble();
        if (!isLenient() && (Double.isNaN(asDouble) || Double.isInfinite(asDouble))) {
            throw new NumberFormatException(new StringBuilder(57).append("JSON forbids NaN and infinities: ").append(asDouble).toString());
        }
        bs();
        return asDouble;
    }

    @Override // com.google.android.gms.internal.zzaqp
    public int nextInt() throws IOException {
        zzaqq bq = bq();
        if (bq == zzaqq.NUMBER || bq == zzaqq.STRING) {
            int asInt = ((zzape) br()).getAsInt();
            bs();
            return asInt;
        }
        String valueOf = String.valueOf(zzaqq.NUMBER);
        String valueOf2 = String.valueOf(bq);
        throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 18 + String.valueOf(valueOf2).length()).append("Expected ").append(valueOf).append(" but was ").append(valueOf2).toString());
    }

    @Override // com.google.android.gms.internal.zzaqp
    public long nextLong() throws IOException {
        zzaqq bq = bq();
        if (bq == zzaqq.NUMBER || bq == zzaqq.STRING) {
            long asLong = ((zzape) br()).getAsLong();
            bs();
            return asLong;
        }
        String valueOf = String.valueOf(zzaqq.NUMBER);
        String valueOf2 = String.valueOf(bq);
        throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 18 + String.valueOf(valueOf2).length()).append("Expected ").append(valueOf).append(" but was ").append(valueOf2).toString());
    }

    @Override // com.google.android.gms.internal.zzaqp
    public String nextName() throws IOException {
        zza(zzaqq.NAME);
        Map.Entry entry = (Map.Entry) ((Iterator) br()).next();
        this.bpN.add(entry.getValue());
        return (String) entry.getKey();
    }

    @Override // com.google.android.gms.internal.zzaqp
    public void nextNull() throws IOException {
        zza(zzaqq.NULL);
        bs();
    }

    @Override // com.google.android.gms.internal.zzaqp
    public String nextString() throws IOException {
        zzaqq bq = bq();
        if (bq == zzaqq.STRING || bq == zzaqq.NUMBER) {
            return ((zzape) bs()).aU();
        }
        String valueOf = String.valueOf(zzaqq.STRING);
        String valueOf2 = String.valueOf(bq);
        throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 18 + String.valueOf(valueOf2).length()).append("Expected ").append(valueOf).append(" but was ").append(valueOf2).toString());
    }

    @Override // com.google.android.gms.internal.zzaqp
    public void skipValue() throws IOException {
        if (bq() == zzaqq.NAME) {
            nextName();
        } else {
            bs();
        }
    }

    @Override // com.google.android.gms.internal.zzaqp
    public String toString() {
        return getClass().getSimpleName();
    }
}
