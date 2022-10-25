package com.google.android.exoplayer2.util;

import android.util.Log;
import com.vkontakte.android.media.audio.AudioMessageUtils;
import java.nio.ByteBuffer;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class NalUnitUtil {
    public static final int EXTENDED_SAR = 255;
    private static final int NAL_UNIT_TYPE_SPS = 7;
    private static final String TAG = "NalUnitUtil";
    public static final byte[] NAL_START_CODE = {0, 0, 0, 1};
    public static final float[] ASPECT_RATIO_IDC_VALUES = {1.0f, 1.0f, 1.0909091f, 0.90909094f, 1.4545455f, 1.2121212f, 2.1818182f, 1.8181819f, 2.909091f, 2.4242425f, 1.6363636f, 1.3636364f, 1.939394f, 1.6161616f, 1.3333334f, 1.5f, 2.0f};
    private static final Object scratchEscapePositionsLock = new Object();
    private static int[] scratchEscapePositions = new int[10];

    /* loaded from: classes.dex */
    public static final class SpsData {
        public final boolean deltaPicOrderAlwaysZeroFlag;
        public final boolean frameMbsOnlyFlag;
        public final int frameNumLength;
        public final int height;
        public final int picOrderCntLsbLength;
        public final int picOrderCountType;
        public final float pixelWidthAspectRatio;
        public final boolean separateColorPlaneFlag;
        public final int seqParameterSetId;
        public final int width;

        public SpsData(int seqParameterSetId, int width, int height, float pixelWidthAspectRatio, boolean separateColorPlaneFlag, boolean frameMbsOnlyFlag, int frameNumLength, int picOrderCountType, int picOrderCntLsbLength, boolean deltaPicOrderAlwaysZeroFlag) {
            this.seqParameterSetId = seqParameterSetId;
            this.width = width;
            this.height = height;
            this.pixelWidthAspectRatio = pixelWidthAspectRatio;
            this.separateColorPlaneFlag = separateColorPlaneFlag;
            this.frameMbsOnlyFlag = frameMbsOnlyFlag;
            this.frameNumLength = frameNumLength;
            this.picOrderCountType = picOrderCountType;
            this.picOrderCntLsbLength = picOrderCntLsbLength;
            this.deltaPicOrderAlwaysZeroFlag = deltaPicOrderAlwaysZeroFlag;
        }
    }

    /* loaded from: classes.dex */
    public static final class PpsData {
        public final boolean bottomFieldPicOrderInFramePresentFlag;
        public final int picParameterSetId;
        public final int seqParameterSetId;

        public PpsData(int picParameterSetId, int seqParameterSetId, boolean bottomFieldPicOrderInFramePresentFlag) {
            this.picParameterSetId = picParameterSetId;
            this.seqParameterSetId = seqParameterSetId;
            this.bottomFieldPicOrderInFramePresentFlag = bottomFieldPicOrderInFramePresentFlag;
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0056 -> B:23:0x0054). Please submit an issue!!! */
    public static int unescapeStream(byte[] data, int limit) {
        synchronized (scratchEscapePositionsLock) {
            int position = 0;
            int scratchEscapeCount = 0;
            while (position < limit) {
                try {
                    position = findNextUnescapeIndex(data, position, limit);
                    if (position < limit) {
                        if (scratchEscapePositions.length <= scratchEscapeCount) {
                            scratchEscapePositions = Arrays.copyOf(scratchEscapePositions, scratchEscapePositions.length * 2);
                        }
                        int scratchEscapeCount2 = scratchEscapeCount + 1;
                        try {
                            scratchEscapePositions[scratchEscapeCount] = position;
                            position += 3;
                            scratchEscapeCount = scratchEscapeCount2;
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            }
            int unescapedLength = limit - scratchEscapeCount;
            int escapedPosition = 0;
            int unescapedPosition = 0;
            for (int i = 0; i < scratchEscapeCount; i++) {
                int nextEscapePosition = scratchEscapePositions[i];
                int copyLength = nextEscapePosition - escapedPosition;
                System.arraycopy(data, escapedPosition, data, unescapedPosition, copyLength);
                int unescapedPosition2 = unescapedPosition + copyLength;
                int unescapedPosition3 = unescapedPosition2 + 1;
                data[unescapedPosition2] = 0;
                unescapedPosition = unescapedPosition3 + 1;
                data[unescapedPosition3] = 0;
                escapedPosition += copyLength + 3;
            }
            int remainingLength = unescapedLength - unescapedPosition;
            System.arraycopy(data, escapedPosition, data, unescapedPosition, remainingLength);
            return unescapedLength;
        }
    }

    public static void discardToSps(ByteBuffer data) {
        int length = data.position();
        int consecutiveZeros = 0;
        for (int offset = 0; offset + 1 < length; offset++) {
            int value = data.get(offset) & 255;
            if (consecutiveZeros == 3) {
                if (value == 1 && (data.get(offset + 1) & AudioMessageUtils.NORMALIZED_MAX_VALUE) == 7) {
                    ByteBuffer offsetData = data.duplicate();
                    offsetData.position(offset - 3);
                    offsetData.limit(length);
                    data.position(0);
                    data.put(offsetData);
                    return;
                }
            } else if (value == 0) {
                consecutiveZeros++;
            }
            if (value != 0) {
                consecutiveZeros = 0;
            }
        }
        data.clear();
    }

    public static int getNalUnitType(byte[] data, int offset) {
        return data[offset + 3] & AudioMessageUtils.NORMALIZED_MAX_VALUE;
    }

    public static int getH265NalUnitType(byte[] data, int offset) {
        return (data[offset + 3] & 126) >> 1;
    }

    public static SpsData parseSpsNalUnit(byte[] nalData, int nalOffset, int nalLimit) {
        int cropUnitX;
        int cropUnitY;
        ParsableNalUnitBitArray data = new ParsableNalUnitBitArray(nalData, nalOffset, nalLimit);
        data.skipBits(8);
        int profileIdc = data.readBits(8);
        data.skipBits(16);
        int seqParameterSetId = data.readUnsignedExpGolombCodedInt();
        int chromaFormatIdc = 1;
        boolean separateColorPlaneFlag = false;
        if (profileIdc == 100 || profileIdc == 110 || profileIdc == 122 || profileIdc == 244 || profileIdc == 44 || profileIdc == 83 || profileIdc == 86 || profileIdc == 118 || profileIdc == 128 || profileIdc == 138) {
            chromaFormatIdc = data.readUnsignedExpGolombCodedInt();
            if (chromaFormatIdc == 3) {
                separateColorPlaneFlag = data.readBit();
            }
            data.readUnsignedExpGolombCodedInt();
            data.readUnsignedExpGolombCodedInt();
            data.skipBits(1);
            boolean seqScalingMatrixPresentFlag = data.readBit();
            if (seqScalingMatrixPresentFlag) {
                int limit = chromaFormatIdc != 3 ? 8 : 12;
                int i = 0;
                while (i < limit) {
                    boolean seqScalingListPresentFlag = data.readBit();
                    if (seqScalingListPresentFlag) {
                        skipScalingList(data, i < 6 ? 16 : 64);
                    }
                    i++;
                }
            }
        }
        int frameNumLength = data.readUnsignedExpGolombCodedInt() + 4;
        int picOrderCntType = data.readUnsignedExpGolombCodedInt();
        int picOrderCntLsbLength = 0;
        boolean deltaPicOrderAlwaysZeroFlag = false;
        if (picOrderCntType == 0) {
            picOrderCntLsbLength = data.readUnsignedExpGolombCodedInt() + 4;
        } else if (picOrderCntType == 1) {
            deltaPicOrderAlwaysZeroFlag = data.readBit();
            data.readSignedExpGolombCodedInt();
            data.readSignedExpGolombCodedInt();
            long numRefFramesInPicOrderCntCycle = data.readUnsignedExpGolombCodedInt();
            for (int i2 = 0; i2 < numRefFramesInPicOrderCntCycle; i2++) {
                data.readUnsignedExpGolombCodedInt();
            }
        }
        data.readUnsignedExpGolombCodedInt();
        data.skipBits(1);
        int picWidthInMbs = data.readUnsignedExpGolombCodedInt() + 1;
        int picHeightInMapUnits = data.readUnsignedExpGolombCodedInt() + 1;
        boolean frameMbsOnlyFlag = data.readBit();
        int frameHeightInMbs = (2 - (frameMbsOnlyFlag ? 1 : 0)) * picHeightInMapUnits;
        if (!frameMbsOnlyFlag) {
            data.skipBits(1);
        }
        data.skipBits(1);
        int frameWidth = picWidthInMbs * 16;
        int frameHeight = frameHeightInMbs * 16;
        boolean frameCroppingFlag = data.readBit();
        if (frameCroppingFlag) {
            int frameCropLeftOffset = data.readUnsignedExpGolombCodedInt();
            int frameCropRightOffset = data.readUnsignedExpGolombCodedInt();
            int frameCropTopOffset = data.readUnsignedExpGolombCodedInt();
            int frameCropBottomOffset = data.readUnsignedExpGolombCodedInt();
            if (chromaFormatIdc == 0) {
                cropUnitX = 1;
                cropUnitY = 2 - (frameMbsOnlyFlag ? 1 : 0);
            } else {
                int subWidthC = chromaFormatIdc == 3 ? 1 : 2;
                int subHeightC = chromaFormatIdc == 1 ? 2 : 1;
                cropUnitX = subWidthC;
                cropUnitY = subHeightC * (2 - (frameMbsOnlyFlag ? 1 : 0));
            }
            frameWidth -= (frameCropLeftOffset + frameCropRightOffset) * cropUnitX;
            frameHeight -= (frameCropTopOffset + frameCropBottomOffset) * cropUnitY;
        }
        float pixelWidthHeightRatio = 1.0f;
        boolean vuiParametersPresentFlag = data.readBit();
        if (vuiParametersPresentFlag) {
            boolean aspectRatioInfoPresentFlag = data.readBit();
            if (aspectRatioInfoPresentFlag) {
                int aspectRatioIdc = data.readBits(8);
                if (aspectRatioIdc == 255) {
                    int sarWidth = data.readBits(16);
                    int sarHeight = data.readBits(16);
                    if (sarWidth != 0 && sarHeight != 0) {
                        pixelWidthHeightRatio = sarWidth / sarHeight;
                    }
                } else if (aspectRatioIdc < ASPECT_RATIO_IDC_VALUES.length) {
                    pixelWidthHeightRatio = ASPECT_RATIO_IDC_VALUES[aspectRatioIdc];
                } else {
                    Log.w(TAG, "Unexpected aspect_ratio_idc value: " + aspectRatioIdc);
                }
            }
        }
        return new SpsData(seqParameterSetId, frameWidth, frameHeight, pixelWidthHeightRatio, separateColorPlaneFlag, frameMbsOnlyFlag, frameNumLength, picOrderCntType, picOrderCntLsbLength, deltaPicOrderAlwaysZeroFlag);
    }

    public static PpsData parsePpsNalUnit(byte[] nalData, int nalOffset, int nalLimit) {
        ParsableNalUnitBitArray data = new ParsableNalUnitBitArray(nalData, nalOffset, nalLimit);
        data.skipBits(8);
        int picParameterSetId = data.readUnsignedExpGolombCodedInt();
        int seqParameterSetId = data.readUnsignedExpGolombCodedInt();
        data.skipBits(1);
        boolean bottomFieldPicOrderInFramePresentFlag = data.readBit();
        return new PpsData(picParameterSetId, seqParameterSetId, bottomFieldPicOrderInFramePresentFlag);
    }

    public static int findNalUnit(byte[] data, int startOffset, int endOffset, boolean[] prefixFlags) {
        boolean z = true;
        int length = endOffset - startOffset;
        Assertions.checkState(length >= 0);
        if (length != 0) {
            if (prefixFlags != null) {
                if (prefixFlags[0]) {
                    clearPrefixFlags(prefixFlags);
                    return startOffset - 3;
                } else if (length > 1 && prefixFlags[1] && data[startOffset] == 1) {
                    clearPrefixFlags(prefixFlags);
                    return startOffset - 2;
                } else if (length > 2 && prefixFlags[2] && data[startOffset] == 0 && data[startOffset + 1] == 1) {
                    clearPrefixFlags(prefixFlags);
                    return startOffset - 1;
                }
            }
            int limit = endOffset - 1;
            int i = startOffset + 2;
            while (i < limit) {
                if ((data[i] & 254) == 0) {
                    if (data[i - 2] == 0 && data[i - 1] == 0 && data[i] == 1) {
                        if (prefixFlags != null) {
                            clearPrefixFlags(prefixFlags);
                        }
                        return i - 2;
                    }
                    i -= 2;
                }
                i += 3;
            }
            if (prefixFlags != null) {
                prefixFlags[0] = length > 2 ? data[endOffset + (-3)] == 0 && data[endOffset + (-2)] == 0 && data[endOffset + (-1)] == 1 : length == 2 ? prefixFlags[2] && data[endOffset + (-2)] == 0 && data[endOffset + (-1)] == 1 : prefixFlags[1] && data[endOffset + (-1)] == 1;
                prefixFlags[1] = length > 1 ? data[endOffset + (-2)] == 0 && data[endOffset + (-1)] == 0 : prefixFlags[2] && data[endOffset + (-1)] == 0;
                if (data[endOffset - 1] != 0) {
                    z = false;
                }
                prefixFlags[2] = z;
                return endOffset;
            }
            return endOffset;
        }
        return endOffset;
    }

    public static void clearPrefixFlags(boolean[] prefixFlags) {
        prefixFlags[0] = false;
        prefixFlags[1] = false;
        prefixFlags[2] = false;
    }

    private static int findNextUnescapeIndex(byte[] bytes, int offset, int limit) {
        for (int i = offset; i < limit - 2; i++) {
            if (bytes[i] == 0 && bytes[i + 1] == 0 && bytes[i + 2] == 3) {
                return i;
            }
        }
        return limit;
    }

    private static void skipScalingList(ParsableNalUnitBitArray bitArray, int size) {
        int lastScale = 8;
        int nextScale = 8;
        for (int i = 0; i < size; i++) {
            if (nextScale != 0) {
                int deltaScale = bitArray.readSignedExpGolombCodedInt();
                nextScale = ((lastScale + deltaScale) + 256) % 256;
            }
            if (nextScale != 0) {
                lastScale = nextScale;
            }
        }
    }

    private NalUnitUtil() {
    }
}
