package com.wmspanel.libstream;

import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.os.Handler;
import android.os.HandlerThread;
import android.view.Surface;
import com.wmspanel.libstream.Streamer;
/* loaded from: classes3.dex */
abstract class VideoListener21Base extends VideoListener {
    protected CameraDevice mCamera2;
    protected Handler mCameraHandler;
    protected CameraDevice.StateCallback mCameraStateCallback;
    protected HandlerThread mCameraThread;
    protected CameraCaptureSession mCaptureSession;
    protected Surface mPreviewSurface;
    protected CameraCaptureSession.StateCallback mSessionStateCallback;

    public VideoListener21Base(StreamBuffer streamBuffer, Streamer.Listener listener) {
        super(streamBuffer, listener);
    }
}
