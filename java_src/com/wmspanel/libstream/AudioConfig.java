package com.wmspanel.libstream;

import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
/* loaded from: classes3.dex */
public class AudioConfig {
    public static final int AAC_PROFILE = 2;
    public int audioSource = 5;
    public int channelCount = 1;
    public int sampleRate = 44100;
    public int bitRate = calcBitRate(this.sampleRate, this.channelCount, 2);

    public static int calcBitRate(int sampleRate, int channelCount, int aacProfile) {
        return getNearestBitrate(((sampleRate * 16) * channelCount) / getCompression(aacProfile));
    }

    public static int getCompression(int aacProfile) {
        switch (aacProfile) {
            case 2:
                return 15;
            case 3:
            case 4:
            default:
                return 16;
            case 5:
                return 17;
        }
    }

    public static int getNearestBitrate(int bitrate) {
        int[] iArr = {8000, 16000, 18000, 20000, 24000, 32000, 40000, 48000, 56000, SettingsJsonConstants.SETTINGS_LOG_BUFFER_SIZE_DEFAULT, 80000, 96000, 112000, 128000, 160000, 192000, 256000, 320000};
        int i = 0;
        for (int i2 = 1; i2 < iArr.length; i2++) {
            if (Math.abs(iArr[i2] - bitrate) <= Math.abs(iArr[i] - bitrate)) {
                i = i2;
            }
        }
        return iArr[i];
    }
}
