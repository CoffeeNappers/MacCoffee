package net.ypresto.androidtranscoder.engine;

import android.media.MediaFormat;
import java.nio.ByteBuffer;
import net.ypresto.androidtranscoder.utils.AvcCsdUtils;
import net.ypresto.androidtranscoder.utils.AvcSpsUtils;
/* loaded from: classes3.dex */
class MediaFormatValidator {
    private static final byte PROFILE_IDC_BASELINE = 66;

    MediaFormatValidator() {
    }

    public static void validateVideoOutputFormat(MediaFormat format) {
        String mime = format.getString("mime");
        if (!"video/avc".equals(mime)) {
            throw new InvalidOutputFormatException("Video codecs other than AVC is not supported, actual mime type: " + mime);
        }
        ByteBuffer spsBuffer = AvcCsdUtils.getSpsBuffer(format);
        byte profileIdc = AvcSpsUtils.getProfileIdc(spsBuffer);
        if (profileIdc != 66) {
            throw new InvalidOutputFormatException("Non-baseline AVC video profile is not supported by Android OS, actual profile_idc: " + ((int) profileIdc));
        }
    }

    public static void validateAudioOutputFormat(MediaFormat format) {
        String mime = format.getString("mime");
        if (!"audio/mp4a-latm".equals(mime)) {
            throw new InvalidOutputFormatException("Audio codecs other than AAC is not supported, actual mime type: " + mime);
        }
    }
}
