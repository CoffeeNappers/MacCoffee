package com.wmspanel.libstream;

import android.support.annotation.NonNull;
import com.wmspanel.libstream.Streamer;
/* loaded from: classes3.dex */
public abstract class StreamerCameraBuilderBase extends StreamerBuilder {
    protected String mCameraId;
    protected Streamer.CAMERA_API mCameraApi = Streamer.CAMERA_API.CAMERA;
    protected FocusMode mFocusMode = new FocusMode();
    protected int mDisplayRotation = 1;

    public void setCameraId(String id) {
        this.mCameraId = id;
    }

    public void setCamera2(boolean camera2) {
        this.mCameraApi = camera2 ? Streamer.CAMERA_API.CAMERA2 : Streamer.CAMERA_API.CAMERA;
    }

    public void setFocusMode(@NonNull FocusMode mode) {
        this.mFocusMode = mode;
    }

    public void setDisplayRotation(int rotation) {
        this.mDisplayRotation = rotation;
    }
}
