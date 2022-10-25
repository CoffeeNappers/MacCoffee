package net.ypresto.androidtranscoder.format;

import android.media.MediaFormat;
import android.util.Log;
/* loaded from: classes3.dex */
class Android16By9FormatStrategy implements MediaFormatStrategy {
    public static final int AUDIO_BITRATE_AS_IS = -1;
    public static final int AUDIO_CHANNELS_AS_IS = -1;
    public static final int SCALE_720P = 5;
    private static final String TAG = "Android16By9FormatStrategy";
    private final int mAudioBitrate;
    private final int mAudioChannels;
    private final int mScale;
    private final int mVideoBitrate;

    public Android16By9FormatStrategy(int scale, int videoBitrate) {
        this(scale, videoBitrate, -1, -1);
    }

    public Android16By9FormatStrategy(int scale, int videoBitrate, int audioBitrate, int audioChannels) {
        this.mScale = scale;
        this.mVideoBitrate = videoBitrate;
        this.mAudioBitrate = audioBitrate;
        this.mAudioChannels = audioChannels;
    }

    @Override // net.ypresto.androidtranscoder.format.MediaFormatStrategy
    public MediaFormat createVideoOutputFormat(MediaFormat inputFormat) {
        int shorter;
        int longer;
        int outWidth;
        int outHeight;
        int width = inputFormat.getInteger("width");
        int height = inputFormat.getInteger("height");
        int targetLonger = this.mScale * 16 * 16;
        int targetShorter = this.mScale * 16 * 9;
        if (width >= height) {
            longer = width;
            shorter = height;
            outWidth = targetLonger;
            outHeight = targetShorter;
        } else {
            shorter = width;
            longer = height;
            outWidth = targetShorter;
            outHeight = targetLonger;
        }
        if (longer * 9 != shorter * 16) {
            throw new OutputFormatUnavailableException("This video is not 16:9, and is not able to transcode. (" + width + "x" + height + ")");
        }
        if (shorter <= targetShorter) {
            Log.d(TAG, "This video's height is less or equal to " + targetShorter + ", pass-through. (" + width + "x" + height + ")");
            return null;
        }
        MediaFormat format = MediaFormat.createVideoFormat("video/avc", outWidth, outHeight);
        format.setInteger("bitrate", this.mVideoBitrate);
        format.setInteger("frame-rate", 30);
        format.setInteger("i-frame-interval", 3);
        format.setInteger("color-format", 2130708361);
        return format;
    }

    @Override // net.ypresto.androidtranscoder.format.MediaFormatStrategy
    public MediaFormat createAudioOutputFormat(MediaFormat inputFormat) {
        if (this.mAudioBitrate == -1 || this.mAudioChannels == -1) {
            return null;
        }
        MediaFormat format = MediaFormat.createAudioFormat("audio/mp4a-latm", inputFormat.getInteger("sample-rate"), this.mAudioChannels);
        format.setInteger("aac-profile", 2);
        format.setInteger("bitrate", this.mAudioBitrate);
        return format;
    }
}
