package com.google.android.exoplayer2.util;

import android.util.Pair;
import com.google.android.gms.safetynet.SafetyNetStatusCodes;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class CodecSpecificDataUtil {
    private static final int AUDIO_OBJECT_TYPE_AAC_LC = 2;
    private static final int AUDIO_OBJECT_TYPE_ER_BSAC = 22;
    private static final int AUDIO_OBJECT_TYPE_PS = 29;
    private static final int AUDIO_OBJECT_TYPE_SBR = 5;
    private static final int AUDIO_SPECIFIC_CONFIG_CHANNEL_CONFIGURATION_INVALID = -1;
    private static final int AUDIO_SPECIFIC_CONFIG_FREQUENCY_INDEX_ARBITRARY = 15;
    private static final byte[] NAL_START_CODE = {0, 0, 0, 1};
    private static final int[] AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE = {96000, 88200, SettingsJsonConstants.SETTINGS_LOG_BUFFER_SIZE_DEFAULT, 48000, 44100, 32000, 24000, 22050, 16000, SafetyNetStatusCodes.SAFE_BROWSING_UNSUPPORTED_THREAT_TYPES, 11025, 8000, 7350};
    private static final int[] AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE = {0, 1, 2, 3, 4, 5, 6, 8, -1, -1, -1, 7, 8, -1, 8, -1};

    private CodecSpecificDataUtil() {
    }

    public static Pair<Integer, Integer> parseAacAudioSpecificConfig(byte[] audioSpecificConfig) {
        int sampleRate;
        boolean z = true;
        ParsableBitArray bitArray = new ParsableBitArray(audioSpecificConfig);
        int audioObjectType = bitArray.readBits(5);
        int frequencyIndex = bitArray.readBits(4);
        if (frequencyIndex == 15) {
            sampleRate = bitArray.readBits(24);
        } else {
            Assertions.checkArgument(frequencyIndex < 13);
            sampleRate = AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE[frequencyIndex];
        }
        int channelConfiguration = bitArray.readBits(4);
        if (audioObjectType == 5 || audioObjectType == 29) {
            int frequencyIndex2 = bitArray.readBits(4);
            if (frequencyIndex2 == 15) {
                sampleRate = bitArray.readBits(24);
            } else {
                Assertions.checkArgument(frequencyIndex2 < 13);
                sampleRate = AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE[frequencyIndex2];
            }
            if (bitArray.readBits(5) == 22) {
                channelConfiguration = bitArray.readBits(4);
            }
        }
        int channelCount = AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE[channelConfiguration];
        if (channelCount == -1) {
            z = false;
        }
        Assertions.checkArgument(z);
        return Pair.create(Integer.valueOf(sampleRate), Integer.valueOf(channelCount));
    }

    public static byte[] buildAacLcAudioSpecificConfig(int sampleRate, int numChannels) {
        int sampleRateIndex = -1;
        for (int i = 0; i < AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE.length; i++) {
            if (sampleRate == AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE[i]) {
                sampleRateIndex = i;
            }
        }
        int channelConfig = -1;
        for (int i2 = 0; i2 < AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE.length; i2++) {
            if (numChannels == AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE[i2]) {
                channelConfig = i2;
            }
        }
        if (sampleRate == -1 || channelConfig == -1) {
            throw new IllegalArgumentException("Invalid sample rate or number of channels: " + sampleRate + ", " + numChannels);
        }
        return buildAacAudioSpecificConfig(2, sampleRateIndex, channelConfig);
    }

    public static byte[] buildAacAudioSpecificConfig(int audioObjectType, int sampleRateIndex, int channelConfig) {
        byte[] specificConfig = {(byte) (((audioObjectType << 3) & 248) | ((sampleRateIndex >> 1) & 7)), (byte) (((sampleRateIndex << 7) & 128) | ((channelConfig << 3) & 120))};
        return specificConfig;
    }

    public static byte[] buildNalUnit(byte[] data, int offset, int length) {
        byte[] nalUnit = new byte[NAL_START_CODE.length + length];
        System.arraycopy(NAL_START_CODE, 0, nalUnit, 0, NAL_START_CODE.length);
        System.arraycopy(data, offset, nalUnit, NAL_START_CODE.length, length);
        return nalUnit;
    }

    public static byte[][] splitNalUnits(byte[] data) {
        if (!isNalStartCode(data, 0)) {
            return null;
        }
        List<Integer> starts = new ArrayList<>();
        int nalUnitIndex = 0;
        do {
            starts.add(Integer.valueOf(nalUnitIndex));
            nalUnitIndex = findNalStartCode(data, NAL_START_CODE.length + nalUnitIndex);
        } while (nalUnitIndex != -1);
        byte[][] split = new byte[starts.size()];
        int i = 0;
        while (i < starts.size()) {
            int startIndex = starts.get(i).intValue();
            int endIndex = i < starts.size() + (-1) ? starts.get(i + 1).intValue() : data.length;
            byte[] nal = new byte[endIndex - startIndex];
            System.arraycopy(data, startIndex, nal, 0, nal.length);
            split[i] = nal;
            i++;
        }
        return split;
    }

    private static int findNalStartCode(byte[] data, int index) {
        int endIndex = data.length - NAL_START_CODE.length;
        for (int i = index; i <= endIndex; i++) {
            if (isNalStartCode(data, i)) {
                return i;
            }
        }
        return -1;
    }

    private static boolean isNalStartCode(byte[] data, int index) {
        if (data.length - index <= NAL_START_CODE.length) {
            return false;
        }
        for (int j = 0; j < NAL_START_CODE.length; j++) {
            if (data[index + j] != NAL_START_CODE[j]) {
                return false;
            }
        }
        return true;
    }
}
