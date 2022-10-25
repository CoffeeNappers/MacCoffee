package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.os.Build;
import android.util.Log;
import java.io.IOException;
/* loaded from: classes3.dex */
public class AudioEncoder extends MediaCodecState {
    private static final String TAG = "AudioEncoder";

    @Override // com.wmspanel.libstream.MediaCodecState
    public /* bridge */ /* synthetic */ void release() {
        super.release();
    }

    private AudioEncoder(MediaCodec encoder, MediaFormat format, MediaCodecInfo.CodecCapabilities cap) {
        if (encoder == null || format == null || cap == null) {
            throw new IllegalArgumentException();
        }
        this.mEncoder = encoder;
        this.mFormat = format;
        this.mCap = cap;
    }

    private static AudioEncoder createAudioEncoder16() {
        try {
            int codecCount = MediaCodecList.getCodecCount();
            AudioEncoder audioEncoder = null;
            for (int i = 0; i < codecCount; i++) {
                MediaCodecInfo codecInfoAt = MediaCodecList.getCodecInfoAt(i);
                if (codecInfoAt.isEncoder()) {
                    String[] supportedTypes = codecInfoAt.getSupportedTypes();
                    int length = supportedTypes.length;
                    int i2 = 0;
                    while (true) {
                        if (i2 >= length) {
                            break;
                        } else if (!supportedTypes[i2].equals("audio/mp4a-latm")) {
                            i2++;
                        } else {
                            MediaCodecInfo.CodecCapabilities capabilitiesForType = codecInfoAt.getCapabilitiesForType("audio/mp4a-latm");
                            if (capabilitiesForType == null) {
                                Log.e(TAG, "AudioEncoder16: failed to get aac codec capabilities");
                                return null;
                            }
                            MediaCodec createEncoderByType = MediaCodec.createEncoderByType("audio/mp4a-latm");
                            if (createEncoderByType == null) {
                                Log.e(TAG, "AudioEncoder16: failed to create aac encoder");
                                return null;
                            }
                            MediaFormat createAudioFormat = MediaFormat.createAudioFormat("audio/mp4a-latm", 44100, 1);
                            if (createAudioFormat == null) {
                                Log.e(TAG, "AudioEncoder16: failed to create audio format");
                                createEncoderByType.release();
                                return null;
                            }
                            audioEncoder = new AudioEncoder(createEncoderByType, createAudioFormat, capabilitiesForType);
                        }
                    }
                    if (audioEncoder != null) {
                        return audioEncoder;
                    }
                }
            }
            return audioEncoder;
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            return null;
        }
    }

    @TargetApi(18)
    private static AudioEncoder createAudioEncoder18() {
        AudioEncoder audioEncoder;
        MediaCodec createEncoderByType;
        try {
            createEncoderByType = MediaCodec.createEncoderByType("audio/mp4a-latm");
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            audioEncoder = null;
        }
        if (createEncoderByType == null) {
            Log.e(TAG, "AudioEncoder18: failed to create aac encoder");
            return null;
        }
        MediaCodecInfo codecInfo = createEncoderByType.getCodecInfo();
        if (codecInfo == null) {
            Log.e(TAG, "AudioEncoder18: failed to get aac codec info");
            createEncoderByType.release();
            return null;
        }
        MediaCodecInfo.CodecCapabilities capabilitiesForType = codecInfo.getCapabilitiesForType("audio/mp4a-latm");
        if (capabilitiesForType == null) {
            Log.e(TAG, "AudioEncoder18: failed to get aac codec capabilities");
            createEncoderByType.release();
            return null;
        }
        MediaFormat createAudioFormat = MediaFormat.createAudioFormat("audio/mp4a-latm", 44100, 1);
        if (createAudioFormat == null) {
            Log.e(TAG, "AudioEncoder18: failed to create audio format");
            createEncoderByType.release();
            return null;
        }
        audioEncoder = new AudioEncoder(createEncoderByType, createAudioFormat, capabilitiesForType);
        return audioEncoder;
    }

    public static AudioEncoder createAudioEncoder() {
        if (Build.VERSION.SDK_INT < 18) {
            return createAudioEncoder16();
        }
        return createAudioEncoder18();
    }

    public int[] getSupportedSampleRates() {
        return Build.VERSION.SDK_INT < 21 ? new int[]{44100} : this.mCap.getAudioCapabilities().getSupportedSampleRates();
    }

    public void setSampleRate(int sampleRate) {
        this.mFormat.setInteger("sample-rate", sampleRate);
    }

    public int getSampleRate() {
        return this.mFormat.getInteger("sample-rate");
    }

    public int getMaxInputChannelCount() {
        if (Build.VERSION.SDK_INT < 21) {
            return 1;
        }
        return this.mCap.getAudioCapabilities().getMaxInputChannelCount();
    }

    public void setChannelCount(int channelCount) {
        this.mFormat.setInteger("channel-count", channelCount);
    }

    public int getChannelCount() {
        return this.mFormat.getInteger("channel-count");
    }

    public void setBitRate(int bitRate) {
        this.mFormat.setInteger("bitrate", bitRate);
    }

    public void setAACProfile(int aacProfile) {
        this.mFormat.setInteger("aac-profile", aacProfile);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setBufferSize(int bufferSize) {
        this.mFormat.setInteger("max-input-size", bufferSize);
    }
}
