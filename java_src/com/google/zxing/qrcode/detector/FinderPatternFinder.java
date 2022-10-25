package com.google.zxing.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class FinderPatternFinder {
    private static final int CENTER_QUORUM = 2;
    protected static final int MAX_MODULES = 57;
    protected static final int MIN_SKIP = 3;
    private final int[] crossCheckStateCount;
    private boolean hasSkipped;
    private final BitMatrix image;
    private final List<FinderPattern> possibleCenters;
    private final ResultPointCallback resultPointCallback;

    public FinderPatternFinder(BitMatrix image) {
        this(image, null);
    }

    public FinderPatternFinder(BitMatrix image, ResultPointCallback resultPointCallback) {
        this.image = image;
        this.possibleCenters = new ArrayList();
        this.crossCheckStateCount = new int[5];
        this.resultPointCallback = resultPointCallback;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final BitMatrix getImage() {
        return this.image;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final List<FinderPattern> getPossibleCenters() {
        return this.possibleCenters;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final FinderPatternInfo find(Map<DecodeHintType, ?> hints) throws NotFoundException {
        boolean tryHarder = hints != null && hints.containsKey(DecodeHintType.TRY_HARDER);
        boolean pureBarcode = hints != null && hints.containsKey(DecodeHintType.PURE_BARCODE);
        int maxI = this.image.getHeight();
        int maxJ = this.image.getWidth();
        int iSkip = (maxI * 3) / 228;
        if (iSkip < 3 || tryHarder) {
            iSkip = 3;
        }
        boolean done = false;
        int[] stateCount = new int[5];
        int i = iSkip - 1;
        while (i < maxI && !done) {
            stateCount[0] = 0;
            stateCount[1] = 0;
            stateCount[2] = 0;
            stateCount[3] = 0;
            stateCount[4] = 0;
            int currentState = 0;
            int j = 0;
            while (j < maxJ) {
                if (this.image.get(j, i)) {
                    if ((currentState & 1) == 1) {
                        currentState++;
                    }
                    stateCount[currentState] = stateCount[currentState] + 1;
                } else if ((currentState & 1) == 0) {
                    if (currentState == 4) {
                        if (foundPatternCross(stateCount)) {
                            boolean confirmed = handlePossibleCenter(stateCount, i, j, pureBarcode);
                            if (confirmed) {
                                iSkip = 2;
                                if (this.hasSkipped) {
                                    done = haveMultiplyConfirmedCenters();
                                } else {
                                    int rowSkip = findRowSkip();
                                    if (rowSkip > stateCount[2]) {
                                        i += (rowSkip - stateCount[2]) - 2;
                                        j = maxJ - 1;
                                    }
                                }
                                currentState = 0;
                                stateCount[0] = 0;
                                stateCount[1] = 0;
                                stateCount[2] = 0;
                                stateCount[3] = 0;
                                stateCount[4] = 0;
                            } else {
                                stateCount[0] = stateCount[2];
                                stateCount[1] = stateCount[3];
                                stateCount[2] = stateCount[4];
                                stateCount[3] = 1;
                                stateCount[4] = 0;
                                currentState = 3;
                            }
                        } else {
                            stateCount[0] = stateCount[2];
                            stateCount[1] = stateCount[3];
                            stateCount[2] = stateCount[4];
                            stateCount[3] = 1;
                            stateCount[4] = 0;
                            currentState = 3;
                        }
                    } else {
                        currentState++;
                        stateCount[currentState] = stateCount[currentState] + 1;
                    }
                } else {
                    stateCount[currentState] = stateCount[currentState] + 1;
                }
                j++;
            }
            if (foundPatternCross(stateCount)) {
                boolean confirmed2 = handlePossibleCenter(stateCount, i, maxJ, pureBarcode);
                if (confirmed2) {
                    iSkip = stateCount[0];
                    if (this.hasSkipped) {
                        done = haveMultiplyConfirmedCenters();
                    }
                }
            }
            i += iSkip;
        }
        FinderPattern[] patternInfo = selectBestPatterns();
        ResultPoint.orderBestPatterns(patternInfo);
        return new FinderPatternInfo(patternInfo);
    }

    private static float centerFromEnd(int[] stateCount, int end) {
        return ((end - stateCount[4]) - stateCount[3]) - (stateCount[2] / 2.0f);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static boolean foundPatternCross(int[] stateCount) {
        boolean z = true;
        int totalModuleSize = 0;
        for (int i = 0; i < 5; i++) {
            int count = stateCount[i];
            if (count == 0) {
                return false;
            }
            totalModuleSize += count;
        }
        if (totalModuleSize >= 7) {
            float moduleSize = totalModuleSize / 7.0f;
            float maxVariance = moduleSize / 2.0f;
            if (Math.abs(moduleSize - stateCount[0]) >= maxVariance || Math.abs(moduleSize - stateCount[1]) >= maxVariance || Math.abs((3.0f * moduleSize) - stateCount[2]) >= 3.0f * maxVariance || Math.abs(moduleSize - stateCount[3]) >= maxVariance || Math.abs(moduleSize - stateCount[4]) >= maxVariance) {
                z = false;
            }
            return z;
        }
        return false;
    }

    private int[] getCrossCheckStateCount() {
        this.crossCheckStateCount[0] = 0;
        this.crossCheckStateCount[1] = 0;
        this.crossCheckStateCount[2] = 0;
        this.crossCheckStateCount[3] = 0;
        this.crossCheckStateCount[4] = 0;
        return this.crossCheckStateCount;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0025, code lost:
        if (r9 < r0) goto L98;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0027, code lost:
        if (r10 < r0) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0033, code lost:
        if (r8.image.get(r10 - r0, r9 - r0) != false) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0038, code lost:
        if (r3[1] > r11) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x003a, code lost:
        r3[1] = r3[1] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0044, code lost:
        if (r9 < r0) goto L95;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0046, code lost:
        if (r10 < r0) goto L95;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x004b, code lost:
        if (r3[1] <= r11) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x004d, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x004f, code lost:
        if (r9 < r0) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0051, code lost:
        if (r10 < r0) goto L93;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x005d, code lost:
        if (r8.image.get(r10 - r0, r9 - r0) == false) goto L92;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0062, code lost:
        if (r3[0] > r11) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0064, code lost:
        r3[0] = r3[0] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0071, code lost:
        if (r3[0] <= r11) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0073, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0075, code lost:
        r1 = r8.image.getHeight();
        r2 = r8.image.getWidth();
        r0 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0084, code lost:
        if ((r9 + r0) >= r1) goto L91;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0088, code lost:
        if ((r10 + r0) >= r2) goto L90;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0094, code lost:
        if (r8.image.get(r10 + r0, r9 + r0) == false) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0096, code lost:
        r3[2] = r3[2] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00a2, code lost:
        if ((r9 + r0) >= r1) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00a6, code lost:
        if ((r10 + r0) < r2) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00a8, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00ad, code lost:
        if ((r9 + r0) >= r1) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00b1, code lost:
        if ((r10 + r0) >= r2) goto L87;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00bd, code lost:
        if (r8.image.get(r10 + r0, r9 + r0) != false) goto L86;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00c2, code lost:
        if (r3[3] >= r11) goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00c4, code lost:
        r3[3] = r3[3] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x00d0, code lost:
        if ((r9 + r0) >= r1) goto L85;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00d4, code lost:
        if ((r10 + r0) >= r2) goto L85;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00d9, code lost:
        if (r3[3] < r11) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x00db, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x00e0, code lost:
        if ((r9 + r0) >= r1) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x00e4, code lost:
        if ((r10 + r0) >= r2) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x00f0, code lost:
        if (r8.image.get(r10 + r0, r9 + r0) == false) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x00f5, code lost:
        if (r3[4] >= r11) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x00f7, code lost:
        r3[4] = r3[4] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0104, code lost:
        if (r3[4] < r11) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0106, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0109, code lost:
        r4 = (((r3[0] + r3[1]) + r3[2]) + r3[3]) + r3[4];
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0125, code lost:
        if (java.lang.Math.abs(r4 - r12) >= (r12 * 2)) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x012b, code lost:
        if (foundPatternCross(r3) == false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x012d, code lost:
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x0130, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0021, code lost:
        if (r10 >= r0) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean crossCheckDiagonal(int r9, int r10, int r11, int r12) {
        /*
            Method dump skipped, instructions count: 307
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.qrcode.detector.FinderPatternFinder.crossCheckDiagonal(int, int, int, int):boolean");
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x003e, code lost:
        if (r3[1] <= r10) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0043, code lost:
        if (r0 < 0) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0049, code lost:
        if (r1.get(r9, r0) == false) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x004e, code lost:
        if (r3[0] > r10) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0050, code lost:
        r3[0] = r3[0] + 1;
        r0 = r0 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x005d, code lost:
        if (r3[0] <= r10) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x005f, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0062, code lost:
        r0 = r8 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0064, code lost:
        if (r0 >= r2) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x006a, code lost:
        if (r1.get(r9, r0) == false) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x006c, code lost:
        r3[2] = r3[2] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0076, code lost:
        if (r0 != r2) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0078, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007b, code lost:
        if (r0 >= r2) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0081, code lost:
        if (r1.get(r9, r0) != false) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0086, code lost:
        if (r3[3] >= r10) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0088, code lost:
        r3[3] = r3[3] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0092, code lost:
        if (r0 == r2) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0097, code lost:
        if (r3[3] < r10) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0099, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x009c, code lost:
        if (r0 >= r2) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00a2, code lost:
        if (r1.get(r9, r0) == false) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00a7, code lost:
        if (r3[4] >= r10) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00a9, code lost:
        r3[4] = r3[4] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00b6, code lost:
        if (r3[4] < r10) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00b8, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00bc, code lost:
        r4 = (((r3[0] + r3[1]) + r3[2]) + r3[3]) + r3[4];
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00da, code lost:
        if ((java.lang.Math.abs(r4 - r11) * 5) < (r11 * 2)) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x00dc, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00e4, code lost:
        if (foundPatternCross(r3) == false) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00ec, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:?, code lost:
        return centerFromEnd(r3, r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private float crossCheckVertical(int r8, int r9, int r10, int r11) {
        /*
            Method dump skipped, instructions count: 240
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.qrcode.detector.FinderPatternFinder.crossCheckVertical(int, int, int, int):float");
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x003e, code lost:
        if (r3[1] <= r10) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0043, code lost:
        if (r1 < 0) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0049, code lost:
        if (r0.get(r1, r9) == false) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x004e, code lost:
        if (r3[0] > r10) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0050, code lost:
        r3[0] = r3[0] + 1;
        r1 = r1 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x005d, code lost:
        if (r3[0] <= r10) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x005f, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0062, code lost:
        r1 = r8 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0064, code lost:
        if (r1 >= r2) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x006a, code lost:
        if (r0.get(r1, r9) == false) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x006c, code lost:
        r3[2] = r3[2] + 1;
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0076, code lost:
        if (r1 != r2) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0078, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007b, code lost:
        if (r1 >= r2) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0081, code lost:
        if (r0.get(r1, r9) != false) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0086, code lost:
        if (r3[3] >= r10) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0088, code lost:
        r3[3] = r3[3] + 1;
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0092, code lost:
        if (r1 == r2) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0097, code lost:
        if (r3[3] < r10) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0099, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x009c, code lost:
        if (r1 >= r2) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00a2, code lost:
        if (r0.get(r1, r9) == false) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00a7, code lost:
        if (r3[4] >= r10) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00a9, code lost:
        r3[4] = r3[4] + 1;
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00b6, code lost:
        if (r3[4] < r10) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00b8, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00bc, code lost:
        r4 = (((r3[0] + r3[1]) + r3[2]) + r3[3]) + r3[4];
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00d8, code lost:
        if ((java.lang.Math.abs(r4 - r11) * 5) < r11) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x00da, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00e2, code lost:
        if (foundPatternCross(r3) == false) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00ea, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:?, code lost:
        return centerFromEnd(r3, r1);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private float crossCheckHorizontal(int r8, int r9, int r10, int r11) {
        /*
            Method dump skipped, instructions count: 238
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.qrcode.detector.FinderPatternFinder.crossCheckHorizontal(int, int, int, int):float");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean handlePossibleCenter(int[] stateCount, int i, int j, boolean pureBarcode) {
        int stateCountTotal = stateCount[0] + stateCount[1] + stateCount[2] + stateCount[3] + stateCount[4];
        float centerJ = centerFromEnd(stateCount, j);
        float centerI = crossCheckVertical(i, (int) centerJ, stateCount[2], stateCountTotal);
        if (!Float.isNaN(centerI)) {
            float centerJ2 = crossCheckHorizontal((int) centerJ, (int) centerI, stateCount[2], stateCountTotal);
            if (!Float.isNaN(centerJ2) && (!pureBarcode || crossCheckDiagonal((int) centerI, (int) centerJ2, stateCount[2], stateCountTotal))) {
                float estimatedModuleSize = stateCountTotal / 7.0f;
                boolean found = false;
                int index = 0;
                while (true) {
                    if (index >= this.possibleCenters.size()) {
                        break;
                    }
                    FinderPattern center = this.possibleCenters.get(index);
                    if (!center.aboutEquals(estimatedModuleSize, centerI, centerJ2)) {
                        index++;
                    } else {
                        this.possibleCenters.set(index, center.combineEstimate(centerI, centerJ2, estimatedModuleSize));
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    FinderPattern point = new FinderPattern(centerJ2, centerI, estimatedModuleSize);
                    this.possibleCenters.add(point);
                    if (this.resultPointCallback != null) {
                        this.resultPointCallback.foundPossibleResultPoint(point);
                    }
                }
                return true;
            }
        }
        return false;
    }

    private int findRowSkip() {
        int max = this.possibleCenters.size();
        if (max <= 1) {
            return 0;
        }
        ResultPoint firstConfirmedCenter = null;
        for (FinderPattern center : this.possibleCenters) {
            if (center.getCount() >= 2) {
                if (firstConfirmedCenter == null) {
                    firstConfirmedCenter = center;
                } else {
                    this.hasSkipped = true;
                    return ((int) (Math.abs(firstConfirmedCenter.getX() - center.getX()) - Math.abs(firstConfirmedCenter.getY() - center.getY()))) / 2;
                }
            }
        }
        return 0;
    }

    private boolean haveMultiplyConfirmedCenters() {
        int confirmedCount = 0;
        float totalModuleSize = 0.0f;
        int max = this.possibleCenters.size();
        for (FinderPattern pattern : this.possibleCenters) {
            if (pattern.getCount() >= 2) {
                confirmedCount++;
                totalModuleSize += pattern.getEstimatedModuleSize();
            }
        }
        if (confirmedCount < 3) {
            return false;
        }
        float average = totalModuleSize / max;
        float totalDeviation = 0.0f;
        for (FinderPattern pattern2 : this.possibleCenters) {
            totalDeviation += Math.abs(pattern2.getEstimatedModuleSize() - average);
        }
        return totalDeviation <= 0.05f * totalModuleSize;
    }

    private FinderPattern[] selectBestPatterns() throws NotFoundException {
        int startSize = this.possibleCenters.size();
        if (startSize < 3) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (startSize > 3) {
            float totalModuleSize = 0.0f;
            float square = 0.0f;
            for (FinderPattern center : this.possibleCenters) {
                float size = center.getEstimatedModuleSize();
                totalModuleSize += size;
                square += size * size;
            }
            float average = totalModuleSize / startSize;
            float stdDev = (float) Math.sqrt((square / startSize) - (average * average));
            Collections.sort(this.possibleCenters, new FurthestFromAverageComparator(average));
            float limit = Math.max(0.2f * average, stdDev);
            int i = 0;
            while (i < this.possibleCenters.size() && this.possibleCenters.size() > 3) {
                FinderPattern pattern = this.possibleCenters.get(i);
                if (Math.abs(pattern.getEstimatedModuleSize() - average) > limit) {
                    this.possibleCenters.remove(i);
                    i--;
                }
                i++;
            }
        }
        if (this.possibleCenters.size() > 3) {
            float totalModuleSize2 = 0.0f;
            for (FinderPattern possibleCenter : this.possibleCenters) {
                totalModuleSize2 += possibleCenter.getEstimatedModuleSize();
            }
            Collections.sort(this.possibleCenters, new CenterComparator(totalModuleSize2 / this.possibleCenters.size()));
            this.possibleCenters.subList(3, this.possibleCenters.size()).clear();
        }
        return new FinderPattern[]{this.possibleCenters.get(0), this.possibleCenters.get(1), this.possibleCenters.get(2)};
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static final class FurthestFromAverageComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private FurthestFromAverageComparator(float f) {
            this.average = f;
        }

        @Override // java.util.Comparator
        public int compare(FinderPattern center1, FinderPattern center2) {
            float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
            float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
            if (dA < dB) {
                return -1;
            }
            return dA == dB ? 0 : 1;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static final class CenterComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private CenterComparator(float f) {
            this.average = f;
        }

        @Override // java.util.Comparator
        public int compare(FinderPattern center1, FinderPattern center2) {
            if (center2.getCount() == center1.getCount()) {
                float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
                float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
                if (dA < dB) {
                    return 1;
                }
                return dA == dB ? 0 : -1;
            }
            return center2.getCount() - center1.getCount();
        }
    }
}
