package com.wmspanel.libstream;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.view.Surface;
/* loaded from: classes3.dex */
abstract class MediaCodecState {
    private static final String TAG = "MediaCodecState";
    MediaCodecInfo.CodecCapabilities mCap;
    MediaCodec mEncoder;
    MediaFormat mFormat;
    private a mState = a.Uninitialized;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public enum a {
        Uninitialized,
        Configured,
        Executing,
        Released
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MediaCodec getEncoder() {
        return this.mEncoder;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MediaFormat getFormat() {
        return this.mFormat;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void configure() {
        if (this.mEncoder != null && this.mState == a.Uninitialized) {
            this.mEncoder.configure(this.mFormat, (Surface) null, (MediaCrypto) null, 1);
            setState(a.Configured);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void start() {
        if (this.mEncoder != null && this.mState == a.Configured) {
            this.mEncoder.start();
            setState(a.Executing);
        }
    }

    private void stop() {
        if (this.mEncoder != null && this.mState == a.Executing) {
            this.mEncoder.stop();
            setState(a.Uninitialized);
        }
    }

    public synchronized void release() {
        if (this.mEncoder != null) {
            try {
                stop();
            } catch (IllegalStateException e) {
            }
            this.mEncoder.release();
            setState(a.Released);
            this.mEncoder = null;
        }
        this.mFormat = null;
        this.mCap = null;
    }

    private void setState(a state) {
        this.mState = state;
    }
}
