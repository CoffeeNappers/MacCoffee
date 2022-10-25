package com.google.zxing.qrcode.decoder;

import com.google.zxing.common.BitMatrix;
/* loaded from: classes2.dex */
abstract class DataMask {
    private static final DataMask[] DATA_MASKS = {new DataMask000(), new DataMask001(), new DataMask010(), new DataMask011(), new DataMask100(), new DataMask101(), new DataMask110(), new DataMask111()};

    abstract boolean isMasked(int i, int i2);

    private DataMask() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void unmaskBitMatrix(BitMatrix bits, int dimension) {
        for (int i = 0; i < dimension; i++) {
            for (int j = 0; j < dimension; j++) {
                if (isMasked(i, j)) {
                    bits.flip(j, i);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static DataMask forReference(int reference) {
        if (reference < 0 || reference > 7) {
            throw new IllegalArgumentException();
        }
        return DATA_MASKS[reference];
    }

    /* loaded from: classes2.dex */
    private static final class DataMask000 extends DataMask {
        private DataMask000() {
            super();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return ((i + j) & 1) == 0;
        }
    }

    /* loaded from: classes2.dex */
    private static final class DataMask001 extends DataMask {
        private DataMask001() {
            super();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return (i & 1) == 0;
        }
    }

    /* loaded from: classes2.dex */
    private static final class DataMask010 extends DataMask {
        private DataMask010() {
            super();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return j % 3 == 0;
        }
    }

    /* loaded from: classes2.dex */
    private static final class DataMask011 extends DataMask {
        private DataMask011() {
            super();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return (i + j) % 3 == 0;
        }
    }

    /* loaded from: classes2.dex */
    private static final class DataMask100 extends DataMask {
        private DataMask100() {
            super();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return (((i / 2) + (j / 3)) & 1) == 0;
        }
    }

    /* loaded from: classes2.dex */
    private static final class DataMask101 extends DataMask {
        private DataMask101() {
            super();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            int temp = i * j;
            return (temp & 1) + (temp % 3) == 0;
        }
    }

    /* loaded from: classes2.dex */
    private static final class DataMask110 extends DataMask {
        private DataMask110() {
            super();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            int temp = i * j;
            return (((temp & 1) + (temp % 3)) & 1) == 0;
        }
    }

    /* loaded from: classes2.dex */
    private static final class DataMask111 extends DataMask {
        private DataMask111() {
            super();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return ((((i + j) & 1) + ((i * j) % 3)) & 1) == 0;
        }
    }
}
