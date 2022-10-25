package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.media.MediaCodec;
import android.opengl.GLES20;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import android.view.SurfaceHolder;
import com.facebook.imagepipeline.common.RotationOptions;
import com.my.target.ads.instream.InstreamAd;
import com.wmspanel.libstream.Streamer;
import com.wmspanel.libstream.StreamerGL;
import com.wmspanel.libstream.VideoListener;
import com.wmspanel.libstream.gles.EglCore;
import com.wmspanel.libstream.gles.FullFrameRectLetterbox;
import com.wmspanel.libstream.gles.Texture2dProgram;
import com.wmspanel.libstream.gles.WindowSurface;
import java.util.Iterator;
@TargetApi(18)
/* loaded from: classes3.dex */
class VideoListenerGLES16 extends VideoListener16Base implements SurfaceTexture.OnFrameAvailableListener {
    private static final String TAG = "VideoListenerGLES16";
    private Handler mCameraHandler;
    private Camera.CameraInfo mCameraInfo;
    private SurfaceTexture mCameraTexture;
    private HandlerThread mCameraThread;
    private WindowSurface mDisplaySurface;
    private EglCore mEglCore;
    private WindowSurface mEncoderSurface;
    private FullFrameRectLetterbox mFullFrameBlit;
    private VideoListener.FlipCameraInfo mInfo;
    private int mTextureId;
    private final float[] mTmpMatrix;

    public VideoListenerGLES16(StreamBuffer streamBuffer, Streamer.Listener listener) {
        super(streamBuffer, listener);
        this.mTmpMatrix = new float[16];
    }

    public void openEncoder() {
        this.mEncoder.getFormat().setInteger("color-format", 2130708361);
        if (Build.VERSION.SDK_INT >= 21) {
            this.mEncoder.getEncoder().setCallback(this.mMediaCodecCallback);
        }
        this.mEncoder.configure();
        this.mEncoderSurface = new WindowSurface(this.mEglCore, this.mEncoder.getEncoder().createInputSurface(), true);
        this.mPreviewSize = new Streamer.Size(this.mEncoder.getFormat().getInteger("width"), this.mEncoder.getFormat().getInteger("height"));
        this.mEncoder.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openCamera(String cameraId) {
        this.mCameraId = cameraId;
        Log.d(TAG, "open camera#" + this.mCameraId);
        this.mCamera = Camera.open(Integer.parseInt(this.mCameraId));
        this.mCamera.setErrorCallback(this.mErrorCallback);
        this.mCameraInfo = new Camera.CameraInfo();
        Camera.getCameraInfo(Integer.parseInt(this.mCameraId), this.mCameraInfo);
        Camera.Parameters parameters = this.mCamera.getParameters();
        this.mInfo = null;
        Iterator<VideoListener.FlipCameraInfo> it = this.mFlipCameraInfo.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            VideoListener.FlipCameraInfo next = it.next();
            if (next.cameraId.equals(this.mCameraId)) {
                this.mInfo = next;
                break;
            }
        }
        if (this.mInfo == null) {
            throw new RuntimeException(Messages.err_no_camera_info);
        }
        parameters.setPreviewSize(this.mInfo.videoSize.width, this.mInfo.videoSize.height);
        if (this.mInfo.fpsRange != null) {
            parameters.setPreviewFpsRange((int) this.mInfo.fpsRange.fpsMin, (int) this.mInfo.fpsRange.fpsMax);
        }
        setFocusMode(parameters, this.mFocusMode.focusMode16);
        setAwbMode(parameters, this.mFocusMode.awbMode16);
        setAntibandingMode(parameters, this.mFocusMode.antibandingMode16);
        setExposureCompensation(parameters, this.mFocusMode.exposureCompensation);
        this.mCamera.setParameters(parameters);
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void start(Context context, final String cameraId, SurfaceHolder previewSurfaceHolder, SurfaceTexture texture, VideoEncoder encoder) {
        if (encoder == null || encoder.getEncoder() == null) {
            throw new IllegalArgumentException();
        }
        try {
            this.mCameraThread = new HandlerThread("com.wmspanel.streamer.camera");
            this.mCameraThread.start();
            this.mCameraHandler = new Handler(this.mCameraThread.getLooper());
            this.mEncoder = encoder;
            if (Build.VERSION.SDK_INT < 21) {
                this.mBufferInfo = new MediaCodec.BufferInfo();
            }
            this.mEglCore = new EglCore(null, 1);
            openEncoder();
            openEgl();
            this.mCameraHandler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListenerGLES16.1
                @Override // java.lang.Runnable
                public void run() {
                    VideoListenerGLES16.this.logThread("open runnable");
                    try {
                        VideoListenerGLES16.this.openCamera(cameraId);
                        VideoListenerGLES16.this.mCamera.setPreviewTexture(VideoListenerGLES16.this.mCameraTexture);
                        VideoListenerGLES16.this.mCamera.startPreview();
                    } catch (Exception e) {
                        Log.e(VideoListenerGLES16.TAG, Log.getStackTraceString(e));
                        VideoListenerGLES16.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                        VideoListenerGLES16.this.release();
                    }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState((Build.VERSION.SDK_INT < 21 || !(e instanceof MediaCodec.CodecException)) ? Streamer.CAPTURE_STATE.FAILED : Streamer.CAPTURE_STATE.ENCODER_FAIL);
            release();
        }
    }

    @Override // android.graphics.SurfaceTexture.OnFrameAvailableListener
    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        try {
            drawFrame();
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
            release();
        }
    }

    private void drawFrame() {
        int i;
        int i2 = RotationOptions.ROTATE_270;
        int i3 = 0;
        if (this.mEglCore == null) {
            Log.d(TAG, "Skipping drawFrame after shutdown");
            return;
        }
        this.mDisplaySurface.makeCurrent();
        this.mCameraTexture.updateTexImage();
        this.mCameraTexture.getTransformMatrix(this.mTmpMatrix);
        if (this.mTakeSnapshot) {
            new Thread(new SnapshotWriter(this.mDisplaySurface.readPixels(), this.mSnapshotCallback, this.mSnapshot, this.mDisplaySurface.getWidth(), this.mDisplaySurface.getHeight(), this.mCameraInfo.facing == 1)).start();
            this.mTakeSnapshot = false;
            this.mSnapshotCallback = null;
            this.mSnapshot = null;
        }
        GLES20.glViewport(0, 0, this.mSurfaceSize.width, this.mSurfaceSize.height);
        if (this.mCameraInfo.facing == 1) {
            i = (360 - ((this.mCameraInfo.orientation + this.mDisplayOrientation) % InstreamAd.DEFAULT_VIDEO_QUALITY)) % InstreamAd.DEFAULT_VIDEO_QUALITY;
        } else {
            i = ((this.mCameraInfo.orientation - this.mDisplayOrientation) + InstreamAd.DEFAULT_VIDEO_QUALITY) % InstreamAd.DEFAULT_VIDEO_QUALITY;
        }
        if (i == 0) {
            this.mFullFrameBlit.drawFrame(this.mTextureId, this.mTmpMatrix);
        } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.HORIZON) {
            this.mFullFrameBlit.drawFrameX(this.mTextureId, this.mTmpMatrix, 360 - i, this.mInfo.scale_horizon);
        } else {
            this.mFullFrameBlit.drawFrameY(this.mTextureId, this.mTmpMatrix, 360 - i, 1.0f);
        }
        this.mDisplaySurface.swapBuffers();
        if (Build.VERSION.SDK_INT < 21) {
            getVideoFrame();
        }
        this.mEncoderSurface.makeCurrent();
        GLES20.glViewport(0, 0, this.mPreviewSize.width, this.mPreviewSize.height);
        if (this.mCameraInfo.facing == 0) {
            if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.LANDSCAPE) {
                if (i >= 180) {
                    i3 = 180;
                }
                if (this.mInfo.scale_landscape_letterbox != 1.0f) {
                    this.mFullFrameBlit.drawFrameY(this.mTextureId, this.mTmpMatrix, i3, this.mInfo.scale_landscape_letterbox);
                } else if (this.mInfo.scale_landscape_pillarbox != 1.0f) {
                    this.mFullFrameBlit.drawFrameX(this.mTextureId, this.mTmpMatrix, i3, this.mInfo.scale_landscape_pillarbox);
                } else {
                    this.mFullFrameBlit.drawFrameY(this.mTextureId, this.mTmpMatrix, i3, 1.0f);
                }
            } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.PORTRAIT) {
                int i4 = i < 180 ? 270 : 90;
                if (this.mInfo.scale_letterbox != 1.0f) {
                    this.mFullFrameBlit.drawFrameX(this.mTextureId, this.mTmpMatrix, i4, this.mInfo.scale_letterbox);
                } else {
                    this.mFullFrameBlit.drawFrameY(this.mTextureId, this.mTmpMatrix, i4, this.mInfo.scale);
                }
            } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.HORIZON) {
                if (i >= 180) {
                    i2 = 90;
                }
                this.mFullFrameBlit.drawFrameX(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale_horizon);
            } else {
                throw new IllegalStateException(Messages.err_unknown_orientation);
            }
        } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.LANDSCAPE) {
            if (i >= 180) {
                i3 = 180;
            }
            if (this.mInfo.scale_landscape_letterbox != 1.0f) {
                this.mFullFrameBlit.drawFrameMirrorY(this.mTextureId, this.mTmpMatrix, i3, this.mInfo.scale_landscape_letterbox);
            } else if (this.mInfo.scale_landscape_pillarbox != 1.0f) {
                this.mFullFrameBlit.drawFrameMirrorX(this.mTextureId, this.mTmpMatrix, i3, this.mInfo.scale_landscape_pillarbox);
            } else {
                this.mFullFrameBlit.drawFrameMirrorY(this.mTextureId, this.mTmpMatrix, i3, 1.0f);
            }
        } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.PORTRAIT) {
            if (i >= 180) {
                i2 = 90;
            }
            if (this.mInfo.scale_letterbox != 1.0f) {
                this.mFullFrameBlit.drawFrameMirrorX(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale_letterbox);
            } else {
                this.mFullFrameBlit.drawFrameMirrorY(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale);
            }
        } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.HORIZON) {
            if (i >= 180) {
                i2 = 90;
            }
            this.mFullFrameBlit.drawFrameMirrorX(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale_horizon);
        } else {
            throw new IllegalStateException(Messages.err_unknown_orientation);
        }
        if (Build.VERSION.SDK_INT > 24) {
            this.mEncoderSurface.setPresentationTime(System.nanoTime());
        } else {
            this.mEncoderSurface.setPresentationTime(this.mCameraTexture.getTimestamp());
        }
        this.mEncoderSurface.swapBuffers();
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void release() {
        try {
            resetMediaFormat();
            releaseEncoder();
            releaseEgl();
            if (this.mCameraThread == null || this.mCameraHandler == null) {
                setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
            } else {
                this.mCameraHandler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListenerGLES16.2
                    @Override // java.lang.Runnable
                    public void run() {
                        VideoListenerGLES16.this.logThread("release runnable");
                        try {
                            try {
                                VideoListenerGLES16.this.releaseCamera();
                                VideoListenerGLES16.this.setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
                                VideoListenerGLES16.this.stopCameraThread();
                            } catch (Exception e) {
                                Log.e(VideoListenerGLES16.TAG, Log.getStackTraceString(e));
                                VideoListenerGLES16.this.setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
                                VideoListenerGLES16.this.stopCameraThread();
                            }
                        } catch (Throwable th) {
                            VideoListenerGLES16.this.setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
                            VideoListenerGLES16.this.stopCameraThread();
                            throw th;
                        }
                    }
                });
            }
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r1v0, types: [android.os.HandlerThread, android.os.Handler] */
    public void stopCameraThread() {
        if (this.mCameraThread != null) {
            logThread("release camera1 thread");
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

    @Override // com.wmspanel.libstream.VideoListener
    public void flip() {
        if (this.mCamera == null || this.mCameraThread == null || this.mCameraHandler == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            return;
        }
        Iterator<VideoListener.FlipCameraInfo> it = this.mFlipCameraInfo.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            VideoListener.FlipCameraInfo next = it.next();
            if (!next.cameraId.equals(this.mCameraId)) {
                this.mCameraId = next.cameraId;
                break;
            }
        }
        this.mCameraHandler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListenerGLES16.3
            @Override // java.lang.Runnable
            public void run() {
                VideoListenerGLES16.this.logThread("flip runnable");
                try {
                    VideoListenerGLES16.this.releaseCamera();
                    VideoListenerGLES16.this.openCamera(VideoListenerGLES16.this.mCameraId);
                    VideoListenerGLES16.this.mCamera.setPreviewTexture(VideoListenerGLES16.this.mCameraTexture);
                    VideoListenerGLES16.this.mCamera.startPreview();
                } catch (Exception e) {
                    Log.e(VideoListenerGLES16.TAG, Log.getStackTraceString(e));
                    VideoListenerGLES16.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                    VideoListenerGLES16.this.release();
                }
            }
        });
    }

    private void openEgl() {
        logThread("openEgl");
        this.mDisplaySurface = new WindowSurface(this.mEglCore, this.mSurface, false);
        this.mDisplaySurface.makeCurrent();
        this.mFullFrameBlit = new FullFrameRectLetterbox(new Texture2dProgram(Texture2dProgram.ProgramType.TEXTURE_EXT));
        this.mTextureId = this.mFullFrameBlit.createTextureObject();
        this.mCameraTexture = new SurfaceTexture(this.mTextureId);
        this.mCameraTexture.setOnFrameAvailableListener(this);
    }

    private void releaseEgl() {
        logThread("releaseEgl");
        if (this.mCameraTexture != null) {
            this.mCameraTexture.release();
            this.mCameraTexture = null;
        }
        if (this.mDisplaySurface != null) {
            this.mDisplaySurface.release();
            this.mDisplaySurface = null;
        }
        if (this.mEncoderSurface != null) {
            this.mEncoderSurface.release();
            this.mEncoderSurface = null;
        }
        if (this.mFullFrameBlit != null) {
            this.mFullFrameBlit.release(false);
            this.mFullFrameBlit = null;
        }
        if (this.mEglCore != null) {
            this.mEglCore.release();
            this.mEglCore = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void setCameraParameters(final Camera.Parameters param) {
        if (this.mCamera == null || this.mCameraThread == null || this.mCameraHandler == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
        } else {
            this.mCameraHandler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListenerGLES16.4
                @Override // java.lang.Runnable
                public void run() {
                    VideoListenerGLES16.this.logThread("set camera params");
                    try {
                        VideoListenerGLES16.this.mCamera.setParameters(param);
                    } catch (RuntimeException e) {
                        Log.e(VideoListenerGLES16.TAG, Log.getStackTraceString(e));
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void toggleTorch() {
        if (this.mCamera == null || this.mCameraThread == null || this.mCameraHandler == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
        } else {
            this.mCameraHandler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListenerGLES16.5
                @Override // java.lang.Runnable
                public void run() {
                    VideoListenerGLES16.this.logThread("toggle torch");
                    try {
                        Camera.Parameters cameraParameters = VideoListenerGLES16.this.getCameraParameters();
                        if (cameraParameters != null) {
                            String flashMode = cameraParameters.getFlashMode();
                            if (flashMode == null) {
                                Log.w(VideoListenerGLES16.TAG, Messages.err_no_flash);
                                return;
                            }
                            if (flashMode.equals("off")) {
                                cameraParameters.setFlashMode("torch");
                            } else {
                                cameraParameters.setFlashMode("off");
                            }
                            VideoListenerGLES16.this.setCameraParameters(cameraParameters);
                        }
                    } catch (Exception e) {
                        Log.e(VideoListenerGLES16.TAG, Log.getStackTraceString(e));
                        VideoListenerGLES16.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                        VideoListenerGLES16.this.release();
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void focus() {
        if (this.mCamera == null || this.mCameraThread == null || this.mCameraHandler == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
        } else {
            this.mCameraHandler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListenerGLES16.6
                @Override // java.lang.Runnable
                public void run() {
                    VideoListenerGLES16.this.logThread("focus runnable");
                    try {
                        Camera.Parameters cameraParameters = VideoListenerGLES16.this.getCameraParameters();
                        if (cameraParameters != null) {
                            VideoListenerGLES16.this.mCamera.cancelAutoFocus();
                            VideoListenerGLES16.this.setFocusMode(cameraParameters, VideoListenerGLES16.this.mFocusMode.focusMode16);
                            VideoListenerGLES16.this.setAwbMode(cameraParameters, VideoListenerGLES16.this.mFocusMode.awbMode16);
                            VideoListenerGLES16.this.setAntibandingMode(cameraParameters, VideoListenerGLES16.this.mFocusMode.antibandingMode16);
                            VideoListenerGLES16.this.setExposureCompensation(cameraParameters, VideoListenerGLES16.this.mFocusMode.exposureCompensation);
                            VideoListenerGLES16.this.setCameraParameters(cameraParameters);
                        }
                    } catch (Exception e) {
                        Log.e(VideoListenerGLES16.TAG, Log.getStackTraceString(e));
                        VideoListenerGLES16.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                        VideoListenerGLES16.this.release();
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logThread(String info) {
    }
}
