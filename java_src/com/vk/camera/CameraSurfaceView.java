package com.vk.camera;

import android.content.Context;
import android.graphics.Point;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.media.CamcorderProfile;
import android.text.TextUtils;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import com.google.android.exoplayer2.util.Util;
import com.vk.camera.CameraRecorder;
import com.vk.camera.camera1.CameraManager;
import com.vk.core.util.FileUtils;
import com.vk.media.camera.CameraEffects;
import com.vk.media.camera.CameraUtils;
import com.vkontakte.android.Log;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.configs.VideoConfig;
/* loaded from: classes2.dex */
public class CameraSurfaceView {
    private static final String TAG = CameraSurfaceView.class.getSimpleName();

    /* loaded from: classes2.dex */
    public enum Status {
        STATUS_OK,
        STATUS_NOT_EXIST,
        STATUS_NOT_LOADED,
        STATUS_EMPTY_CAMERA
    }

    public static SurfaceViewHolder create(Context context, SurfaceHolder.Callback callback) {
        return CameraEffects.isSupported() ? new SurfaceEffectsHolder(context, callback) : new SurfaceViewHolder(context, callback);
    }

    /* loaded from: classes2.dex */
    public static class SurfaceViewHolder {
        private SurfaceView cameraPreview;
        private SurfaceHolder previewHolder;

        public SurfaceViewHolder(Context context, SurfaceHolder.Callback callback) {
            this.cameraPreview = new SurfaceView(context);
            this.cameraPreview.setZOrderMediaOverlay(true);
            this.previewHolder = this.cameraPreview.getHolder();
            this.previewHolder.setType(3);
            this.previewHolder.addCallback(callback);
        }

        public SurfaceView getSurfaceView() {
            return this.cameraPreview;
        }

        public View view() {
            return this.cameraPreview;
        }

        public CamcorderProfile getVideoProfile(int cameraId) {
            return null;
        }

        public void requestLayout() {
            View v = view();
            if (v != null) {
                v.requestLayout();
            }
        }

        public boolean startPreview(CameraManager.CameraProxy camera, int cameraId) {
            if (camera != null) {
                camera.setPreviewDisplayAsync(this.previewHolder);
                camera.startPreviewAsync();
                return true;
            }
            return false;
        }

        public void stopPreview(boolean keep) {
        }

        public CameraRecorder.RecorderBase getRecorder() {
            return new CameraRecorder.Recorder();
        }

        public Status setEffect(String name) {
            return Status.STATUS_OK;
        }
    }

    /* loaded from: classes2.dex */
    public static class SurfaceEffectsHolder extends SurfaceViewHolder implements TextureView.SurfaceTextureListener {
        private CameraManager.CameraProxy camera;
        private int cameraId;
        private String lastEffect;
        private CameraEffects processor;
        private boolean startDelayed;
        private boolean started;

        public SurfaceEffectsHolder(Context context, SurfaceHolder.Callback callback) {
            super(context, callback);
            this.started = false;
            this.startDelayed = false;
            Log.d(CameraSurfaceView.TAG, "version: " + CameraEffects.getVersion());
            Point maxViewportSize = Util.getPhysicalDisplaySize(VKApplication.context);
            int resolution = maxViewportSize.x * maxViewportSize.y;
            boolean useMediaRecorder = true;
            VideoConfig config = VKAccountManager.getCurrent().getVideoConfig();
            if (config != null && config.isMediaCodecRecorder()) {
                useMediaRecorder = false;
            }
            this.processor = new CameraEffects(context, this, getSurfaceView());
            this.processor.init(resolution, useMediaRecorder);
        }

        @Override // com.vk.camera.CameraSurfaceView.SurfaceViewHolder
        public View view() {
            return super.view();
        }

        @Override // com.vk.camera.CameraSurfaceView.SurfaceViewHolder
        public CamcorderProfile getVideoProfile(int cameraId) {
            return this.processor.getVideoProfile(cameraId);
        }

        @Override // com.vk.camera.CameraSurfaceView.SurfaceViewHolder
        public boolean startPreview(CameraManager.CameraProxy camera, int cameraId) {
            this.camera = camera;
            this.cameraId = cameraId;
            startPreview();
            if (!TextUtils.isEmpty(this.lastEffect)) {
                setEffect(this.lastEffect);
                return true;
            }
            return true;
        }

        @Override // com.vk.camera.CameraSurfaceView.SurfaceViewHolder
        public void stopPreview(boolean keep) {
            this.processor.stop(!keep);
            this.started = false;
        }

        @Override // com.vk.camera.CameraSurfaceView.SurfaceViewHolder
        public CameraRecorder.RecorderBase getRecorder() {
            return new SurfaceRecorder(this.processor);
        }

        @Override // com.vk.camera.CameraSurfaceView.SurfaceViewHolder
        public Status setEffect(String name) {
            if (this.camera == null || this.processor == null) {
                return Status.STATUS_EMPTY_CAMERA;
            }
            CameraEffects.Status st = this.processor.start(this.camera.getCamera(), this.cameraId, name);
            if (st == CameraEffects.Status.STATUS_OK) {
                this.lastEffect = name;
                return Status.STATUS_OK;
            }
            this.lastEffect = null;
            if (st == CameraEffects.Status.STATUS_EFFECT_NOT_EXIST) {
                return Status.STATUS_NOT_EXIST;
            }
            return Status.STATUS_NOT_LOADED;
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureAvailable(SurfaceTexture surface, int width, int height) {
            Log.v(CameraSurfaceView.TAG, "onSurfaceTextureAvailable " + surface);
            if (this.startDelayed) {
                startPreview();
            }
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {
            Log.v(CameraSurfaceView.TAG, "onSurfaceTextureSizeChanged " + surface + " (" + width + "x" + height + ")");
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public boolean onSurfaceTextureDestroyed(SurfaceTexture surface) {
            Log.v(CameraSurfaceView.TAG, "onSurfaceTextureDestroyed " + surface);
            if (this.processor != null) {
                this.processor.stop(true);
            }
            this.startDelayed = false;
            this.started = false;
            return false;
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureUpdated(SurfaceTexture surface) {
        }

        private void startPreview() {
            Log.v(CameraSurfaceView.TAG, "startPreview " + this.started + " id=" + this.lastEffect);
            if (this.camera != null && !this.started) {
                SurfaceTexture texture = this.processor.getTexture();
                if (texture != null) {
                    this.processor.start(this.camera.getCamera(), this.cameraId, this.lastEffect);
                    this.camera.setPreviewTextureAsync(texture);
                    this.camera.startPreviewAsync();
                    this.started = true;
                    return;
                }
                this.startDelayed = true;
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class SurfaceRecorder extends CameraRecorder.RecorderBase {
        private CameraEffects processor;
        private CameraUtils.Recorder recorder;

        public SurfaceRecorder(CameraEffects processor) {
            this.processor = processor;
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public boolean startRecording() {
            this.outputFile = FileUtils.getVideoFile();
            if (this.recorder == null) {
                this.recorder = this.processor.getRecorder();
                if (this.recorder == null) {
                    Log.w(CameraSurfaceView.TAG, "can't create camera recorder");
                    return false;
                }
            }
            this.recorder.setOutputFile(this.outputFile);
            this.recorder.setOrientationHint(this.outputOrientation);
            if (this.maxRecordingLengthMs > 0) {
                this.recorder.setMaxDuration((int) this.maxRecordingLengthMs);
            }
            this.recorder.setOnInfoListener(this);
            this.recorder.setOnErrorListener(this);
            this.recorder.prepare();
            return this.recorder.start();
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public boolean isRecording() {
            return this.recorder != null && this.recorder.isRecording();
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public void stopRecording() {
            if (this.recorder != null) {
                this.recorder.stop();
            }
        }

        @Override // com.vk.camera.CameraRecorder.RecorderBase, com.vk.camera.CameraObject.Recorder
        public boolean capture(Camera.PictureCallback callback) {
            return this.processor != null && this.processor.capture(callback);
        }
    }
}
