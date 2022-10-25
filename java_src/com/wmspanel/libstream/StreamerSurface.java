package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.util.Log;
import android.view.Surface;
@TargetApi(18)
/* loaded from: classes3.dex */
public class StreamerSurface extends Streamer {
    private static final String TAG = "StreamerSurface";
    private VideoListenerSurface dK;

    /* JADX INFO: Access modifiers changed from: protected */
    public StreamerSurface(int items) {
        init(items);
    }

    @Override // com.wmspanel.libstream.Streamer
    public void startVideoCapture() {
        Log.d(TAG, "startVideoCapture");
        if (this.dK == null) {
            if (this.mStreamBuffer == null) {
                throw new IllegalStateException(Messages.err_after_release);
            }
            if (this.mVideoEncoder == null) {
                this.mVideoEncoder = createVideoEncoder();
                if (this.mVideoEncoder == null) {
                    throw new RuntimeException(Messages.err_no_video_encoder);
                }
            }
            this.dK = new VideoListenerSurface(this.mStreamBuffer, this.mListener);
            this.dK.start(this.mVideoEncoder);
            this.mVideoListener = this.dK;
        }
    }

    public Surface getEncoderSurface() {
        if (this.dK != null) {
            return this.dK.getEncoderSurface();
        }
        return null;
    }

    public void drainEncoder() {
        if (this.dK != null) {
            this.dK.drainEncoder();
        }
    }

    @Override // com.wmspanel.libstream.Streamer
    public void flip() {
        throw new IllegalStateException();
    }

    @Override // com.wmspanel.libstream.Streamer
    public void release() {
        super.release();
        this.dK = null;
    }

    public void addVideoTs(long shift) {
        if (this.mVideoListener != null) {
            this.mVideoListener.setGapPts(shift);
        }
    }
}
