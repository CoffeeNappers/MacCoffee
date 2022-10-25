package com.google.zxing.qrcode.decoder;

import com.google.zxing.ResultPoint;
/* loaded from: classes2.dex */
public final class QRCodeDecoderMetaData {
    private final boolean mirrored;

    /* JADX INFO: Access modifiers changed from: package-private */
    public QRCodeDecoderMetaData(boolean mirrored) {
        this.mirrored = mirrored;
    }

    public boolean isMirrored() {
        return this.mirrored;
    }

    public void applyMirroredCorrection(ResultPoint[] points) {
        if (this.mirrored && points != null && points.length >= 3) {
            ResultPoint bottomLeft = points[0];
            points[0] = points[2];
            points[2] = bottomLeft;
        }
    }
}
