package com.wmspanel.libstream;

import android.hardware.Camera;
import android.os.SystemClock;
import android.util.Log;
import android.view.SurfaceHolder;
import com.my.target.ads.instream.InstreamAd;
import com.wmspanel.libstream.Streamer;
import java.nio.ByteBuffer;
import java.util.List;
/* loaded from: classes3.dex */
class VideoListener16 extends VideoListener16Base {
    private static final String TAG = "VideoListener16";
    private c colorConverter;
    private boolean mPlanar;
    protected Camera.PreviewCallback mPreviewCallback;
    SurfaceHolder mPreviewSurfaceHolder;

    public VideoListener16(StreamBuffer streamBuffer, Streamer.Listener listener) {
        super(streamBuffer, listener);
        this.colorConverter = null;
        this.mPreviewCallback = new Camera.PreviewCallback() { // from class: com.wmspanel.libstream.VideoListener16.1
            @Override // android.hardware.Camera.PreviewCallback
            public void onPreviewFrame(byte[] data, Camera camera) {
                try {
                    if (data == null) {
                        Log.e(VideoListener16.TAG, "data is null");
                    } else if (VideoListener16.this.mEncoder.getEncoder() == null) {
                        Log.e(VideoListener16.TAG, "mMediaCodec is null");
                    } else {
                        int dequeueInputBuffer = VideoListener16.this.mEncoder.getEncoder().dequeueInputBuffer(-1L);
                        if (dequeueInputBuffer >= 0) {
                            ByteBuffer byteBuffer = VideoListener16.this.mEncoder.getEncoder().getInputBuffers()[dequeueInputBuffer];
                            byteBuffer.clear();
                            int length = data.length;
                            if (length > byteBuffer.remaining()) {
                                length = byteBuffer.remaining();
                            }
                            byteBuffer.put(VideoListener16.this.colorConverter.a(data, VideoListener16.this.mPreviewSize.width, VideoListener16.this.mPreviewSize.height), 0, length);
                            VideoListener16.this.mEncoder.getEncoder().queueInputBuffer(dequeueInputBuffer, 0, length, SystemClock.uptimeMillis() * 1000, 0);
                            VideoListener16.this.getVideoFrame();
                        }
                    }
                } catch (Exception e) {
                    Log.e(VideoListener16.TAG, "failed to add video data into encoder buffer");
                    Log.e(VideoListener16.TAG, Log.getStackTraceString(e));
                }
            }
        };
    }

    private boolean openCamera(String cameraId, boolean planar) {
        int i;
        int i2;
        int i3;
        this.mCameraId = cameraId;
        Log.d(TAG, "open camera#" + this.mCameraId);
        this.mCamera = Camera.open(Integer.parseInt(this.mCameraId));
        this.mCamera.setErrorCallback(this.mErrorCallback);
        Camera.Parameters parameters = this.mCamera.getParameters();
        parameters.setPreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
        List<Integer> supportedPreviewFormats = parameters.getSupportedPreviewFormats();
        if (supportedPreviewFormats == null || supportedPreviewFormats.size() <= 0) {
            i = -1;
        } else {
            if (planar) {
                for (Integer num : supportedPreviewFormats) {
                    i3 = num.intValue();
                    if (842094169 == i3) {
                        this.colorConverter = new q();
                        break;
                    }
                }
            }
            i3 = -1;
            if (-1 == i3) {
                for (Integer num2 : supportedPreviewFormats) {
                    i = num2.intValue();
                    if (17 == i) {
                        if (planar) {
                            this.colorConverter = new h();
                        } else {
                            this.colorConverter = new g();
                        }
                    } else if (842094169 == i) {
                        if (planar) {
                            this.colorConverter = new q();
                        } else {
                            this.colorConverter = new p();
                        }
                    }
                }
            }
            i = i3;
        }
        if (-1 == i) {
            Log.e(TAG, "failed to set preview format, camera=" + this.mCameraId);
            return false;
        }
        parameters.setPreviewFormat(i);
        Log.d(TAG, "camera#" + this.mCameraId + " preview_format=" + parameters.getPreviewFormat());
        setFocusMode(parameters, this.mFocusMode.focusMode16);
        setAwbMode(parameters, this.mFocusMode.awbMode16);
        setAntibandingMode(parameters, this.mFocusMode.antibandingMode16);
        setExposureCompensation(parameters, this.mFocusMode.exposureCompensation);
        this.mCamera.setParameters(parameters);
        Camera.CameraInfo cameraInfo = new Camera.CameraInfo();
        Camera.getCameraInfo(Integer.parseInt(this.mCameraId), cameraInfo);
        if (cameraInfo.facing == 1) {
            i2 = (360 - ((cameraInfo.orientation + this.mDisplayOrientation) % InstreamAd.DEFAULT_VIDEO_QUALITY)) % InstreamAd.DEFAULT_VIDEO_QUALITY;
        } else {
            i2 = ((cameraInfo.orientation - this.mDisplayOrientation) + InstreamAd.DEFAULT_VIDEO_QUALITY) % InstreamAd.DEFAULT_VIDEO_QUALITY;
        }
        this.mCamera.setDisplayOrientation(i2);
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0053, code lost:
        android.util.Log.e(com.wmspanel.libstream.VideoListener16.TAG, "can't find supported color format");
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0061, code lost:
        throw new java.lang.Exception();
     */
    @Override // com.wmspanel.libstream.VideoListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void start(android.content.Context r9, java.lang.String r10, android.view.SurfaceHolder r11, android.graphics.SurfaceTexture r12, com.wmspanel.libstream.VideoEncoder r13) {
        /*
            r8 = this;
            r7 = 21
            r0 = 0
            r3 = -1
            if (r11 != 0) goto Lc
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            r0.<init>()
            throw r0
        Lc:
            if (r13 == 0) goto L14
            android.media.MediaCodec r1 = r13.getEncoder()
            if (r1 != 0) goto L1a
        L14:
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            r0.<init>()
            throw r0
        L1a:
            r8.mPreviewSurfaceHolder = r11     // Catch: java.lang.Exception -> L62
            r8.mEncoder = r13     // Catch: java.lang.Exception -> L62
            r1 = 0
            r8.mPlanar = r1     // Catch: java.lang.Exception -> L62
            com.wmspanel.libstream.VideoEncoder r1 = r8.mEncoder     // Catch: java.lang.Exception -> L62
            int[] r4 = r1.getSupportedColorFormats()     // Catch: java.lang.Exception -> L62
            int r5 = r4.length     // Catch: java.lang.Exception -> L62
            r2 = r0
        L29:
            if (r2 >= r5) goto Lc0
            r1 = r4[r2]     // Catch: java.lang.Exception -> L62
            r6 = 19
            if (r6 == r1) goto L35
            r6 = 20
            if (r6 != r1) goto L7e
        L35:
            r2 = 1
            r8.mPlanar = r2     // Catch: java.lang.Exception -> L62
        L38:
            if (r1 != r3) goto Lbe
            com.wmspanel.libstream.VideoEncoder r2 = r8.mEncoder     // Catch: java.lang.Exception -> L62
            int[] r4 = r2.getSupportedColorFormats()     // Catch: java.lang.Exception -> L62
            int r5 = r4.length     // Catch: java.lang.Exception -> L62
            r2 = r0
        L42:
            if (r2 >= r5) goto Lbe
            r0 = r4[r2]     // Catch: java.lang.Exception -> L62
            if (r7 == r0) goto L51
            r6 = 39
            if (r6 == r0) goto L51
            r6 = 2130706688(0x7f000100, float:1.7014638E38)
            if (r6 != r0) goto L82
        L51:
            if (r0 != r3) goto L86
            java.lang.String r0 = "VideoListener16"
            java.lang.String r1 = "can't find supported color format"
            android.util.Log.e(r0, r1)     // Catch: java.lang.Exception -> L62
            java.lang.Exception r0 = new java.lang.Exception     // Catch: java.lang.Exception -> L62
            r0.<init>()     // Catch: java.lang.Exception -> L62
            throw r0     // Catch: java.lang.Exception -> L62
        L62:
            r0 = move-exception
            java.lang.String r1 = "VideoListener16"
            java.lang.String r2 = android.util.Log.getStackTraceString(r0)
            android.util.Log.e(r1, r2)
            int r1 = android.os.Build.VERSION.SDK_INT
            if (r1 < r7) goto Lbb
            boolean r0 = r0 instanceof android.media.MediaCodec.CodecException
            if (r0 == 0) goto Lbb
            com.wmspanel.libstream.Streamer$CAPTURE_STATE r0 = com.wmspanel.libstream.Streamer.CAPTURE_STATE.ENCODER_FAIL
        L77:
            r8.setVideoCaptureState(r0)
            r8.release()
        L7d:
            return
        L7e:
            int r1 = r2 + 1
            r2 = r1
            goto L29
        L82:
            int r0 = r2 + 1
            r2 = r0
            goto L42
        L86:
            r8.openEncoder(r0)     // Catch: java.lang.Exception -> L62
            android.media.MediaCodec$BufferInfo r0 = new android.media.MediaCodec$BufferInfo     // Catch: java.lang.Exception -> L62
            r0.<init>()     // Catch: java.lang.Exception -> L62
            r8.mBufferInfo = r0     // Catch: java.lang.Exception -> L62
            boolean r0 = r8.mPlanar     // Catch: java.lang.Exception -> L62
            boolean r0 = r8.openCamera(r10, r0)     // Catch: java.lang.Exception -> L62
            if (r0 != 0) goto La7
            java.lang.String r0 = "VideoListener16"
            java.lang.String r1 = "failed to open camera"
            android.util.Log.e(r0, r1)     // Catch: java.lang.Exception -> L62
            java.lang.Exception r0 = new java.lang.Exception     // Catch: java.lang.Exception -> L62
            r0.<init>()     // Catch: java.lang.Exception -> L62
            throw r0     // Catch: java.lang.Exception -> L62
        La7:
            android.hardware.Camera r0 = r8.mCamera     // Catch: java.lang.Exception -> L62
            android.view.SurfaceHolder r1 = r8.mPreviewSurfaceHolder     // Catch: java.lang.Exception -> L62
            r0.setPreviewDisplay(r1)     // Catch: java.lang.Exception -> L62
            android.hardware.Camera r0 = r8.mCamera     // Catch: java.lang.Exception -> L62
            android.hardware.Camera$PreviewCallback r1 = r8.mPreviewCallback     // Catch: java.lang.Exception -> L62
            r0.setPreviewCallback(r1)     // Catch: java.lang.Exception -> L62
            android.hardware.Camera r0 = r8.mCamera     // Catch: java.lang.Exception -> L62
            r0.startPreview()     // Catch: java.lang.Exception -> L62
            goto L7d
        Lbb:
            com.wmspanel.libstream.Streamer$CAPTURE_STATE r0 = com.wmspanel.libstream.Streamer.CAPTURE_STATE.FAILED
            goto L77
        Lbe:
            r0 = r1
            goto L51
        Lc0:
            r1 = r3
            goto L38
        */
        throw new UnsupportedOperationException("Method not decompiled: com.wmspanel.libstream.VideoListener16.start(android.content.Context, java.lang.String, android.view.SurfaceHolder, android.graphics.SurfaceTexture, com.wmspanel.libstream.VideoEncoder):void");
    }

    protected void openEncoder(int colorFormat) {
        this.mEncoder.getFormat().setInteger("color-format", colorFormat);
        this.mEncoder.configure();
        this.mPreviewSize = new Streamer.Size(this.mEncoder.getFormat().getInteger("width"), this.mEncoder.getFormat().getInteger("height"));
        this.mEncoder.start();
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void release() {
        try {
            try {
                resetMediaFormat();
                releaseCamera();
                releaseEncoder();
                setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
            } catch (Exception e) {
                Log.e(TAG, Log.getStackTraceString(e));
                setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
            }
        } catch (Throwable th) {
            setVideoCaptureState(Streamer.CAPTURE_STATE.STOPPED);
            throw th;
        }
    }

    @Override // com.wmspanel.libstream.VideoListener
    public void flip() {
        if (this.mCamera == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            return;
        }
        int numberOfCameras = Camera.getNumberOfCameras();
        if (numberOfCameras < 2) {
            Log.e(TAG, "Device has only one camera");
            return;
        }
        int parseInt = Integer.parseInt(this.mCameraId);
        for (int i = 0; i < numberOfCameras; i++) {
            if (parseInt != i) {
                this.mCameraId = Integer.toString(i);
                break;
            }
        }
        try {
            releaseCamera();
            if (!openCamera(this.mCameraId, this.mPlanar)) {
                setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
                release();
                throw new Exception();
            }
            this.mCamera.setPreviewCallback(this.mPreviewCallback);
            this.mCamera.setPreviewDisplay(this.mPreviewSurfaceHolder);
            this.mCamera.startPreview();
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
            release();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void setCameraParameters(Camera.Parameters param) {
        if (this.mCamera == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            return;
        }
        try {
            this.mCamera.setParameters(param);
        } catch (RuntimeException e) {
            Log.e(TAG, Log.getStackTraceString(e));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void toggleTorch() {
        if (this.mCamera == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            return;
        }
        try {
            Camera.Parameters cameraParameters = getCameraParameters();
            if (cameraParameters != null) {
                String flashMode = cameraParameters.getFlashMode();
                if (flashMode == null) {
                    Log.w(TAG, Messages.err_no_flash);
                    return;
                }
                if (flashMode.equals("off")) {
                    cameraParameters.setFlashMode("torch");
                } else {
                    cameraParameters.setFlashMode("off");
                }
                setCameraParameters(cameraParameters);
            }
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
            release();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.VideoListener
    public void focus() {
        if (this.mCamera == null) {
            Log.e(TAG, Messages.err_video_capture_not_started);
            return;
        }
        try {
            Camera.Parameters cameraParameters = getCameraParameters();
            if (cameraParameters != null) {
                this.mCamera.cancelAutoFocus();
                setFocusMode(cameraParameters, this.mFocusMode.focusMode16);
                setAwbMode(cameraParameters, this.mFocusMode.awbMode16);
                setAntibandingMode(cameraParameters, this.mFocusMode.antibandingMode16);
                setExposureCompensation(cameraParameters, this.mFocusMode.exposureCompensation);
                setCameraParameters(cameraParameters);
            }
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            setVideoCaptureState(Streamer.CAPTURE_STATE.FAILED);
            release();
        }
    }
}
