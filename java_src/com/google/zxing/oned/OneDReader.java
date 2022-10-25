package com.google.zxing.oned;

import com.facebook.imagepipeline.common.RotationOptions;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import com.my.target.ads.instream.InstreamAd;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.Map;
/* loaded from: classes2.dex */
public abstract class OneDReader implements Reader {
    public abstract Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException;

    @Override // com.google.zxing.Reader
    public Result decode(BinaryBitmap image) throws NotFoundException, FormatException {
        return decode(image, null);
    }

    @Override // com.google.zxing.Reader
    public Result decode(BinaryBitmap image, Map<DecodeHintType, ?> hints) throws NotFoundException, FormatException {
        try {
            return doDecode(image, hints);
        } catch (NotFoundException nfe) {
            boolean tryHarder = hints != null && hints.containsKey(DecodeHintType.TRY_HARDER);
            if (tryHarder && image.isRotateSupported()) {
                BinaryBitmap rotatedImage = image.rotateCounterClockwise();
                Result result = doDecode(rotatedImage, hints);
                Map<ResultMetadataType, ?> metadata = result.getResultMetadata();
                int orientation = RotationOptions.ROTATE_270;
                if (metadata != null && metadata.containsKey(ResultMetadataType.ORIENTATION)) {
                    orientation = (((Integer) metadata.get(ResultMetadataType.ORIENTATION)).intValue() + RotationOptions.ROTATE_270) % InstreamAd.DEFAULT_VIDEO_QUALITY;
                }
                result.putMetadata(ResultMetadataType.ORIENTATION, Integer.valueOf(orientation));
                ResultPoint[] points = result.getResultPoints();
                if (points != null) {
                    int height = rotatedImage.getHeight();
                    for (int i = 0; i < points.length; i++) {
                        points[i] = new ResultPoint((height - points[i].getY()) - 1.0f, points[i].getX());
                    }
                    return result;
                }
                return result;
            }
            throw nfe;
        }
    }

    @Override // com.google.zxing.Reader
    public void reset() {
    }

    private Result doDecode(BinaryBitmap image, Map<DecodeHintType, ?> hints) throws NotFoundException {
        int maxLines;
        int width = image.getWidth();
        int height = image.getHeight();
        BitArray row = new BitArray(width);
        int middle = height >> 1;
        boolean tryHarder = hints != null && hints.containsKey(DecodeHintType.TRY_HARDER);
        int rowStep = Math.max(1, height >> (tryHarder ? 8 : 5));
        if (tryHarder) {
            maxLines = height;
        } else {
            maxLines = 15;
        }
        for (int x = 0; x < maxLines; x++) {
            int rowStepsAboveOrBelow = (x + 1) / 2;
            boolean isAbove = (x & 1) == 0;
            if (!isAbove) {
                rowStepsAboveOrBelow = -rowStepsAboveOrBelow;
            }
            int rowNumber = middle + (rowStep * rowStepsAboveOrBelow);
            if (rowNumber < 0 || rowNumber >= height) {
                break;
            }
            try {
                row = image.getBlackRow(rowNumber, row);
                for (int attempt = 0; attempt < 2; attempt++) {
                    if (attempt == 1) {
                        row.reverse();
                        if (hints != null) {
                            if (hints.containsKey(DecodeHintType.NEED_RESULT_POINT_CALLBACK)) {
                                EnumMap enumMap = new EnumMap(DecodeHintType.class);
                                enumMap.putAll(hints);
                                enumMap.remove(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
                                hints = enumMap;
                            }
                        }
                    }
                    try {
                        Result result = decodeRow(rowNumber, row, hints);
                        if (attempt == 1) {
                            result.putMetadata(ResultMetadataType.ORIENTATION, Integer.valueOf((int) RotationOptions.ROTATE_180));
                            ResultPoint[] points = result.getResultPoints();
                            if (points != null) {
                                points[0] = new ResultPoint((width - points[0].getX()) - 1.0f, points[0].getY());
                                points[1] = new ResultPoint((width - points[1].getX()) - 1.0f, points[1].getY());
                            }
                        }
                        return result;
                    } catch (ReaderException e) {
                    }
                }
                continue;
            } catch (NotFoundException e2) {
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void recordPattern(BitArray row, int start, int[] counters) throws NotFoundException {
        int numCounters = counters.length;
        Arrays.fill(counters, 0, numCounters, 0);
        int end = row.getSize();
        if (start >= end) {
            throw NotFoundException.getNotFoundInstance();
        }
        boolean isWhite = !row.get(start);
        int counterPosition = 0;
        int i = start;
        while (i < end) {
            if (row.get(i) ^ isWhite) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                counterPosition++;
                if (counterPosition == numCounters) {
                    break;
                }
                counters[counterPosition] = 1;
                isWhite = !isWhite;
            }
            i++;
        }
        if (counterPosition == numCounters) {
            return;
        }
        if (counterPosition != numCounters - 1 || i != end) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void recordPatternInReverse(BitArray row, int start, int[] counters) throws NotFoundException {
        int numTransitionsLeft = counters.length;
        boolean last = row.get(start);
        while (start > 0 && numTransitionsLeft >= 0) {
            start--;
            if (row.get(start) != last) {
                numTransitionsLeft--;
                last = !last;
            }
        }
        if (numTransitionsLeft >= 0) {
            throw NotFoundException.getNotFoundInstance();
        }
        recordPattern(row, start + 1, counters);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static float patternMatchVariance(int[] counters, int[] pattern, float maxIndividualVariance) {
        int numCounters = counters.length;
        int total = 0;
        int patternLength = 0;
        for (int i = 0; i < numCounters; i++) {
            total += counters[i];
            patternLength += pattern[i];
        }
        if (total < patternLength) {
            return Float.POSITIVE_INFINITY;
        }
        float unitBarWidth = total / patternLength;
        float maxIndividualVariance2 = maxIndividualVariance * unitBarWidth;
        float totalVariance = 0.0f;
        for (int x = 0; x < numCounters; x++) {
            int counter = counters[x];
            float scaledPattern = pattern[x] * unitBarWidth;
            float variance = ((float) counter) > scaledPattern ? counter - scaledPattern : scaledPattern - counter;
            if (variance > maxIndividualVariance2) {
                return Float.POSITIVE_INFINITY;
            }
            totalVariance += variance;
        }
        return totalVariance / total;
    }
}
