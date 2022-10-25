package net.ypresto.androidtranscoder.format;

import android.media.MediaFormat;
import com.vkontakte.android.GCMBroadcastReceiver;
/* loaded from: classes.dex */
public class MediaFormatPresets {
    private static final int LONGER_LENGTH_960x540 = 960;

    private MediaFormatPresets() {
    }

    @Deprecated
    public static MediaFormat getExportPreset960x540() {
        MediaFormat format = MediaFormat.createVideoFormat("video/avc", LONGER_LENGTH_960x540, GCMBroadcastReceiver.ID_VALIDATE_DEVICE_NOTIFICATION_FIRST);
        format.setInteger("bitrate", 5500000);
        format.setInteger("color-format", 2130708361);
        format.setInteger("frame-rate", 30);
        format.setInteger("i-frame-interval", 1);
        return format;
    }

    public static MediaFormat getExportPreset960x540(int originalWidth, int originalHeight) {
        int width;
        int height;
        int longerLength = Math.max(originalWidth, originalHeight);
        int shorterLength = Math.min(originalWidth, originalHeight);
        if (longerLength <= LONGER_LENGTH_960x540) {
            return null;
        }
        int residue = (shorterLength * LONGER_LENGTH_960x540) % longerLength;
        if (residue != 0) {
            double ambiguousShorter = (960.0d * shorterLength) / longerLength;
            throw new OutputFormatUnavailableException(String.format("Could not fit to integer, original: (%d, %d), scaled: (%d, %f)", Integer.valueOf(longerLength), Integer.valueOf(shorterLength), Integer.valueOf((int) LONGER_LENGTH_960x540), Double.valueOf(ambiguousShorter)));
        }
        int scaledShorter = (shorterLength * LONGER_LENGTH_960x540) / longerLength;
        if (originalWidth >= originalHeight) {
            width = LONGER_LENGTH_960x540;
            height = scaledShorter;
        } else {
            width = scaledShorter;
            height = LONGER_LENGTH_960x540;
        }
        MediaFormat format = MediaFormat.createVideoFormat("video/avc", width, height);
        format.setInteger("bitrate", 5500000);
        format.setInteger("color-format", 2130708361);
        format.setInteger("frame-rate", 30);
        format.setInteger("i-frame-interval", 1);
        return format;
    }
}
