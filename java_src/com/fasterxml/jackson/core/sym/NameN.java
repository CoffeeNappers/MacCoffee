package com.fasterxml.jackson.core.sym;

import java.util.Arrays;
/* loaded from: classes.dex */
public final class NameN extends Name {
    private final int[] q;
    private final int q1;
    private final int q2;
    private final int q3;
    private final int q4;
    private final int qlen;

    NameN(String name, int hash, int q1, int q2, int q3, int q4, int[] quads, int quadLen) {
        super(name, hash);
        this.q1 = q1;
        this.q2 = q2;
        this.q3 = q3;
        this.q4 = q4;
        this.q = quads;
        this.qlen = quadLen;
    }

    public static NameN construct(String name, int hash, int[] q, int qlen) {
        int[] buf;
        if (qlen < 4) {
            throw new IllegalArgumentException();
        }
        int q1 = q[0];
        int q2 = q[1];
        int q3 = q[2];
        int q4 = q[3];
        int rem = qlen - 4;
        if (rem > 0) {
            buf = Arrays.copyOfRange(q, 4, qlen);
        } else {
            buf = null;
        }
        return new NameN(name, hash, q1, q2, q3, q4, buf, qlen);
    }

    @Override // com.fasterxml.jackson.core.sym.Name
    public boolean equals(int quad) {
        return false;
    }

    @Override // com.fasterxml.jackson.core.sym.Name
    public boolean equals(int quad1, int quad2) {
        return false;
    }

    @Override // com.fasterxml.jackson.core.sym.Name
    public boolean equals(int quad1, int quad2, int quad3) {
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:31:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:32:? A[RETURN, SYNTHETIC] */
    @Override // com.fasterxml.jackson.core.sym.Name
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean equals(int[] r7, int r8) {
        /*
            r6 = this;
            r5 = 3
            r4 = 2
            r1 = 1
            r0 = 0
            int r2 = r6.qlen
            if (r8 == r2) goto L9
        L8:
            return r0
        L9:
            r2 = r7[r0]
            int r3 = r6.q1
            if (r2 != r3) goto L8
            r2 = r7[r1]
            int r3 = r6.q2
            if (r2 != r3) goto L8
            r2 = r7[r4]
            int r3 = r6.q3
            if (r2 != r3) goto L8
            r2 = r7[r5]
            int r3 = r6.q4
            if (r2 != r3) goto L8
            switch(r8) {
                case 4: goto L4d;
                case 5: goto L44;
                case 6: goto L3b;
                case 7: goto L32;
                case 8: goto L29;
                default: goto L24;
            }
        L24:
            boolean r0 = r6._equals2(r7)
            goto L8
        L29:
            r2 = 7
            r2 = r7[r2]
            int[] r3 = r6.q
            r3 = r3[r5]
            if (r2 != r3) goto L8
        L32:
            r2 = 6
            r2 = r7[r2]
            int[] r3 = r6.q
            r3 = r3[r4]
            if (r2 != r3) goto L8
        L3b:
            r2 = 5
            r2 = r7[r2]
            int[] r3 = r6.q
            r3 = r3[r1]
            if (r2 != r3) goto L8
        L44:
            r2 = 4
            r2 = r7[r2]
            int[] r3 = r6.q
            r3 = r3[r0]
            if (r2 != r3) goto L8
        L4d:
            r0 = r1
            goto L8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.sym.NameN.equals(int[], int):boolean");
    }

    private final boolean _equals2(int[] quads) {
        int end = this.qlen - 4;
        for (int i = 0; i < end; i++) {
            if (quads[i + 4] != this.q[i]) {
                return false;
            }
        }
        return true;
    }
}
