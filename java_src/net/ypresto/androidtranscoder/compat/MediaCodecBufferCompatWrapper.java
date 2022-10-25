package net.ypresto.androidtranscoder.compat;

import android.media.MediaCodec;
import android.os.Build;
import java.nio.ByteBuffer;
/* loaded from: classes3.dex */
public class MediaCodecBufferCompatWrapper {
    final ByteBuffer[] mInputBuffers;
    final MediaCodec mMediaCodec;
    final ByteBuffer[] mOutputBuffers;

    public MediaCodecBufferCompatWrapper(MediaCodec mediaCodec) {
        this.mMediaCodec = mediaCodec;
        if (Build.VERSION.SDK_INT < 21) {
            this.mInputBuffers = mediaCodec.getInputBuffers();
            this.mOutputBuffers = mediaCodec.getOutputBuffers();
            return;
        }
        this.mOutputBuffers = null;
        this.mInputBuffers = null;
    }

    public ByteBuffer getInputBuffer(int index) {
        return Build.VERSION.SDK_INT >= 21 ? this.mMediaCodec.getInputBuffer(index) : this.mInputBuffers[index];
    }

    public ByteBuffer getOutputBuffer(int index) {
        return Build.VERSION.SDK_INT >= 21 ? this.mMediaCodec.getOutputBuffer(index) : this.mOutputBuffers[index];
    }
}
