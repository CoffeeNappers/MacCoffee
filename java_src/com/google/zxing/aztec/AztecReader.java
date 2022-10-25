package com.google.zxing.aztec;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.Result;
/* loaded from: classes2.dex */
public final class AztecReader implements Reader {
    @Override // com.google.zxing.Reader
    public Result decode(BinaryBitmap image) throws NotFoundException, FormatException {
        return decode(image, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x006e  */
    @Override // com.google.zxing.Reader
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.zxing.Result decode(com.google.zxing.BinaryBitmap r24, java.util.Map<com.google.zxing.DecodeHintType, ?> r25) throws com.google.zxing.NotFoundException, com.google.zxing.FormatException {
        /*
            r23 = this;
            r15 = 0
            r12 = 0
            com.google.zxing.aztec.detector.Detector r8 = new com.google.zxing.aztec.detector.Detector
            com.google.zxing.common.BitMatrix r20 = r24.getBlackMatrix()
            r0 = r20
            r8.<init>(r0)
            r17 = 0
            r7 = 0
            r20 = 0
            r0 = r20
            com.google.zxing.aztec.AztecDetectorResult r9 = r8.detect(r0)     // Catch: com.google.zxing.NotFoundException -> L62 com.google.zxing.FormatException -> L65
            com.google.zxing.ResultPoint[] r17 = r9.getPoints()     // Catch: com.google.zxing.NotFoundException -> L62 com.google.zxing.FormatException -> L65
            com.google.zxing.aztec.decoder.Decoder r20 = new com.google.zxing.aztec.decoder.Decoder     // Catch: com.google.zxing.NotFoundException -> L62 com.google.zxing.FormatException -> L65
            r20.<init>()     // Catch: com.google.zxing.NotFoundException -> L62 com.google.zxing.FormatException -> L65
            r0 = r20
            com.google.zxing.common.DecoderResult r7 = r0.decode(r9)     // Catch: com.google.zxing.NotFoundException -> L62 com.google.zxing.FormatException -> L65
        L27:
            if (r7 != 0) goto L40
            r20 = 1
            r0 = r20
            com.google.zxing.aztec.AztecDetectorResult r9 = r8.detect(r0)     // Catch: com.google.zxing.NotFoundException -> L68 com.google.zxing.FormatException -> Laa
            com.google.zxing.ResultPoint[] r17 = r9.getPoints()     // Catch: com.google.zxing.NotFoundException -> L68 com.google.zxing.FormatException -> Laa
            com.google.zxing.aztec.decoder.Decoder r20 = new com.google.zxing.aztec.decoder.Decoder     // Catch: com.google.zxing.NotFoundException -> L68 com.google.zxing.FormatException -> Laa
            r20.<init>()     // Catch: com.google.zxing.NotFoundException -> L68 com.google.zxing.FormatException -> Laa
            r0 = r20
            com.google.zxing.common.DecoderResult r7 = r0.decode(r9)     // Catch: com.google.zxing.NotFoundException -> L68 com.google.zxing.FormatException -> Laa
        L40:
            if (r25 == 0) goto L72
            com.google.zxing.DecodeHintType r20 = com.google.zxing.DecodeHintType.NEED_RESULT_POINT_CALLBACK
            r0 = r25
            r1 = r20
            java.lang.Object r19 = r0.get(r1)
            com.google.zxing.ResultPointCallback r19 = (com.google.zxing.ResultPointCallback) r19
            if (r19 == 0) goto L72
            r5 = r17
            int r14 = r5.length
            r13 = 0
        L54:
            if (r13 >= r14) goto L72
            r16 = r5[r13]
            r0 = r19
            r1 = r16
            r0.foundPossibleResultPoint(r1)
            int r13 = r13 + 1
            goto L54
        L62:
            r10 = move-exception
            r15 = r10
            goto L27
        L65:
            r10 = move-exception
            r12 = r10
            goto L27
        L68:
            r20 = move-exception
            r10 = r20
        L6b:
            if (r15 == 0) goto L6e
            throw r15
        L6e:
            if (r12 == 0) goto L71
            throw r12
        L71:
            throw r10
        L72:
            com.google.zxing.Result r18 = new com.google.zxing.Result
            java.lang.String r20 = r7.getText()
            byte[] r21 = r7.getRawBytes()
            com.google.zxing.BarcodeFormat r22 = com.google.zxing.BarcodeFormat.AZTEC
            r0 = r18
            r1 = r20
            r2 = r21
            r3 = r17
            r4 = r22
            r0.<init>(r1, r2, r3, r4)
            java.util.List r6 = r7.getByteSegments()
            if (r6 == 0) goto L9a
            com.google.zxing.ResultMetadataType r20 = com.google.zxing.ResultMetadataType.BYTE_SEGMENTS
            r0 = r18
            r1 = r20
            r0.putMetadata(r1, r6)
        L9a:
            java.lang.String r11 = r7.getECLevel()
            if (r11 == 0) goto La9
            com.google.zxing.ResultMetadataType r20 = com.google.zxing.ResultMetadataType.ERROR_CORRECTION_LEVEL
            r0 = r18
            r1 = r20
            r0.putMetadata(r1, r11)
        La9:
            return r18
        Laa:
            r20 = move-exception
            r10 = r20
            goto L6b
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.aztec.AztecReader.decode(com.google.zxing.BinaryBitmap, java.util.Map):com.google.zxing.Result");
    }

    @Override // com.google.zxing.Reader
    public void reset() {
    }
}
