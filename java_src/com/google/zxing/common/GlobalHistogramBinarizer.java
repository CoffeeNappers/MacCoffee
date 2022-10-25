package com.google.zxing.common;

import com.google.zxing.Binarizer;
import com.google.zxing.LuminanceSource;
import com.google.zxing.NotFoundException;
/* loaded from: classes2.dex */
public class GlobalHistogramBinarizer extends Binarizer {
    private static final byte[] EMPTY = new byte[0];
    private static final int LUMINANCE_BITS = 5;
    private static final int LUMINANCE_BUCKETS = 32;
    private static final int LUMINANCE_SHIFT = 3;
    private final int[] buckets;
    private byte[] luminances;

    public GlobalHistogramBinarizer(LuminanceSource source) {
        super(source);
        this.luminances = EMPTY;
        this.buckets = new int[32];
    }

    @Override // com.google.zxing.Binarizer
    public BitArray getBlackRow(int y, BitArray row) throws NotFoundException {
        LuminanceSource source = getLuminanceSource();
        int width = source.getWidth();
        if (row == null || row.getSize() < width) {
            row = new BitArray(width);
        } else {
            row.clear();
        }
        initArrays(width);
        byte[] localLuminances = source.getRow(y, this.luminances);
        int[] localBuckets = this.buckets;
        for (int x = 0; x < width; x++) {
            int pixel = localLuminances[x] & 255;
            int i = pixel >> 3;
            localBuckets[i] = localBuckets[i] + 1;
        }
        int blackPoint = estimateBlackPoint(localBuckets);
        int left = localLuminances[0] & 255;
        int center = localLuminances[1] & 255;
        for (int x2 = 1; x2 < width - 1; x2++) {
            int right = localLuminances[x2 + 1] & 255;
            int luminance = (((center * 4) - left) - right) / 2;
            if (luminance < blackPoint) {
                row.set(x2);
            }
            left = center;
            center = right;
        }
        return row;
    }

    @Override // com.google.zxing.Binarizer
    public BitMatrix getBlackMatrix() throws NotFoundException {
        LuminanceSource source = getLuminanceSource();
        int width = source.getWidth();
        int height = source.getHeight();
        BitMatrix matrix = new BitMatrix(width, height);
        initArrays(width);
        int[] localBuckets = this.buckets;
        for (int y = 1; y < 5; y++) {
            int row = (height * y) / 5;
            byte[] localLuminances = source.getRow(row, this.luminances);
            int right = (width * 4) / 5;
            for (int x = width / 5; x < right; x++) {
                int pixel = localLuminances[x] & 255;
                int i = pixel >> 3;
                localBuckets[i] = localBuckets[i] + 1;
            }
        }
        int blackPoint = estimateBlackPoint(localBuckets);
        byte[] localLuminances2 = source.getMatrix();
        for (int y2 = 0; y2 < height; y2++) {
            int offset = y2 * width;
            for (int x2 = 0; x2 < width; x2++) {
                int pixel2 = localLuminances2[offset + x2] & 255;
                if (pixel2 < blackPoint) {
                    matrix.set(x2, y2);
                }
            }
        }
        return matrix;
    }

    @Override // com.google.zxing.Binarizer
    public Binarizer createBinarizer(LuminanceSource source) {
        return new GlobalHistogramBinarizer(source);
    }

    private void initArrays(int luminanceSize) {
        if (this.luminances.length < luminanceSize) {
            this.luminances = new byte[luminanceSize];
        }
        for (int x = 0; x < 32; x++) {
            this.buckets[x] = 0;
        }
    }

    private static int estimateBlackPoint(int[] buckets) throws NotFoundException {
        int numBuckets = buckets.length;
        int maxBucketCount = 0;
        int firstPeak = 0;
        int firstPeakSize = 0;
        for (int x = 0; x < numBuckets; x++) {
            if (buckets[x] > firstPeakSize) {
                firstPeak = x;
                firstPeakSize = buckets[x];
            }
            if (buckets[x] > maxBucketCount) {
                maxBucketCount = buckets[x];
            }
        }
        int secondPeak = 0;
        int secondPeakScore = 0;
        for (int x2 = 0; x2 < numBuckets; x2++) {
            int distanceToBiggest = x2 - firstPeak;
            int score = buckets[x2] * distanceToBiggest * distanceToBiggest;
            if (score > secondPeakScore) {
                secondPeak = x2;
                secondPeakScore = score;
            }
        }
        if (firstPeak > secondPeak) {
            int temp = firstPeak;
            firstPeak = secondPeak;
            secondPeak = temp;
        }
        if (secondPeak - firstPeak <= numBuckets / 16) {
            throw NotFoundException.getNotFoundInstance();
        }
        int bestValley = secondPeak - 1;
        int bestValleyScore = -1;
        for (int x3 = secondPeak - 1; x3 > firstPeak; x3--) {
            int fromFirst = x3 - firstPeak;
            int score2 = fromFirst * fromFirst * (secondPeak - x3) * (maxBucketCount - buckets[x3]);
            if (score2 > bestValleyScore) {
                bestValley = x3;
                bestValleyScore = score2;
            }
        }
        return bestValley << 3;
    }
}
