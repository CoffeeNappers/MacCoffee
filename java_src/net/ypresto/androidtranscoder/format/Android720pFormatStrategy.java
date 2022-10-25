package net.ypresto.androidtranscoder.format;

import android.media.MediaFormat;
import android.util.Log;
/* loaded from: classes3.dex */
class Android720pFormatStrategy implements MediaFormatStrategy {
    public static final int AUDIO_BITRATE_AS_IS = -1;
    public static final int AUDIO_CHANNELS_AS_IS = -1;
    private static final int DEFAULT_VIDEO_BITRATE = 8000000;
    private static final int LONGER_LENGTH = 1280;
    private static final int SHORTER_LENGTH = 720;
    private static final String TAG = "720pFormatStrategy";
    private final int mAudioBitrate;
    private final int mAudioChannels;
    private final int mVideoBitrate;

    public Android720pFormatStrategy() {
        this(DEFAULT_VIDEO_BITRATE);
    }

    public Android720pFormatStrategy(int videoBitrate) {
        this(videoBitrate, -1, -1);
    }

    public Android720pFormatStrategy(int videoBitrate, int audioBitrate, int audioChannels) {
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
        if (width >= height) {
            longer = width;
            shorter = height;
            outWidth = 1280;
            outHeight = 720;
        } else {
            shorter = width;
            longer = height;
            outWidth = 720;
            outHeight = 1280;
        }
        if (longer * 9 != shorter * 16) {
            throw new OutputFormatUnavailableException("This video is not 16:9, and is not able to transcode. (" + width + "x" + height + ")");
        }
        if (shorter <= 720) {
            Log.d(TAG, "This video is less or equal to 720p, pass-through. (" + width + "x" + height + ")");
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
