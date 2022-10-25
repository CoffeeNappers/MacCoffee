package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureRequest;
import android.media.MediaCodec;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.wmspanel.libstream.Streamer;
import java.util.ArrayList;
@TargetApi(21)
/* loaded from: classes3.dex */
class VideoListener21 extends VideoListener21Base {
    private static final String TAG = "VideoListener21";
    private Surface mRecordingSurface;

    public VideoListener21(StreamBuffer streamBuffer, Streamer.Listener listener) {
        super(streamBuffer, listener);
        this.mCameraStateCallback = new CameraDevice.StateCallback() { // from class: com.wmspanel.libstream.VideoListener21.1
            @Override // android.hardware.camera2.CameraDevice.StateCallback
            public void onOpened(CameraDevice camera) {
                Log.d(VideoListener21.TAG, "onOpened");
                VideoListener21.this.mCamera2 = camera;
                try {
                    ArrayList arrayList = new ArrayList();
                    arrayList.add(VideoListener21.this.mPreviewSurface);
                    arrayList.add(VideoListener21.this.mRecordingSurface);
                    VideoListener21.this.mCamera2.createCaptureSession(arrayList, VideoListener21.this.mSessionStateCallback, VideoListener21.this.mCameraHandler);
                } catch (Exception e) {
                    Log.e(VideoListener21.TAG, Log.getStackTraceString(e));
                    VideoListener21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                    VideoListener21.this.release();
                }
            }

            @Override // android.hardware.camera2.CameraDevice.StateCallback
            public void onClosed(CameraDevice camera) {
                Log.d(VideoListener21.TAG, "onClosed");
                VideoListener21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
                VideoListener21.this.stopCameraThread();
            }

            @Override // android.hardware.camera2.CameraDevice.StateCallback
            public void onDisconnected(CameraDevice camera) {
                Log.d(VideoListener21.TAG, "onDisconnected");
                VideoListener21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                VideoListener21.this.release();
            }

            @Override // android.hardware.camera2.CameraDevice.StateCallback
            public void onError(CameraDevice camera, int error) {
                Log.d(VideoListener21.TAG, "onError, error=" + error);
                VideoListener21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                VideoListener21.this.release();
            }
        };
        this.mSessionStateCallback = new CameraCaptureSession.StateCallback() { // from class: com.wmspanel.libstream.VideoListener21.2
            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigured(CameraCaptureSession session) {
                Log.d(VideoListener21.TAG, "onConfigured");
                VideoListener21.this.mCaptureSession = session;
                try {
                    CameraDevice cameraDevice = VideoListener21.this.mCamera2;
                    CameraDevice cameraDevice2 = VideoListener21.this.mCamera2;
                    CaptureRequest.Builder createCaptureRequest = cameraDevice.createCaptureRequest(3);
                    createCaptureRequest.addTarget(VideoListener21.this.mPreviewSurface);
                    createCaptureRequest.addTarget(VideoListener21.this.mRecordingSurface);
                    createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, 3);
                    session.setRepeatingRequest(createCaptureRequest.build(), null, VideoListener21.this.mCameraHandler);
                } catch (Exception e) {
                    Log.e(VideoListener21.TAG, Log.getStackTraceString(e));
                    VideoListener21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                    VideoListener21.this.release();
                }
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigureFailed(CameraCaptureSession session) {
                Log.d(VideoListener21.TAG, "onConfigureFailed");
                VideoListener21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                VideoListener21.this.release();
            }
        };
    }

    private void openCamera(Context context, String cameraId) {
        this.mCameraId = cameraId;
        final CameraManager cameraManager = (CameraManager) context.getSystemService("camera");
        this.mCameraHandler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListener21.3
            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (VideoListener21.this.mCamera2 == null) {
                        cameraManager.openCamera(VideoListener21.this.mCameraId, VideoListener21.this.mCameraStateCallback, VideoListener21.this.mCameraHandler);
                    } else {
                        Log.e(VideoListener21.TAG, Messages.err_camera_opened);
                        VideoListener21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                        VideoListener21.this.release();
                    }
                } catch (CameraAccessException e) {
                    Log.e(VideoListener21.TAG, Log.getStackTraceString(e));
                    VideoListener21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                    VideoListener21.this.release();
                }
            }
        });
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void start(Context context, String cameraIdStr, SurfaceHolder previewSurface, SurfaceTexture texture, VideoEncoder videoEncoder) {
        if (previewSurface != null) {
            this.mPreviewSurface = previewSurface.getSurface();
        } else if (texture != null) {
            this.mPreviewSurface = new Surface(texture);
        } else {
            throw new IllegalArgumentException();
        }
        if (context == null) {
            throw new IllegalArgumentException();
        }
        if (videoEncoder == null || videoEncoder.getEncoder() == null) {
            throw new IllegalArgumentException();
        }
        try {
            this.mCameraThread = new HandlerThread("com.wmspanel.streamer.camera2");
            this.mCameraThread.start();
            this.mCameraHandler = new Handler(this.mCameraThread.getLooper());
            this.mEncoder = videoEncoder;
            openEncoder();
            openCamera(context, cameraIdStr);
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState(e instanceof MediaCodec.CodecException ? Streamer.CAPTURE_STATE.ENCODER_FAIL : Streamer.CAPTURE_STATE.FAILED);
            release();
        }
    }

    public void openEncoder() {
        this.mEncoder.getFormat().setInteger("color-format", 2130708361);
        this.mEncoder.getEncoder().setCallback(this.mMediaCodecCallback);
        this.mEncoder.configure();
        this.mRecordingSurface = this.mEncoder.getEncoder().createInputSurface();
        this.mEncoder.start();
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void release() {
        try {
            resetMediaFormat();
            if (this.mCaptureSession != null) {
                try {
                    this.mCaptureSession.abortCaptures();
                } catch (Exception e) {
                    Log.e(TAG, Log.getStackTraceString(e));
                }
                this.mCaptureSession.close();
                this.mCaptureSession = null;
            }
            releaseEncoder();
            if (this.mRecordingSurface != null) {
                this.mRecordingSurface.release();
                this.mRecordingSurface = null;
            }
            if (this.mCamera2 != null && this.mCameraHandler != null && this.mCameraThread != null) {
                this.mCameraHandler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListener21.4
                    @Override // java.lang.Runnable
                    public void run() {
                        if (VideoListener21.this.mCamera2 != null) {
                            VideoListener21.this.mCamera2.close();
                        }
                        VideoListener21.this.mCamera2 = null;
                    }
                });
            } else {
                setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
            }
        } catch (Exception e2) {
            Log.e(TAG, Log.getStackTraceString(e2));
            setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r1v0, types: [android.os.HandlerThread, android.os.Handler] */
    public void stopCameraThread() {
        if (this.mCameraThread != null) {
            this.mCameraThread.quitSafely();
            try {
                this.mCameraThread.join();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            } finally {
                this.mCameraThread = null;
                this.mCameraHandler = null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void toggleTorch() {
        Log.i(TAG, "not supported");
    }
}
