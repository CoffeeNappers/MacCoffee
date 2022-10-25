package net.ypresto.androidtranscoder.format;

import android.media.MediaFormat;
/* loaded from: classes3.dex */
public interface MediaFormatStrategy {
    MediaFormat createAudioOutputFormat(MediaFormat mediaFormat);

    MediaFormat createVideoOutputFormat(MediaFormat mediaFormat);
}
