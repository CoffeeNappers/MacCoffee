package com.google.zxing.oned.rss.expanded.decoders;
/* loaded from: classes2.dex */
abstract class DecodedObject {
    private final int newPosition;

    /* JADX INFO: Access modifiers changed from: package-private */
    public DecodedObject(int newPosition) {
        this.newPosition = newPosition;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final int getNewPosition() {
        return this.newPosition;
    }
}
