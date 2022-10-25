package com.wmspanel.libstream;

import android.util.Log;
/* loaded from: classes3.dex */
class AudioEncoderBuilder {
    private static final String TAG = "AudioEncoderBuilder";
    private AudioConfig mConfig;

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setConfig(AudioConfig config) {
        this.mConfig = config;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AudioEncoder build() {
        boolean z;
        if (this.mConfig == null) {
            Log.e(TAG, Messages.err_build_audio_config_null);
            return null;
        }
        AudioEncoder createAudioEncoder = AudioEncoder.createAudioEncoder();
        if (createAudioEncoder != null) {
            int[] supportedSampleRates = createAudioEncoder.getSupportedSampleRates();
            if (supportedSampleRates != null) {
                int length = supportedSampleRates.length;
                int i = 0;
                while (true) {
                    if (i >= length) {
                        z = false;
                        break;
                    } else if (supportedSampleRates[i] != this.mConfig.sampleRate) {
                        i++;
                    } else {
                        z = true;
                        break;
                    }
                }
                if (!z) {
                    this.mConfig.sampleRate = supportedSampleRates[0];
                }
                createAudioEncoder.setSampleRate(this.mConfig.sampleRate);
            }
            int maxInputChannelCount = createAudioEncoder.getMaxInputChannelCount();
            if (maxInputChannelCount < this.mConfig.channelCount) {
                this.mConfig.channelCount = maxInputChannelCount;
            }
            createAudioEncoder.setChannelCount(this.mConfig.channelCount);
            createAudioEncoder.setAACProfile(2);
            createAudioEncoder.setBitRate(this.mConfig.bitRate);
            return createAudioEncoder;
        }
        return createAudioEncoder;
    }
}
