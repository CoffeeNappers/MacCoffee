package com.googlecode.mp4parser.authoring.builder;
/* loaded from: classes2.dex */
public class ByteBufferHelper {
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0086, code lost:
        if ((r0 instanceof java.nio.MappedByteBuffer) == false) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x008e, code lost:
        if ((r3.get(r1) instanceof java.nio.MappedByteBuffer) == false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00a9, code lost:
        if (r3.get(r1).limit() != (r3.get(r1).capacity() - r0.capacity())) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x00ab, code lost:
        r4 = r3.get(r1);
        r4.limit(r0.limit() + r4.limit());
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<java.nio.ByteBuffer> mergeAdjacentBuffers(java.util.List<java.nio.ByteBuffer> r10) {
        /*
            java.util.ArrayList r3 = new java.util.ArrayList
            int r5 = r10.size()
            r3.<init>(r5)
            java.util.Iterator r6 = r10.iterator()
        Ld:
            boolean r5 = r6.hasNext()
            if (r5 != 0) goto L14
            return r3
        L14:
            java.lang.Object r0 = r6.next()
            java.nio.ByteBuffer r0 = (java.nio.ByteBuffer) r0
            int r5 = r3.size()
            int r1 = r5 + (-1)
            if (r1 < 0) goto L82
            boolean r5 = r0.hasArray()
            if (r5 == 0) goto L82
            java.lang.Object r5 = r3.get(r1)
            java.nio.ByteBuffer r5 = (java.nio.ByteBuffer) r5
            boolean r5 = r5.hasArray()
            if (r5 == 0) goto L82
            byte[] r7 = r0.array()
            java.lang.Object r5 = r3.get(r1)
            java.nio.ByteBuffer r5 = (java.nio.ByteBuffer) r5
            byte[] r5 = r5.array()
            if (r7 != r5) goto L82
            java.lang.Object r5 = r3.get(r1)
            java.nio.ByteBuffer r5 = (java.nio.ByteBuffer) r5
            int r7 = r5.arrayOffset()
            java.lang.Object r5 = r3.get(r1)
            java.nio.ByteBuffer r5 = (java.nio.ByteBuffer) r5
            int r5 = r5.limit()
            int r5 = r5 + r7
            int r7 = r0.arrayOffset()
            if (r5 != r7) goto L82
            java.lang.Object r4 = r3.remove(r1)
            java.nio.ByteBuffer r4 = (java.nio.ByteBuffer) r4
            byte[] r5 = r0.array()
            int r7 = r4.arrayOffset()
            int r8 = r4.limit()
            int r9 = r0.limit()
            int r8 = r8 + r9
            java.nio.ByteBuffer r5 = java.nio.ByteBuffer.wrap(r5, r7, r8)
            java.nio.ByteBuffer r2 = r5.slice()
            r3.add(r2)
            goto Ld
        L82:
            if (r1 < 0) goto Lbf
            boolean r5 = r0 instanceof java.nio.MappedByteBuffer
            if (r5 == 0) goto Lbf
            java.lang.Object r5 = r3.get(r1)
            boolean r5 = r5 instanceof java.nio.MappedByteBuffer
            if (r5 == 0) goto Lbf
            java.lang.Object r5 = r3.get(r1)
            java.nio.ByteBuffer r5 = (java.nio.ByteBuffer) r5
            int r7 = r5.limit()
            java.lang.Object r5 = r3.get(r1)
            java.nio.ByteBuffer r5 = (java.nio.ByteBuffer) r5
            int r5 = r5.capacity()
            int r8 = r0.capacity()
            int r5 = r5 - r8
            if (r7 != r5) goto Lbf
            java.lang.Object r4 = r3.get(r1)
            java.nio.ByteBuffer r4 = (java.nio.ByteBuffer) r4
            int r5 = r0.limit()
            int r7 = r4.limit()
            int r5 = r5 + r7
            r4.limit(r5)
            goto Ld
        Lbf:
            r0.reset()
            r3.add(r0)
            goto Ld
        */
        throw new UnsupportedOperationException("Method not decompiled: com.googlecode.mp4parser.authoring.builder.ByteBufferHelper.mergeAdjacentBuffers(java.util.List):java.util.List");
    }
}
