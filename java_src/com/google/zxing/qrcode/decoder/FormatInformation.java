package com.google.zxing.qrcode.decoder;
/* loaded from: classes2.dex */
final class FormatInformation {
    private final byte dataMask;
    private final ErrorCorrectionLevel errorCorrectionLevel;
    private static final int FORMAT_INFO_MASK_QR = 21522;
    private static final int[][] FORMAT_INFO_DECODE_LOOKUP = {new int[]{FORMAT_INFO_MASK_QR, 0}, new int[]{20773, 1}, new int[]{24188, 2}, new int[]{23371, 3}, new int[]{17913, 4}, new int[]{16590, 5}, new int[]{20375, 6}, new int[]{19104, 7}, new int[]{30660, 8}, new int[]{29427, 9}, new int[]{32170, 10}, new int[]{30877, 11}, new int[]{26159, 12}, new int[]{25368, 13}, new int[]{27713, 14}, new int[]{26998, 15}, new int[]{5769, 16}, new int[]{5054, 17}, new int[]{7399, 18}, new int[]{6608, 19}, new int[]{1890, 20}, new int[]{597, 21}, new int[]{3340, 22}, new int[]{2107, 23}, new int[]{13663, 24}, new int[]{12392, 25}, new int[]{16177, 26}, new int[]{14854, 27}, new int[]{9396, 28}, new int[]{8579, 29}, new int[]{11994, 30}, new int[]{11245, 31}};
    private static final int[] BITS_SET_IN_HALF_BYTE = {0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4};

    private FormatInformation(int formatInfo) {
        this.errorCorrectionLevel = ErrorCorrectionLevel.forBits((formatInfo >> 3) & 3);
        this.dataMask = (byte) (formatInfo & 7);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int numBitsDiffering(int a, int b) {
        int a2 = a ^ b;
        return BITS_SET_IN_HALF_BYTE[a2 & 15] + BITS_SET_IN_HALF_BYTE[(a2 >>> 4) & 15] + BITS_SET_IN_HALF_BYTE[(a2 >>> 8) & 15] + BITS_SET_IN_HALF_BYTE[(a2 >>> 12) & 15] + BITS_SET_IN_HALF_BYTE[(a2 >>> 16) & 15] + BITS_SET_IN_HALF_BYTE[(a2 >>> 20) & 15] + BITS_SET_IN_HALF_BYTE[(a2 >>> 24) & 15] + BITS_SET_IN_HALF_BYTE[(a2 >>> 28) & 15];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static FormatInformation decodeFormatInformation(int maskedFormatInfo1, int maskedFormatInfo2) {
        FormatInformation formatInfo = doDecodeFormatInformation(maskedFormatInfo1, maskedFormatInfo2);
        return formatInfo != null ? formatInfo : doDecodeFormatInformation(maskedFormatInfo1 ^ FORMAT_INFO_MASK_QR, maskedFormatInfo2 ^ FORMAT_INFO_MASK_QR);
    }

    private static FormatInformation doDecodeFormatInformation(int maskedFormatInfo1, int maskedFormatInfo2) {
        int bitsDifference;
        int bestDifference = Integer.MAX_VALUE;
        int bestFormatInfo = 0;
        int[][] arr$ = FORMAT_INFO_DECODE_LOOKUP;
        for (int[] decodeInfo : arr$) {
            int targetInfo = decodeInfo[0];
            if (targetInfo == maskedFormatInfo1 || targetInfo == maskedFormatInfo2) {
                return new FormatInformation(decodeInfo[1]);
            }
            int bitsDifference2 = numBitsDiffering(maskedFormatInfo1, targetInfo);
            if (bitsDifference2 < bestDifference) {
                bestFormatInfo = decodeInfo[1];
                bestDifference = bitsDifference2;
            }
            if (maskedFormatInfo1 != maskedFormatInfo2 && (bitsDifference = numBitsDiffering(maskedFormatInfo2, targetInfo)) < bestDifference) {
                bestFormatInfo = decodeInfo[1];
                bestDifference = bitsDifference;
            }
        }
        if (bestDifference <= 3) {
            return new FormatInformation(bestFormatInfo);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ErrorCorrectionLevel getErrorCorrectionLevel() {
        return this.errorCorrectionLevel;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte getDataMask() {
        return this.dataMask;
    }

    public int hashCode() {
        return (this.errorCorrectionLevel.ordinal() << 3) | this.dataMask;
    }

    public boolean equals(Object o) {
        if (!(o instanceof FormatInformation)) {
            return false;
        }
        FormatInformation other = (FormatInformation) o;
        return this.errorCorrectionLevel == other.errorCorrectionLevel && this.dataMask == other.dataMask;
    }
}
