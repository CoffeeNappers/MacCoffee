package com.vkontakte.android.media.video;

import android.annotation.TargetApi;
import android.media.MediaFormat;
import android.util.Log;
import net.ypresto.androidtranscoder.format.MediaFormatStrategy;
@TargetApi(16)
/* loaded from: classes3.dex */
public class VKFormatStrategy implements MediaFormatStrategy {
    private static final String TAG = "VKFormatStrategy";
    private final int bitRate;
    private final int shorterLength;

    public VKFormatStrategy(VideoEncoderSettings videoEncoderSettings) {
        this.shorterLength = videoEncoderSettings.getShorterLength();
        this.bitRate = videoEncoderSettings.getBitrate();
    }

    @Override // net.ypresto.androidtranscoder.format.MediaFormatStrategy
    public MediaFormat createVideoOutputFormat(MediaFormat inputFormat) {
        int shorter;
        int outHeight;
        int outWidth;
        int width = inputFormat.getInteger("width");
        int height = inputFormat.getInteger("height");
        if (width >= height) {
            float ratio = width / height;
            shorter = height;
            outWidth = (int) Math.ceil(this.shorterLength * ratio);
            outHeight = this.shorterLength;
        } else {
            float ratio2 = height / width;
            shorter = width;
            outHeight = (int) Math.ceil(this.shorterLength * ratio2);
            outWidth = this.shorterLength;
        }
        if (shorter <= this.shorterLength) {
            Log.d(TAG, "This video is less or equal to target format, pass-through. (" + width + "x" + height + ")");
            return null;
        }
        MediaFormat format = MediaFormat.createVideoFormat("video/avc", outWidth, outHeight);
        format.setInteger("bitrate", this.bitRate);
        format.setInteger("frame-rate", 30);
        format.setInteger("i-frame-interval", 3);
        format.setInteger("color-format", 2130708361);
        return format;
    }

    @Override // net.ypresto.androidtranscoder.format.MediaFormatStrategy
    public MediaFormat createAudioOutputFormat(MediaFormat inputFormat) {
        return null;
    }
}
