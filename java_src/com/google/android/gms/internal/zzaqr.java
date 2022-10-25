package com.google.android.gms.internal;

import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.io.Writer;
/* loaded from: classes2.dex */
public class zzaqr implements Closeable, Flushable {
    private static final String[] brM = new String[128];
    private static final String[] brN;
    private boolean boe;
    private boolean bof;
    private String brO;
    private String brP;
    private boolean brp;
    private int[] brx = new int[32];
    private int bry = 0;
    private final Writer out;
    private String separator;

    static {
        for (int i = 0; i <= 31; i++) {
            brM[i] = String.format("\\u%04x", Integer.valueOf(i));
        }
        brM[34] = "\\\"";
        brM[92] = "\\\\";
        brM[9] = "\\t";
        brM[8] = "\\b";
        brM[10] = "\\n";
        brM[13] = "\\r";
        brM[12] = "\\f";
        brN = (String[]) brM.clone();
        brN[60] = "\\u003c";
        brN[62] = "\\u003e";
        brN[38] = "\\u0026";
        brN[61] = "\\u003d";
        brN[39] = "\\u0027";
    }

    public zzaqr(Writer writer) {
        zzagn(6);
        this.separator = ":";
        this.boe = true;
        if (writer == null) {
            throw new NullPointerException("out == null");
        }
        this.out = writer;
    }

    private int bO() {
        if (this.bry == 0) {
            throw new IllegalStateException("JsonWriter is closed.");
        }
        return this.brx[this.bry - 1];
    }

    private void bP() throws IOException {
        if (this.brP != null) {
            bR();
            zzuw(this.brP);
            this.brP = null;
        }
    }

    private void bQ() throws IOException {
        if (this.brO == null) {
            return;
        }
        this.out.write("\n");
        int i = this.bry;
        for (int i2 = 1; i2 < i; i2++) {
            this.out.write(this.brO);
        }
    }

    private void bR() throws IOException {
        int bO = bO();
        if (bO == 5) {
            this.out.write(44);
        } else if (bO != 3) {
            throw new IllegalStateException("Nesting problem.");
        }
        bQ();
        zzagp(4);
    }

    private void zzagn(int i) {
        if (this.bry == this.brx.length) {
            int[] iArr = new int[this.bry * 2];
            System.arraycopy(this.brx, 0, iArr, 0, this.bry);
            this.brx = iArr;
        }
        int[] iArr2 = this.brx;
        int i2 = this.bry;
        this.bry = i2 + 1;
        iArr2[i2] = i;
    }

    private void zzagp(int i) {
        this.brx[this.bry - 1] = i;
    }

    private zzaqr zzc(int i, int i2, String str) throws IOException {
        int bO = bO();
        if (bO == i2 || bO == i) {
            if (this.brP != null) {
                String valueOf = String.valueOf(this.brP);
                throw new IllegalStateException(valueOf.length() != 0 ? "Dangling name: ".concat(valueOf) : new String("Dangling name: "));
            }
            this.bry--;
            if (bO == i2) {
                bQ();
            }
            this.out.write(str);
            return this;
        }
        throw new IllegalStateException("Nesting problem.");
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private void zzdl(boolean z) throws IOException {
        switch (bO()) {
            case 1:
                zzagp(2);
                bQ();
                return;
            case 2:
                this.out.append(',');
                bQ();
                return;
            case 3:
            case 5:
            default:
                throw new IllegalStateException("Nesting problem.");
            case 4:
                this.out.append((CharSequence) this.separator);
                zzagp(5);
                return;
            case 6:
                break;
            case 7:
                if (!this.brp) {
                    throw new IllegalStateException("JSON must have only one top-level value.");
                }
                break;
        }
        if (this.brp || z) {
            zzagp(7);
            return;
        }
        throw new IllegalStateException("JSON must start with an array or an object.");
    }

    private zzaqr zzp(int i, String str) throws IOException {
        zzdl(true);
        zzagn(i);
        this.out.write(str);
        return this;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0032  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void zzuw(java.lang.String r8) throws java.io.IOException {
        /*
            r7 = this;
            r1 = 0
            boolean r0 = r7.bof
            if (r0 == 0) goto L26
            java.lang.String[] r0 = com.google.android.gms.internal.zzaqr.brN
        L7:
            java.io.Writer r2 = r7.out
            java.lang.String r3 = "\""
            r2.write(r3)
            int r4 = r8.length()
            r3 = r1
        L14:
            if (r3 >= r4) goto L49
            char r2 = r8.charAt(r3)
            r5 = 128(0x80, float:1.8E-43)
            if (r2 >= r5) goto L29
            r2 = r0[r2]
            if (r2 != 0) goto L30
        L22:
            int r2 = r3 + 1
            r3 = r2
            goto L14
        L26:
            java.lang.String[] r0 = com.google.android.gms.internal.zzaqr.brM
            goto L7
        L29:
            r5 = 8232(0x2028, float:1.1535E-41)
            if (r2 != r5) goto L41
            java.lang.String r2 = "\\u2028"
        L30:
            if (r1 >= r3) goto L39
            java.io.Writer r5 = r7.out
            int r6 = r3 - r1
            r5.write(r8, r1, r6)
        L39:
            java.io.Writer r1 = r7.out
            r1.write(r2)
            int r1 = r3 + 1
            goto L22
        L41:
            r5 = 8233(0x2029, float:1.1537E-41)
            if (r2 != r5) goto L22
            java.lang.String r2 = "\\u2029"
            goto L30
        L49:
            if (r1 >= r4) goto L52
            java.io.Writer r0 = r7.out
            int r2 = r4 - r1
            r0.write(r8, r1, r2)
        L52:
            java.io.Writer r0 = r7.out
            java.lang.String r1 = "\""
            r0.write(r1)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzaqr.zzuw(java.lang.String):void");
    }

    public zzaqr bA() throws IOException {
        if (this.brP != null) {
            if (!this.boe) {
                this.brP = null;
                return this;
            }
            bP();
        }
        zzdl(false);
        this.out.write("null");
        return this;
    }

    public final boolean bM() {
        return this.bof;
    }

    public final boolean bN() {
        return this.boe;
    }

    public zzaqr bw() throws IOException {
        bP();
        return zzp(1, "[");
    }

    public zzaqr bx() throws IOException {
        return zzc(1, 2, "]");
    }

    public zzaqr by() throws IOException {
        bP();
        return zzp(3, "{");
    }

    public zzaqr bz() throws IOException {
        return zzc(3, 5, "}");
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.out.close();
        int i = this.bry;
        if (i > 1 || (i == 1 && this.brx[i - 1] != 7)) {
            throw new IOException("Incomplete document");
        }
        this.bry = 0;
    }

    public void flush() throws IOException {
        if (this.bry == 0) {
            throw new IllegalStateException("JsonWriter is closed.");
        }
        this.out.flush();
    }

    public boolean isLenient() {
        return this.brp;
    }

    public final void setIndent(String str) {
        if (str.length() == 0) {
            this.brO = null;
            this.separator = ":";
            return;
        }
        this.brO = str;
        this.separator = ": ";
    }

    public final void setLenient(boolean z) {
        this.brp = z;
    }

    public zzaqr zza(Number number) throws IOException {
        if (number == null) {
            return bA();
        }
        bP();
        String obj = number.toString();
        if (!this.brp && (obj.equals("-Infinity") || obj.equals("Infinity") || obj.equals("NaN"))) {
            String valueOf = String.valueOf(number);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 39).append("Numeric values must be finite, but was ").append(valueOf).toString());
        }
        zzdl(false);
        this.out.append((CharSequence) obj);
        return this;
    }

    public zzaqr zzcs(long j) throws IOException {
        bP();
        zzdl(false);
        this.out.write(Long.toString(j));
        return this;
    }

    public zzaqr zzdh(boolean z) throws IOException {
        bP();
        zzdl(false);
        this.out.write(z ? "true" : "false");
        return this;
    }

    public final void zzdj(boolean z) {
        this.bof = z;
    }

    public final void zzdk(boolean z) {
        this.boe = z;
    }

    public zzaqr zzus(String str) throws IOException {
        if (str == null) {
            throw new NullPointerException("name == null");
        }
        if (this.brP != null) {
            throw new IllegalStateException();
        }
        if (this.bry == 0) {
            throw new IllegalStateException("JsonWriter is closed.");
        }
        this.brP = str;
        return this;
    }

    public zzaqr zzut(String str) throws IOException {
        if (str == null) {
            return bA();
        }
        bP();
        zzdl(false);
        zzuw(str);
        return this;
    }
}
