package com.wmspanel.libstream;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureRequest;
import android.media.MediaCodec;
import android.opengl.GLES20;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import android.util.Range;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.wmspanel.libstream.Streamer;
import com.wmspanel.libstream.StreamerGL;
import com.wmspanel.libstream.VideoListener;
import com.wmspanel.libstream.gles.EglCore;
import com.wmspanel.libstream.gles.FullFrameRectLetterbox;
import com.wmspanel.libstream.gles.Texture2dProgram;
import com.wmspanel.libstream.gles.WindowSurface;
import java.util.ArrayList;
import java.util.Iterator;
@TargetApi(21)
/* loaded from: classes3.dex */
class VideoListenerGLES21 extends VideoListener21Base implements SurfaceTexture.OnFrameAvailableListener {
    private static final String TAG = "VideoListenerGLES21";
    private Range<Integer> mAeRange;
    private int[] mAvailAntibandingModes;
    private int[] mAvailAwbModes;
    private int[] mAvailFocusModes;
    private CaptureRequest.Builder mBuilder;
    private SurfaceTexture mCameraTexture;
    private Runnable mCloseCameraRunnable;
    private Context mContext;
    private WindowSurface mDisplaySurface;
    private EglCore mEglCore;
    private WindowSurface mEncoderSurface;
    private boolean mFlashAvailable;
    private int mFlashMode;
    private FullFrameRectLetterbox mFullFrameBlit;
    private VideoListener.FlipCameraInfo mInfo;
    private boolean mIsCameraClosing;
    private boolean mLensFacingBack;
    private int mTextureId;
    private final float[] mTmpMatrix;

    public VideoListenerGLES21(StreamBuffer streamBuffer, Streamer.Listener listener) {
        super(streamBuffer, listener);
        this.mFlashMode = 0;
        this.mTmpMatrix = new float[16];
        this.mCloseCameraRunnable = new Runnable() { // from class: com.wmspanel.libstream.VideoListenerGLES21.4
            @Override // java.lang.Runnable
            public void run() {
                if (VideoListenerGLES21.this.mCamera2 != null) {
                    VideoListenerGLES21.this.mCamera2.close();
                }
                VideoListenerGLES21.this.mCamera2 = null;
            }
        };
        this.mCameraStateCallback = new CameraDevice.StateCallback() { // from class: com.wmspanel.libstream.VideoListenerGLES21.1
            @Override // android.hardware.camera2.CameraDevice.StateCallback
            public void onOpened(CameraDevice camera) {
                Log.d(VideoListenerGLES21.TAG, "onOpened");
                VideoListenerGLES21.this.mCamera2 = camera;
                try {
                    ArrayList arrayList = new ArrayList();
                    arrayList.add(VideoListenerGLES21.this.mPreviewSurface);
                    VideoListenerGLES21.this.mCamera2.createCaptureSession(arrayList, VideoListenerGLES21.this.mSessionStateCallback, VideoListenerGLES21.this.mCameraHandler);
                } catch (Exception e) {
                    Log.e(VideoListenerGLES21.TAG, Log.getStackTraceString(e));
                    VideoListenerGLES21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                    VideoListenerGLES21.this.release();
                }
            }

            @Override // android.hardware.camera2.CameraDevice.StateCallback
            public void onClosed(CameraDevice camera) {
                Log.d(VideoListenerGLES21.TAG, "onClosed");
                if (!VideoListenerGLES21.this.mIsCameraClosing) {
                    if (!VideoListenerGLES21.this.openCamera(VideoListenerGLES21.this.mContext, VideoListenerGLES21.this.mCameraId)) {
                        Log.e(VideoListenerGLES21.TAG, "failed to open camera");
                        VideoListenerGLES21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                        VideoListenerGLES21.this.release();
                        return;
                    }
                    return;
                }
                VideoListenerGLES21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
                VideoListenerGLES21.this.stopCameraThread();
            }

            @Override // android.hardware.camera2.CameraDevice.StateCallback
            public void onDisconnected(CameraDevice camera) {
                Log.d(VideoListenerGLES21.TAG, "onDisconnected");
                VideoListenerGLES21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                VideoListenerGLES21.this.release();
            }

            @Override // android.hardware.camera2.CameraDevice.StateCallback
            public void onError(CameraDevice camera, int error) {
                Log.d(VideoListenerGLES21.TAG, "onError, error=" + error);
                VideoListenerGLES21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                VideoListenerGLES21.this.release();
            }
        };
        this.mSessionStateCallback = new CameraCaptureSession.StateCallback() { // from class: com.wmspanel.libstream.VideoListenerGLES21.2
            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onReady(CameraCaptureSession session) {
                Log.d(VideoListenerGLES21.TAG, "onReady");
                if (VideoListenerGLES21.this.mCaptureSession == session) {
                    VideoListenerGLES21.this.startPreview();
                } else {
                    Log.d(VideoListenerGLES21.TAG, "onReady: skip");
                }
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigured(CameraCaptureSession session) {
                Log.d(VideoListenerGLES21.TAG, "onConfigured");
                VideoListenerGLES21.this.mCaptureSession = session;
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigureFailed(CameraCaptureSession session) {
                Log.d(VideoListenerGLES21.TAG, "onConfigureFailed");
                VideoListenerGLES21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                VideoListenerGLES21.this.release();
            }
        };
    }

    private void setFocusMode(CaptureRequest.Builder requestBuilder) {
        if (setControlMode(requestBuilder, CaptureRequest.CONTROL_AF_MODE, this.mFocusMode.focusMode, 3, this.mAvailFocusModes, "focus_mode") && this.mFocusMode.focusMode == 0) {
            requestBuilder.set(CaptureRequest.LENS_FOCUS_DISTANCE, Float.valueOf(this.mFocusMode.focusDistance));
        }
    }

    private void setAwbMode(CaptureRequest.Builder requestBuilder) {
        setControlMode(requestBuilder, CaptureRequest.CONTROL_AWB_MODE, this.mFocusMode.awbMode, 1, this.mAvailAwbModes, "awb_mode");
    }

    private void setAntibandingMode(CaptureRequest.Builder requestBuilder) {
        setControlMode(requestBuilder, CaptureRequest.CONTROL_AE_ANTIBANDING_MODE, this.mFocusMode.antibandingMode, 0, this.mAvailAntibandingModes, "antibanding_mode");
    }

    private void setExposureCompensation(CaptureRequest.Builder requestBuilder) {
        if (this.mAeRange != null) {
            int i = this.mFocusMode.exposureCompensation;
            if (i < this.mAeRange.getLower().intValue()) {
                i = this.mAeRange.getLower().intValue();
            }
            if (i > this.mAeRange.getUpper().intValue()) {
                i = this.mAeRange.getUpper().intValue();
            }
            requestBuilder.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(i));
        }
    }

    private boolean setControlMode(CaptureRequest.Builder requestBuilder, CaptureRequest.Key key, int newMode, int defMode, int[] availModes, String name) {
        boolean z;
        boolean z2;
        boolean z3;
        if (availModes != null) {
            StringBuilder sb = new StringBuilder();
            for (int i : availModes) {
                sb.append(i).append(";");
            }
            int length = availModes.length;
            int i2 = 0;
            while (true) {
                if (i2 >= length) {
                    z = false;
                    newMode = defMode;
                    z2 = false;
                    break;
                } else if (availModes[i2] == newMode) {
                    z = true;
                    z2 = true;
                    break;
                } else {
                    i2++;
                }
            }
            if (!z) {
                for (int i3 : availModes) {
                    if (i3 == defMode) {
                        z3 = true;
                        break;
                    }
                }
            }
            z3 = z;
            if (z3) {
                requestBuilder.set(key, Integer.valueOf(newMode));
                return z2;
            }
            return z2;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startPreview() {
        try {
            if (this.mBuilder != null) {
                this.mBuilder.addTarget(this.mPreviewSurface);
                this.mCaptureSession.setRepeatingRequest(this.mBuilder.build(), null, this.mCameraHandler);
                this.mBuilder = null;
                return;
            }
            CameraDevice cameraDevice = this.mCamera2;
            CameraDevice cameraDevice2 = this.mCamera2;
            CaptureRequest.Builder createCaptureRequest = cameraDevice.createCaptureRequest(3);
            createCaptureRequest.addTarget(this.mPreviewSurface);
            createCaptureRequest.set(CaptureRequest.CONTROL_AE_MODE, 1);
            setFocusMode(createCaptureRequest);
            setAwbMode(createCaptureRequest);
            setAntibandingMode(createCaptureRequest);
            setExposureCompensation(createCaptureRequest);
            if (this.mInfo != null && this.mInfo.fpsRange != null) {
                createCaptureRequest.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, new Range(Integer.valueOf((int) this.mInfo.fpsRange.fpsMin), Integer.valueOf((int) this.mInfo.fpsRange.fpsMax)));
            }
            if (this.mFlashAvailable) {
                createCaptureRequest.set(CaptureRequest.FLASH_MODE, Integer.valueOf(this.mFlashMode));
            } else {
                this.mFlashMode = 0;
            }
            this.mCaptureSession.setRepeatingRequest(createCaptureRequest.build(), null, this.mCameraHandler);
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
            release();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean openCamera(Context context, String cameraId) {
        try {
            this.mCameraId = cameraId;
            Log.d(TAG, "open camera#" + this.mCameraId);
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
            this.mCameraTexture.setDefaultBufferSize(this.mInfo.videoSize.width, this.mInfo.videoSize.height);
            final CameraManager cameraManager = (CameraManager) context.getSystemService("camera");
            CameraCharacteristics cameraCharacteristics = cameraManager.getCameraCharacteristics(this.mCameraId);
            this.mLensFacingBack = ((Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING)).intValue() == 1;
            this.mFlashAvailable = ((Boolean) cameraCharacteristics.get(CameraCharacteristics.FLASH_INFO_AVAILABLE)).booleanValue();
            this.mAvailFocusModes = (int[]) cameraCharacteristics.get(CameraCharacteristics.CONTROL_AF_AVAILABLE_MODES);
            this.mAvailAwbModes = (int[]) cameraCharacteristics.get(CameraCharacteristics.CONTROL_AWB_AVAILABLE_MODES);
            this.mAvailAntibandingModes = (int[]) cameraCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_ANTIBANDING_MODES);
            this.mAeRange = (Range) cameraCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_RANGE);
            this.mCameraHandler.post(new Runnable() { // from class: com.wmspanel.libstream.VideoListenerGLES21.3
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        if (VideoListenerGLES21.this.mCamera2 == null) {
                            cameraManager.openCamera(VideoListenerGLES21.this.mCameraId, VideoListenerGLES21.this.mCameraStateCallback, VideoListenerGLES21.this.mCameraHandler);
                        } else {
                            Log.e(VideoListenerGLES21.TAG, Messages.err_camera_opened);
                            VideoListenerGLES21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                            VideoListenerGLES21.this.release();
                        }
                    } catch (CameraAccessException e) {
                        Log.e(VideoListenerGLES21.TAG, Log.getStackTraceString(e));
                        VideoListenerGLES21.this.setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                        VideoListenerGLES21.this.release();
                    }
                }
            });
            return true;
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            return false;
        }
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void start(Context context, String cameraId, SurfaceHolder previewSurface, SurfaceTexture texture, VideoEncoder videoEncoder) {
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
            this.mContext = context;
            this.mEncoder = videoEncoder;
            this.mEglCore = new EglCore(null, 1);
            openEncoder();
            openEgl();
            if (!openCamera(this.mContext, cameraId)) {
                Log.e(TAG, "failed to open camera");
                throw new Exception();
            }
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
        this.mEncoderSurface = new WindowSurface(this.mEglCore, this.mEncoder.getEncoder().createInputSurface(), true);
        this.mPreviewSize = new Streamer.Size(this.mEncoder.getFormat().getInteger("width"), this.mEncoder.getFormat().getInteger("height"));
        this.mEncoder.start();
    }

    public void openEgl() {
        this.mDisplaySurface = new WindowSurface(this.mEglCore, this.mSurface, false);
        this.mDisplaySurface.makeCurrent();
        this.mFullFrameBlit = new FullFrameRectLetterbox(new Texture2dProgram(Texture2dProgram.ProgramType.TEXTURE_EXT));
        this.mTextureId = this.mFullFrameBlit.createTextureObject();
        this.mCameraTexture = new SurfaceTexture(this.mTextureId);
        this.mCameraTexture.setOnFrameAvailableListener(this);
        this.mPreviewSurface = new Surface(this.mCameraTexture);
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void release() {
        try {
            this.mIsCameraClosing = true;
            this.mBuilder = null;
            resetMediaFormat();
            abortCaptureSession();
            releaseEncoder();
            releaseEgl();
            if (this.mCamera2 != null && this.mCameraHandler != null && this.mCameraThread != null) {
                this.mCameraHandler.post(this.mCloseCameraRunnable);
            } else {
                setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
            }
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
        }
    }

    private void abortCaptureSession() {
        Log.d(TAG, "abortCaptureSession");
        if (this.mCaptureSession != null) {
            try {
                this.mCaptureSession.abortCaptures();
                this.mCaptureSession.close();
            } catch (Exception e) {
                Log.e(TAG, Log.getStackTraceString(e));
            }
            this.mCaptureSession = null;
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
        int i = 90;
        int i2 = 0;
        if (this.mEglCore == null) {
            Log.d(TAG, "Skipping drawFrame after shutdown");
            return;
        }
        this.mDisplaySurface.makeCurrent();
        this.mCameraTexture.updateTexImage();
        this.mCameraTexture.getTransformMatrix(this.mTmpMatrix);
        if (this.mTakeSnapshot) {
            new Thread(new SnapshotWriter(this.mDisplaySurface.readPixels(), this.mSnapshotCallback, this.mSnapshot, this.mDisplaySurface.getWidth(), this.mDisplaySurface.getHeight(), !this.mLensFacingBack)).start();
            this.mTakeSnapshot = false;
            this.mSnapshotCallback = null;
            this.mSnapshot = null;
        }
        GLES20.glViewport(0, 0, this.mSurfaceSize.width, this.mSurfaceSize.height);
        if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.HORIZON) {
            this.mFullFrameBlit.drawFrameY(this.mTextureId, this.mTmpMatrix, this.mDisplayOrientation, this.mInfo.scale_horizon);
        } else {
            this.mFullFrameBlit.drawFrameY(this.mTextureId, this.mTmpMatrix, this.mDisplayOrientation, 1.0f);
        }
        this.mDisplaySurface.swapBuffers();
        this.mEncoderSurface.makeCurrent();
        GLES20.glViewport(0, 0, this.mPreviewSize.width, this.mPreviewSize.height);
        if (this.mLensFacingBack) {
            if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.LANDSCAPE) {
                int i3 = this.mDisplayOrientation < 180 ? 90 : 270;
                if (this.mInfo.scale_landscape_letterbox != 1.0f) {
                    this.mFullFrameBlit.drawFrameX(this.mTextureId, this.mTmpMatrix, i3, this.mInfo.scale_landscape_letterbox);
                } else if (this.mInfo.scale_landscape_pillarbox != 1.0f) {
                    this.mFullFrameBlit.drawFrameY(this.mTextureId, this.mTmpMatrix, i3, this.mInfo.scale_landscape_pillarbox);
                } else {
                    this.mFullFrameBlit.drawFrameX(this.mTextureId, this.mTmpMatrix, i3, 1.0f);
                }
            } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.PORTRAIT) {
                if (this.mDisplayOrientation >= 180) {
                    i2 = 180;
                }
                if (this.mInfo.scale_letterbox != 1.0f) {
                    this.mFullFrameBlit.drawFrameY(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale_letterbox);
                } else {
                    this.mFullFrameBlit.drawFrameX(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale);
                }
            } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.HORIZON) {
                if (this.mDisplayOrientation >= 180) {
                    i2 = 180;
                }
                this.mFullFrameBlit.drawFrameY(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale_horizon);
            } else {
                throw new IllegalStateException(Messages.err_unknown_orientation);
            }
        } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.LANDSCAPE) {
            if (this.mDisplayOrientation >= 180) {
                i = 270;
            }
            if (this.mInfo.scale_landscape_letterbox != 1.0f) {
                this.mFullFrameBlit.drawFrameMirrorX(this.mTextureId, this.mTmpMatrix, i, this.mInfo.scale_landscape_letterbox);
            } else if (this.mInfo.scale_landscape_pillarbox != 1.0f) {
                this.mFullFrameBlit.drawFrameMirrorY(this.mTextureId, this.mTmpMatrix, i, this.mInfo.scale_landscape_pillarbox);
            } else {
                this.mFullFrameBlit.drawFrameMirrorX(this.mTextureId, this.mTmpMatrix, i, 1.0f);
            }
        } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.PORTRAIT) {
            if (this.mDisplayOrientation >= 180) {
                i2 = 180;
            }
            if (this.mInfo.scale_letterbox != 1.0f) {
                this.mFullFrameBlit.drawFrameMirrorY(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale_letterbox);
            } else {
                this.mFullFrameBlit.drawFrameMirrorX(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale);
            }
        } else if (this.mVideoOrientation == StreamerGL.ORIENTATIONS.HORIZON) {
            if (this.mDisplayOrientation >= 180) {
                i2 = 180;
            }
            this.mFullFrameBlit.drawFrameMirrorY(this.mTextureId, this.mTmpMatrix, i2, this.mInfo.scale_horizon);
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

    private void releaseEgl() {
        if (this.mDisplaySurface != null) {
            this.mDisplaySurface.release();
            this.mDisplaySurface = null;
        }
        if (this.mPreviewSurface != null) {
            this.mPreviewSurface.release();
            this.mPreviewSurface = null;
        }
        if (this.mCameraTexture != null) {
            this.mCameraTexture.release();
            this.mCameraTexture = null;
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
    public void flip() {
        boolean z = true;
        if (this.mCamera2 == null || this.mCameraHandler == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            StringBuilder append = new StringBuilder().append("mCamera2 is null: ").append(Boolean.toString(this.mCamera2 == null)).append(", mCameraHandler is null: ");
            if (this.mCameraHandler != null) {
                z = false;
            }
            Log.e(TAG, append.append(Boolean.toString(z)).toString());
            return;
        }
        this.mIsCameraClosing = false;
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
        abortCaptureSession();
        this.mCameraHandler.post(this.mCloseCameraRunnable);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void toggleTorch() {
        boolean z = true;
        if (this.mCamera2 == null || this.mCameraHandler == null || this.mCaptureSession == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            StringBuilder append = new StringBuilder().append("mCamera2 is null: ").append(Boolean.toString(this.mCamera2 == null)).append(", mCameraHandler is null: ");
            if (this.mCameraHandler != null) {
                z = false;
            }
            Log.e(TAG, append.append(Boolean.toString(z)).toString());
        } else if (this.mFlashAvailable) {
            if (this.mFlashMode == 0) {
                this.mFlashMode = 2;
            } else {
                this.mFlashMode = 0;
            }
            try {
                this.mCaptureSession.stopRepeating();
            } catch (CameraAccessException e) {
                Log.e(TAG, Log.getStackTraceString(e));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void focus() {
        boolean z = true;
        if (this.mCamera2 == null || this.mCameraHandler == null || this.mCaptureSession == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            StringBuilder append = new StringBuilder().append("mCamera2 is null: ").append(Boolean.toString(this.mCamera2 == null)).append(", mCameraHandler is null: ");
            if (this.mCameraHandler != null) {
                z = false;
            }
            Log.e(TAG, append.append(Boolean.toString(z)).toString());
            return;
        }
        try {
            this.mCaptureSession.stopRepeating();
        } catch (CameraAccessException e) {
            Log.e(TAG, Log.getStackTraceString(e));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public CaptureRequest.Builder createCaptureRequest() {
        boolean z = true;
        if (this.mCamera2 == null || this.mCameraHandler == null || this.mCaptureSession == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            StringBuilder append = new StringBuilder().append("mCamera2 is null: ").append(Boolean.toString(this.mCamera2 == null)).append(", mCameraHandler is null: ");
            if (this.mCameraHandler != null) {
                z = false;
            }
            Log.e(TAG, append.append(Boolean.toString(z)).toString());
            return null;
        }
        try {
            CameraDevice cameraDevice = this.mCamera2;
            CameraDevice cameraDevice2 = this.mCamera2;
            return cameraDevice.createCaptureRequest(3);
        } catch (CameraAccessException e) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void setRepeatingRequest(CaptureRequest.Builder builder) {
        boolean z = true;
        if (this.mCamera2 == null || this.mCameraHandler == null || this.mCaptureSession == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            StringBuilder append = new StringBuilder().append("mCamera2 is null: ").append(Boolean.toString(this.mCamera2 == null)).append(", mCameraHandler is null: ");
            if (this.mCameraHandler != null) {
                z = false;
            }
            Log.e(TAG, append.append(Boolean.toString(z)).toString());
        } else if (builder != null) {
            try {
                this.mBuilder = builder;
                this.mCaptureSession.stopRepeating();
            } catch (CameraAccessException e) {
                Log.e(TAG, Log.getStackTraceString(e));
            }
        }
    }
}
