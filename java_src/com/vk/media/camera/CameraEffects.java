package com.vk.media.camera;

import android.content.Context;
import android.hardware.Camera;
import android.media.CamcorderProfile;
import android.text.TextUtils;
import android.util.Log;
import android.view.SurfaceView;
import android.view.TextureView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.analytics.Analytics;
import com.vk.analytics.AnalyticsEvent;
import com.vk.media.camera.CameraUtils;
import com.vk.media.utils.RenderHelpers;
import com.vk.medianative.MediaNative;
import java.io.File;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class CameraEffects extends CameraRender {
    private static final String TAG = CameraEffects.class.getSimpleName();
    private int mCameraId;
    private String mEffectName;
    private boolean mProcessing;
    private CamcorderProfile mProfile;
    private Reader mReader;
    private CameraSource mSource;
    private boolean mStarted;
    private Stat mStat;

    /* loaded from: classes2.dex */
    public enum Status {
        STATUS_OK,
        STATUS_EFFECT_NOT_EXIST,
        STATUS_EFFECT_NOT_LOADED
    }

    public static boolean isSupported() {
        return MediaNative.isMediaSupported();
    }

    public static int getVersion() {
        return MediaNative.nativeProcessorGetVersion();
    }

    public CameraEffects(Context context, TextureView.SurfaceTextureListener listener, SurfaceView view) {
        super(context, listener, view);
        this.mCameraId = -2;
        this.mProcessing = false;
        this.mStarted = false;
        this.mStat = new Stat();
    }

    public CamcorderProfile getVideoProfile(int cameraId) {
        return TextUtils.isEmpty(this.mEffectName) ? this.mSettings.getVideoProfileDefault(cameraId) : this.mSettings.getVideoProfile(cameraId);
    }

    public Status start(Camera camera, int cameraId, String effectName) {
        boolean z = true;
        Status status = Status.STATUS_OK;
        if ((!this.mStarted || !isSameEffect(effectName) || cameraId != this.mCameraId) && getTexture() != null) {
            this.mEffectName = effectName;
            CamcorderProfile profile = getVideoProfile(cameraId);
            boolean force = profile != null && !profile.equals(this.mProfile);
            this.mProfile = profile;
            initProfile(this.mProfile);
            boolean backCamera = cameraId == 0;
            try {
                if (effectName != null) {
                    String path = CameraUtilsEffects.engineDataDir(this.mContext).getAbsolutePath();
                    int i = this.mViewWidth;
                    int i2 = this.mViewHeight;
                    if (CameraUtils.useYUVRender()) {
                        z = false;
                    }
                    MediaNative.nativeProcessorInit(path, i, i2, z);
                    File mask = CameraUtilsEffects.effectJson(this.mContext, effectName);
                    if (!mask.exists()) {
                        return Status.STATUS_EFFECT_NOT_EXIST;
                    }
                    if (cameraId != this.mCameraId) {
                        stopRendering();
                    }
                    this.mProcessing = MediaNative.nativeProcessorLoad(mask.getAbsolutePath(), backCamera);
                    if (!this.mProcessing) {
                        status = Status.STATUS_EFFECT_NOT_LOADED;
                    }
                } else {
                    MediaNative.nativeProcessorLoad(null, backCamera);
                    cleanupFrameReader();
                    this.mProcessing = false;
                }
            } catch (Exception e) {
            }
            start(camera, cameraId, force);
            Log.v(TAG, "start: effect=" + this.mEffectName + " status=" + status);
            return status;
        }
        return status;
    }

    public void stop(boolean release) {
        Log.v(TAG, "stop id=" + this.mCameraId + " release=" + release);
        this.mStarted = false;
        if (this.mSource != null) {
            this.mSource.stop();
        }
        stopRendering();
        if (release) {
            this.mProcessing = false;
            try {
                MediaNative.nativeProcessorDestroy();
            } catch (Exception e) {
            }
            this.mSource = null;
            this.mEffectName = null;
        } else if (this.mRecorder != null) {
            this.mRecorder.stop();
        }
    }

    public boolean capture(Camera.PictureCallback callback) {
        if (this.mReader == null || !this.mProcessing) {
            return false;
        }
        CameraUtils.Frame frame = new CameraUtils.Frame();
        this.mReader.pull(frame);
        callback.onPictureTaken(CameraUtils.makeJpeg(frame), null);
        return true;
    }

    private void start(Camera camera, int cameraId, boolean force) {
        boolean z = false;
        Log.v(TAG, "start: " + this.mCameraId + "->" + cameraId + " texture=" + getTexture() + " process=" + this.mProcessing);
        this.mStarted = true;
        boolean frontCamera = cameraId != 0;
        if (this.mProcessing || force) {
            if (force || cameraId != this.mCameraId || this.mSource == null) {
                if (this.mSource != null) {
                    this.mSource.stop();
                }
                this.mReader = new Reader();
                this.mSource = new CameraSource(this.mReader, this.mViewWidth, this.mViewHeight, this.mContext, this.mSettings.getFps());
                Reader reader = this.mReader;
                boolean z2 = cameraId != this.mCameraId;
                if (!frontCamera) {
                    z = true;
                }
                setFrameReader(reader, z2, z);
            }
            if (this.mReader != null) {
                this.mReader.start();
            }
            if (!this.mSource.isReady()) {
                this.mSource.start(camera, cameraId);
            }
        }
        this.mCameraId = cameraId;
        enableRecorderFlip(frontCamera);
        enableFrameReader(this.mProcessing);
        enableRendering(true);
    }

    private boolean isSameEffect(String effect) {
        return !TextUtils.isEmpty(this.mEffectName) && TextUtils.equals(this.mEffectName, effect);
    }

    private void stopRendering() {
        boolean backCamera = this.mCameraId == 0;
        setFrameReader(null, false, backCamera);
        enableRendering(false);
        try {
            MediaNative.nativeProcessorLoad(null, backCamera);
        } catch (Exception e) {
        }
    }

    /* loaded from: classes2.dex */
    public class Reader implements CameraUtils.FrameObserver, CameraUtils.FrameReader {
        private RenderHelpers.RenderTexture mTexture;
        private final Object mLock = new Object();
        private CameraUtils.Frame mFrame = new CameraUtils.Frame();

        public Reader() {
        }

        @Override // com.vk.media.camera.CameraUtils.FrameReader
        public void setTexture(RenderHelpers.RenderTexture texture) {
            this.mTexture = texture;
        }

        @Override // com.vk.media.camera.CameraUtils.FrameObserver
        public void onFrameCaptured(Camera camera, byte[] frame, int w, int h, int rotation) {
            if (frame != null) {
                synchronized (this.mLock) {
                    this.mFrame.resize(w, h);
                    int[] pixels = this.mFrame.getPixels().array();
                    long pts = getTimestamp();
                    long dts = MediaNative.nativeProcessorDoFrame(frame, w, h, pts, rotation, pixels, CameraEffects.this.mProcessing);
                    this.mFrame.setTimestamp(dts);
                    this.mFrame.setRotation(rotation);
                    CameraEffects.this.mStat.update(w, h, rotation);
                }
            }
        }

        @Override // com.vk.media.camera.CameraUtils.FrameReader
        public void pull(CameraUtils.Frame frame) {
            synchronized (this.mLock) {
                this.mFrame.pull(frame);
            }
        }

        @Override // com.vk.media.camera.CameraUtils.FrameReader
        public void clear() {
            synchronized (this.mLock) {
                this.mFrame.clear();
                CameraEffects.this.mStat.clear();
            }
        }

        private long getTimestamp() {
            if (this.mTexture != null) {
                return this.mTexture.getTimestamp();
            }
            return 0L;
        }

        public void start() {
            synchronized (this.mLock) {
                CameraEffects.this.mStat.clear();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class Stat {
        private static final int LOW_FPS = 14;
        private static final int LOW_FPS_EVENTS = 2;
        private static final long READY_TIME_MS = 4000;
        private int mAverageFps;
        private boolean mEventCollect;
        private ArrayList<String> mEvents;
        private int mHeight;
        private int mOrientation;
        private int mPull;
        private int mPush;
        private long mStartTime;
        private long mTime;
        private int mWidth;

        private Stat() {
            this.mTime = 0L;
            this.mPull = 0;
            this.mPush = 0;
            this.mWidth = 0;
            this.mHeight = 0;
            this.mOrientation = 0;
            this.mStartTime = 0L;
            this.mEventCollect = false;
            this.mEvents = new ArrayList<>();
            this.mAverageFps = 0;
        }

        public void clear() {
            this.mOrientation = 0;
            this.mHeight = 0;
            this.mWidth = 0;
            this.mPush = 0;
            this.mPull = 0;
            this.mTime = 0;
            this.mStartTime = 0L;
            this.mEventCollect = false;
        }

        public void update(int width, int height, int orientation) {
            this.mWidth = width;
            this.mHeight = height;
            this.mOrientation = orientation;
            check();
        }

        public String toString() {
            int time = this.mPull > 0 ? 1000 / this.mPull : 0;
            StringBuilder s = new StringBuilder();
            s.append("[fps:+/-").append(this.mPush).append(CameraUtilsEffects.FILE_DELIM).append(this.mPull).append(", ").append(this.mWidth).append("x").append(this.mHeight).append("~").append(time).append("(ms)-").append(this.mOrientation).append("]");
            return s.toString();
        }

        private void check() {
            if (CameraEffects.this.mProcessing) {
                long now = System.currentTimeMillis();
                if (now - this.mTime >= 1000) {
                    int fps = MediaNative.nativeProcessorGetFPS();
                    this.mPush = fps >> 16;
                    this.mPull = (short) fps;
                    this.mTime = now;
                    if (this.mStartTime == 0) {
                        this.mStartTime = System.currentTimeMillis();
                    }
                    if (this.mPull > 3 && !this.mEventCollect && now - this.mStartTime > READY_TIME_MS) {
                        String event = toString();
                        this.mAverageFps += this.mPull;
                        this.mEvents.add(event);
                        int averageFps = this.mAverageFps / this.mEvents.size();
                        Log.d(CameraEffects.TAG, "stat: avg: " + averageFps + " events: " + this.mEvents.size() + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + event);
                        if (averageFps < 14 && this.mEvents.size() > 2 && CameraEffects.this.mSettings != null) {
                            CameraEffects.this.mSettings.setUseLowResolution();
                        }
                        AnalyticsEvent.MediaCameraEvent e = new AnalyticsEvent.MediaCameraEvent();
                        if (e.isReady()) {
                            e.fill(averageFps, this.mEvents);
                            Analytics.logOnce(e);
                            this.mAverageFps = 0;
                            this.mEvents.clear();
                        }
                        this.mEventCollect = true;
                    }
                }
            }
        }
    }
}
