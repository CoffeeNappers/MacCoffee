package com.fasterxml.jackson.core.io;

import com.fasterxml.jackson.core.util.BufferRecycler;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;
import com.google.android.exoplayer2.extractor.ts.PsExtractor;
import java.lang.ref.SoftReference;
/* loaded from: classes.dex */
public final class JsonStringEncoder {
    private static final int SURR1_FIRST = 55296;
    private static final int SURR1_LAST = 56319;
    private static final int SURR2_FIRST = 56320;
    private static final int SURR2_LAST = 57343;
    protected ByteArrayBuilder _bytes;
    protected final char[] _qbuf = new char[6];
    protected TextBuffer _text;
    private static final char[] HC = CharTypes.copyHexChars();
    private static final byte[] HB = CharTypes.copyHexBytes();
    protected static final ThreadLocal<SoftReference<JsonStringEncoder>> _threadEncoder = new ThreadLocal<>();

    public JsonStringEncoder() {
        this._qbuf[0] = '\\';
        this._qbuf[2] = '0';
        this._qbuf[3] = '0';
    }

    public static JsonStringEncoder getInstance() {
        SoftReference<JsonStringEncoder> ref = _threadEncoder.get();
        JsonStringEncoder enc = ref == null ? null : ref.get();
        if (enc == null) {
            JsonStringEncoder enc2 = new JsonStringEncoder();
            _threadEncoder.set(new SoftReference<>(enc2));
            return enc2;
        }
        return enc;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0032, code lost:
        r9 = r8 + 1;
        r3 = r20.charAt(r8);
        r4 = r6[r3];
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x003c, code lost:
        if (r4 >= 0) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x003e, code lost:
        r11 = _appendNumeric(r3, r19._qbuf);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0055, code lost:
        if ((r12 + r11) <= r14.length) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0057, code lost:
        r7 = r14.length - r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x005c, code lost:
        if (r7 <= 0) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x005e, code lost:
        java.lang.System.arraycopy(r19._qbuf, 0, r14, r12, r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x006d, code lost:
        r14 = r16.finishCurrentSegment();
        r15 = r11 - r7;
        java.lang.System.arraycopy(r19._qbuf, r7, r14, 0, r15);
        r12 = r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00a6, code lost:
        r11 = _appendNamed(r4, r19._qbuf);
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00b5, code lost:
        java.lang.System.arraycopy(r19._qbuf, 0, r14, r12, r11);
        r12 = r12 + r11;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public char[] quoteAsString(java.lang.String r20) {
        /*
            r19 = this;
            r0 = r19
            com.fasterxml.jackson.core.util.TextBuffer r0 = r0._text
            r16 = r0
            if (r16 != 0) goto L15
            com.fasterxml.jackson.core.util.TextBuffer r16 = new com.fasterxml.jackson.core.util.TextBuffer
            r17 = 0
            r16.<init>(r17)
            r0 = r16
            r1 = r19
            r1._text = r0
        L15:
            char[] r14 = r16.emptyAndGetCurrentSegment()
            int[] r6 = com.fasterxml.jackson.core.io.CharTypes.get7BitOutputEscapes()
            int r5 = r6.length
            r8 = 0
            int r10 = r20.length()
            r12 = 0
        L24:
            if (r8 >= r10) goto L9a
        L26:
            r0 = r20
            char r2 = r0.charAt(r8)
            if (r2 >= r5) goto L85
            r17 = r6[r2]
            if (r17 == 0) goto L85
            int r9 = r8 + 1
            r0 = r20
            char r3 = r0.charAt(r8)
            r4 = r6[r3]
            if (r4 >= 0) goto La6
            r0 = r19
            char[] r0 = r0._qbuf
            r17 = r0
            r0 = r19
            r1 = r17
            int r11 = r0._appendNumeric(r3, r1)
        L4c:
            int r17 = r12 + r11
            int r0 = r14.length
            r18 = r0
            r0 = r17
            r1 = r18
            if (r0 <= r1) goto Lb5
            int r0 = r14.length
            r17 = r0
            int r7 = r17 - r12
            if (r7 <= 0) goto L6d
            r0 = r19
            char[] r0 = r0._qbuf
            r17 = r0
            r18 = 0
            r0 = r17
            r1 = r18
            java.lang.System.arraycopy(r0, r1, r14, r12, r7)
        L6d:
            char[] r14 = r16.finishCurrentSegment()
            int r15 = r11 - r7
            r0 = r19
            char[] r0 = r0._qbuf
            r17 = r0
            r18 = 0
            r0 = r17
            r1 = r18
            java.lang.System.arraycopy(r0, r7, r14, r1, r15)
            r12 = r15
        L83:
            r8 = r9
            goto L24
        L85:
            int r0 = r14.length
            r17 = r0
            r0 = r17
            if (r12 < r0) goto L91
            char[] r14 = r16.finishCurrentSegment()
            r12 = 0
        L91:
            int r13 = r12 + 1
            r14[r12] = r2
            int r8 = r8 + 1
            if (r8 < r10) goto La4
            r12 = r13
        L9a:
            r0 = r16
            r0.setCurrentLength(r12)
            char[] r17 = r16.contentsAsArray()
            return r17
        La4:
            r12 = r13
            goto L26
        La6:
            r0 = r19
            char[] r0 = r0._qbuf
            r17 = r0
            r0 = r19
            r1 = r17
            int r11 = r0._appendNamed(r4, r1)
            goto L4c
        Lb5:
            r0 = r19
            char[] r0 = r0._qbuf
            r17 = r0
            r18 = 0
            r0 = r17
            r1 = r18
            java.lang.System.arraycopy(r0, r1, r14, r12, r11)
            int r12 = r12 + r11
            goto L83
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.io.JsonStringEncoder.quoteAsString(java.lang.String):char[]");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0020, code lost:
        r8 = _appendNumeric(r1, r11._qbuf);
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x0026, code lost:
        r13.append(r11._qbuf, 0, r8);
        r5 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0036, code lost:
        r8 = _appendNamed(r2, r11._qbuf);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0016, code lost:
        r6 = r5 + 1;
        r1 = r12.charAt(r5);
        r2 = r4[r1];
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x001e, code lost:
        if (r2 >= 0) goto L13;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void quoteAsString(java.lang.CharSequence r12, java.lang.StringBuilder r13) {
        /*
            r11 = this;
            int[] r4 = com.fasterxml.jackson.core.io.CharTypes.get7BitOutputEscapes()
            int r3 = r4.length
            r5 = 0
            int r7 = r12.length()
        La:
            if (r5 >= r7) goto L35
        Lc:
            char r0 = r12.charAt(r5)
            if (r0 >= r3) goto L2e
            r9 = r4[r0]
            if (r9 == 0) goto L2e
            int r6 = r5 + 1
            char r1 = r12.charAt(r5)
            r2 = r4[r1]
            if (r2 >= 0) goto L36
            char[] r9 = r11._qbuf
            int r8 = r11._appendNumeric(r1, r9)
        L26:
            char[] r9 = r11._qbuf
            r10 = 0
            r13.append(r9, r10, r8)
            r5 = r6
            goto La
        L2e:
            r13.append(r0)
            int r5 = r5 + 1
            if (r5 < r7) goto Lc
        L35:
            return
        L36:
            char[] r9 = r11._qbuf
            int r8 = r11._appendNamed(r2, r9)
            goto L26
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.io.JsonStringEncoder.quoteAsString(java.lang.CharSequence, java.lang.StringBuilder):void");
    }

    public byte[] quoteAsUTF8(String text) {
        int outputPtr;
        int ch;
        int outputPtr2;
        int outputPtr3;
        int outputPtr4;
        ByteArrayBuilder bb = this._bytes;
        if (bb == null) {
            bb = new ByteArrayBuilder((BufferRecycler) null);
            this._bytes = bb;
        }
        int inputPtr = 0;
        int inputEnd = text.length();
        int outputPtr5 = 0;
        byte[] outputBuffer = bb.resetAndGetFirstSegment();
        loop0: while (true) {
            if (inputPtr >= inputEnd) {
                break;
            }
            int[] escCodes = CharTypes.get7BitOutputEscapes();
            while (true) {
                int ch2 = text.charAt(inputPtr);
                if (ch2 > 127 || escCodes[ch2] != 0) {
                    break;
                }
                if (outputPtr5 >= outputBuffer.length) {
                    outputBuffer = bb.finishCurrentSegment();
                    outputPtr5 = 0;
                }
                int outputPtr6 = outputPtr5 + 1;
                outputBuffer[outputPtr5] = (byte) ch2;
                inputPtr++;
                if (inputPtr >= inputEnd) {
                    outputPtr5 = outputPtr6;
                    break loop0;
                }
                outputPtr5 = outputPtr6;
            }
            if (outputPtr5 >= outputBuffer.length) {
                outputBuffer = bb.finishCurrentSegment();
                outputPtr5 = 0;
            }
            int inputPtr2 = inputPtr + 1;
            int ch3 = text.charAt(inputPtr);
            if (ch3 <= 127) {
                int escape = escCodes[ch3];
                outputPtr5 = _appendByte(ch3, escape, bb, outputPtr5);
                outputBuffer = bb.getCurrentSegment();
                inputPtr = inputPtr2;
            } else {
                if (ch3 <= 2047) {
                    outputBuffer[outputPtr5] = (byte) ((ch3 >> 6) | 192);
                    ch = (ch3 & 63) | 128;
                    outputPtr2 = outputPtr5 + 1;
                    inputPtr = inputPtr2;
                } else if (ch3 < 55296 || ch3 > 57343) {
                    int outputPtr7 = outputPtr5 + 1;
                    outputBuffer[outputPtr5] = (byte) ((ch3 >> 12) | 224);
                    if (outputPtr7 >= outputBuffer.length) {
                        outputBuffer = bb.finishCurrentSegment();
                        outputPtr = 0;
                    } else {
                        outputPtr = outputPtr7;
                    }
                    outputBuffer[outputPtr] = (byte) (((ch3 >> 6) & 63) | 128);
                    ch = (ch3 & 63) | 128;
                    outputPtr2 = outputPtr + 1;
                    inputPtr = inputPtr2;
                } else {
                    if (ch3 > 56319) {
                        _illegal(ch3);
                    }
                    if (inputPtr2 >= inputEnd) {
                        _illegal(ch3);
                    }
                    inputPtr = inputPtr2 + 1;
                    int ch4 = _convert(ch3, text.charAt(inputPtr2));
                    if (ch4 > 1114111) {
                        _illegal(ch4);
                    }
                    int outputPtr8 = outputPtr5 + 1;
                    outputBuffer[outputPtr5] = (byte) ((ch4 >> 18) | PsExtractor.VIDEO_STREAM_MASK);
                    if (outputPtr8 >= outputBuffer.length) {
                        outputBuffer = bb.finishCurrentSegment();
                        outputPtr3 = 0;
                    } else {
                        outputPtr3 = outputPtr8;
                    }
                    int outputPtr9 = outputPtr3 + 1;
                    outputBuffer[outputPtr3] = (byte) (((ch4 >> 12) & 63) | 128);
                    if (outputPtr9 >= outputBuffer.length) {
                        outputBuffer = bb.finishCurrentSegment();
                        outputPtr4 = 0;
                    } else {
                        outputPtr4 = outputPtr9;
                    }
                    outputBuffer[outputPtr4] = (byte) (((ch4 >> 6) & 63) | 128);
                    ch = (ch4 & 63) | 128;
                    outputPtr2 = outputPtr4 + 1;
                }
                if (outputPtr2 >= outputBuffer.length) {
                    outputBuffer = bb.finishCurrentSegment();
                    outputPtr2 = 0;
                }
                outputBuffer[outputPtr2] = (byte) ch;
                outputPtr5 = outputPtr2 + 1;
            }
        }
        return this._bytes.completeAndCoalesce(outputPtr5);
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0046, code lost:
        if (r7 < r6) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0048, code lost:
        r5 = r0.finishCurrentSegment();
        r6 = r5.length;
        r8 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0051, code lost:
        if (r1 >= 2048) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0053, code lost:
        r7 = r8 + 1;
        r5[r8] = (byte) ((r1 >> 6) | 192);
        r3 = r4;
        r1 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x005d, code lost:
        if (r7 < r6) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x005f, code lost:
        r5 = r0.finishCurrentSegment();
        r6 = r5.length;
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0074, code lost:
        if (r1 < 55296) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0079, code lost:
        if (r1 <= 57343) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x007b, code lost:
        r7 = r8 + 1;
        r5[r8] = (byte) ((r1 >> 12) | 224);
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0084, code lost:
        if (r7 < r6) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0086, code lost:
        r5 = r0.finishCurrentSegment();
        r6 = r5.length;
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x008c, code lost:
        r5[r7] = (byte) (((r1 >> 6) & 63) | 128);
        r7 = r7 + 1;
        r3 = r4;
        r1 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x009d, code lost:
        if (r1 <= 56319) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x009f, code lost:
        _illegal(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00a2, code lost:
        if (r4 < r2) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00a4, code lost:
        _illegal(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00a7, code lost:
        r3 = r4 + 1;
        r1 = _convert(r1, r11.charAt(r4));
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00b4, code lost:
        if (r1 <= 1114111) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00b6, code lost:
        _illegal(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00b9, code lost:
        r7 = r8 + 1;
        r5[r8] = (byte) ((r1 >> 18) | com.google.android.exoplayer2.extractor.ts.PsExtractor.VIDEO_STREAM_MASK);
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00c2, code lost:
        if (r7 < r6) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00c4, code lost:
        r5 = r0.finishCurrentSegment();
        r6 = r5.length;
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00ca, code lost:
        r8 = r7 + 1;
        r5[r7] = (byte) (((r1 >> 12) & 63) | 128);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00d5, code lost:
        if (r8 < r6) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00d7, code lost:
        r5 = r0.finishCurrentSegment();
        r6 = r5.length;
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00dd, code lost:
        r5[r7] = (byte) (((r1 >> 6) & 63) | 128);
        r7 = r7 + 1;
        r1 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00eb, code lost:
        r7 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00ed, code lost:
        r8 = r7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public byte[] encodeAsUTF8(java.lang.String r11) {
        /*
            Method dump skipped, instructions count: 243
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.io.JsonStringEncoder.encodeAsUTF8(java.lang.String):byte[]");
    }

    private int _appendNumeric(int value, char[] qbuf) {
        qbuf[1] = 'u';
        qbuf[4] = HC[value >> 4];
        qbuf[5] = HC[value & 15];
        return 6;
    }

    private int _appendNamed(int esc, char[] qbuf) {
        qbuf[1] = (char) esc;
        return 2;
    }

    private int _appendByte(int ch, int esc, ByteArrayBuilder bb, int ptr) {
        bb.setCurrentSegmentLength(ptr);
        bb.append(92);
        if (esc < 0) {
            bb.append(117);
            if (ch > 255) {
                int hi = ch >> 8;
                bb.append(HB[hi >> 4]);
                bb.append(HB[hi & 15]);
                ch &= 255;
            } else {
                bb.append(48);
                bb.append(48);
            }
            bb.append(HB[ch >> 4]);
            bb.append(HB[ch & 15]);
        } else {
            bb.append((byte) esc);
        }
        return bb.getCurrentSegmentLength();
    }

    private static int _convert(int p1, int p2) {
        if (p2 < 56320 || p2 > 57343) {
            throw new IllegalArgumentException("Broken surrogate pair: first char 0x" + Integer.toHexString(p1) + ", second 0x" + Integer.toHexString(p2) + "; illegal combination");
        }
        return 65536 + ((p1 - 55296) << 10) + (p2 - 56320);
    }

    private static void _illegal(int c) {
        throw new IllegalArgumentException(UTF8Writer.illegalSurrogateDesc(c));
    }
}
