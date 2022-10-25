package net.ypresto.androidtranscoder.format;

import android.media.MediaFormat;
import android.util.Log;
/* loaded from: classes3.dex */
class ExportPreset960x540Strategy implements MediaFormatStrategy {
    private static final String TAG = "ExportPreset960x540Strategy";

    @Override // net.ypresto.androidtranscoder.format.MediaFormatStrategy
    public MediaFormat createVideoOutputFormat(MediaFormat inputFormat) {
        int width = inputFormat.getInteger("width");
        int height = inputFormat.getInteger("height");
        MediaFormat outputFormat = MediaFormatPresets.getExportPreset960x540(width, height);
        int outWidth = outputFormat.getInteger("width");
        int outHeight = outputFormat.getInteger("height");
        Log.d(TAG, String.format("inputFormat: %dx%d => outputFormat: %dx%d", Integer.valueOf(width), Integer.valueOf(height), Integer.valueOf(outWidth), Integer.valueOf(outHeight)));
        return outputFormat;
    }

    @Override // net.ypresto.androidtranscoder.format.MediaFormatStrategy
    public MediaFormat createAudioOutputFormat(MediaFormat inputFormat) {
        return null;
    }
}
