package com.vk.camera;

import android.hardware.Camera;
import android.media.CamcorderProfile;
import android.media.MediaRecorder;
import com.vk.camera.CameraObject;
import com.vk.camera.camera1.CameraManager;
import com.vk.core.util.FileUtils;
import java.io.File;
/* loaded from: classes2.dex */
public class CameraRecorder {

    /* loaded from: classes2.dex */
    public static abstract class RecorderBase implements CameraObject.Recorder, MediaRecorder.OnInfoListener, MediaRecorder.OnErrorListener {
        protected CameraManager.CameraProxy camera;
        protected long maxRecordingLengthMs;
        protected File outputFile;
        protected int outputOrientation = -1;
        protected CamcorderProfile profile;
        protected CameraObject.OnRecordingCallback recordingCallback;

        public void release() {
        }

        public File getOutputFile() {
            return this.outputFile;
        }

        public void setup(CameraManager.CameraProxy camera, CamcorderProfile profile, int orientationHint) {
            this.camera = camera;
            this.profile = profile;
            this.outputOrientation = orientationHint;
        }

        public CameraObject.OnRecordingCallback getCallback() {
            return this.recordingCallback;
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public long getMaxRecordingLengthMs() {
            return this.maxRecordingLengthMs;
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public void setMaxRecordingLengthMs(long maxRecordingLengthMs) {
            this.maxRecordingLengthMs = maxRecordingLengthMs;
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public void setRecordingCallback(CameraObject.OnRecordingCallback recordingCallback) {
            this.recordingCallback = recordingCallback;
        }

        @Override // android.media.MediaRecorder.OnInfoListener
        public void onInfo(MediaRecorder mr, int what, int extra) {
            if (this.recordingCallback != null) {
                this.recordingCallback.onInfo(what, extra);
            }
        }

        @Override // android.media.MediaRecorder.OnErrorListener
        public void onError(MediaRecorder mr, int what, int extra) {
            if (this.recordingCallback != null) {
                this.recordingCallback.onError(what, extra);
            }
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public boolean capture(Camera.PictureCallback callback) {
            if (this.camera == null || callback == null) {
                return false;
            }
            this.camera.takePicture(null, null, null, callback);
            return true;
        }
    }

    /* loaded from: classes2.dex */
    public static class Recorder extends RecorderBase {
        private MediaRecorder recorder = null;

        @Override // com.vk.camera.CameraRecorder.RecorderBase
        public void release() {
            if (this.recorder != null) {
                try {
                    this.recorder.stop();
                } catch (Exception e) {
                }
                try {
                    this.recorder.release();
                } catch (Exception e2) {
                }
            }
            this.recorder = null;
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public boolean startRecording() {
            try {
                this.camera.unlock();
                this.outputFile = FileUtils.getVideoFile();
                this.recorder = new MediaRecorder();
                this.recorder.setCamera(this.camera.getCamera());
                this.recorder.setAudioSource(5);
                this.recorder.setVideoSource(1);
                this.recorder.setProfile(this.profile);
                this.recorder.setOutputFile(this.outputFile.getAbsolutePath());
                this.recorder.setOrientationHint(this.outputOrientation);
                if (this.maxRecordingLengthMs > 0) {
                    this.recorder.setMaxDuration((int) this.maxRecordingLengthMs);
                }
                this.recorder.setOnInfoListener(this);
                this.recorder.setOnErrorListener(this);
                this.recorder.prepare();
                this.recorder.start();
            } catch (Exception e) {
                release();
                try {
                    this.camera.lock();
                } catch (Throwable th) {
                }
            }
            return true;
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public boolean isRecording() {
            return this.recorder != null;
        }

        @Override // com.vk.camera.CameraObject.Recorder
        public void stopRecording() {
            if (this.recorder != null) {
                try {
                    this.recorder.stop();
                } catch (Exception e) {
                }
            }
        }
    }
}
