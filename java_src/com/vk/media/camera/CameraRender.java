package com.vk.media.camera;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.media.CamcorderProfile;
import android.opengl.GLES20;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceView;
import android.view.TextureView;
import com.vk.media.camera.CameraUtils;
import com.vk.media.utils.RenderBase;
import com.vk.media.utils.RenderDrawable;
import com.vk.media.utils.grafika.Texture2dProgram;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes2.dex */
public class CameraRender extends RenderBase {
    private static String TAG = CameraRender.class.getSimpleName();
    private RenderDrawable2D mFrame2D;
    private RenderDrawableExt mFrameExt;
    private AtomicBoolean mFrameReader;
    protected CameraUtils.Recorder.OnRecordFrame mOnRecordCallback;
    private boolean mPortrait;
    protected CameraRecorder mRecorder;
    private RenderDrawable.Flip mRecordingFlip;
    private AtomicBoolean mRendering;
    protected CameraUtils.Settings mSettings;

    public CameraRender(Context context, TextureView.SurfaceTextureListener listener, SurfaceView view) {
        super(context, listener, view);
        this.mRecordingFlip = RenderDrawable.Flip.NO_FLIP;
        this.mFrameReader = new AtomicBoolean(false);
        this.mRendering = new AtomicBoolean(true);
        this.mPortrait = false;
        this.mOnRecordCallback = new CameraUtils.Recorder.OnRecordFrame() { // from class: com.vk.media.camera.CameraRender.1
            @Override // com.vk.media.camera.CameraUtils.Recorder.OnRecordFrame
            public long onRecord(CameraUtils.Frame frame) {
                return CameraRender.this.renderFrame(frame, CameraRender.this.mRecordingFlip);
            }
        };
    }

    public void init(int maxResolution, boolean useMediaRecorder) {
        this.mSettings = new CameraUtils.Settings(this.mContext, maxResolution);
        this.mRecorder = CameraRecorder.create(this.mContext, this.mOnRecordCallback, useMediaRecorder);
    }

    public SurfaceTexture getTexture() {
        return this.mTexture.texture();
    }

    public CameraUtils.Recorder getRecorder() {
        return this.mRecorder;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void enableRecorderFlip(boolean enable) {
        this.mRecordingFlip = enable ? RenderDrawable.Flip.VERTICAL : RenderDrawable.Flip.NO_FLIP;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void cleanupFrameReader() {
        if (this.mFrame2D != null) {
            this.mFrame2D.clear();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void initProfile(CamcorderProfile profile) {
        if (profile != null) {
            setViewSize(profile.videoFrameWidth, profile.videoFrameHeight);
        }
        this.mPortrait = this.mDisplayWidth < this.mDisplayHeight && this.mViewHeight < this.mViewWidth;
        if (this.mRecorder != null) {
            this.mRecorder.setProfile(profile);
            if (this.mRecorder.useExternalRecorder()) {
                this.mRecorder.prepare();
            }
            queueEvent(new Runnable() { // from class: com.vk.media.camera.CameraRender.2
                @Override // java.lang.Runnable
                public void run() {
                    if (CameraRender.this.mRecorder != null && CameraRender.this.mRecorder.useExternalRecorder()) {
                        CameraRender.this.mRecorder.createSurface(CameraRender.this.mEglCore);
                    }
                }
            });
        }
        Log.v(TAG, "init profile: display=" + this.mDisplayWidth + "x" + this.mDisplayHeight + ", view=" + this.mViewWidth + "x" + this.mViewHeight + " portrait=" + this.mPortrait);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean setFrameReader(CameraUtils.FrameReader reader, boolean delayRendering, boolean backCamera) {
        enableFrameReader(reader != null);
        if (this.mFrame2D != null) {
            this.mFrame2D.setReader(reader, delayRendering, backCamera);
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void enableFrameReader(boolean enable) {
        this.mFrameReader.set(enable);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void enableRendering(boolean enable) {
        this.mRendering.set(enable);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.media.utils.RenderBase
    public void onSurfaceCreated(Surface surface) {
        Log.v(TAG, "onSurfaceCreated: surface=" + surface);
        super.onSurfaceCreated(surface);
        try {
            this.mFrameExt = new RenderDrawableExt();
            this.mFrame2D = new RenderDrawable2D();
            this.mTexture.create(this.mFrameExt.createTextureObject());
        } catch (Throwable th) {
        }
    }

    @Override // com.vk.media.utils.RenderBase
    protected void onSurfaceChanged(int width, int height) {
        Log.v(TAG, "onSurfaceChanged: display=" + this.mDisplayWidth + "x" + this.mDisplayHeight + ", view=" + this.mViewWidth + "x" + this.mViewHeight);
    }

    @Override // com.vk.media.utils.RenderBase
    protected void onSurfaceDestroyed() {
        if (this.mFrameExt != null) {
            this.mFrameExt.release(false);
            this.mFrameExt = null;
        }
        if (this.mFrame2D != null) {
            this.mFrame2D.release(false);
            this.mFrame2D = null;
        }
        if (this.mDisplaySurface != null) {
            this.mDisplaySurface.release();
            this.mDisplaySurface = null;
        }
        if (this.mEglCore != null) {
            this.mEglCore.release();
            this.mEglCore = null;
        }
        if (this.mTexture != null) {
            this.mTexture.release();
        }
        if (this.mRecorder != null) {
            this.mRecorder.release();
        }
        Log.v(TAG, "onSurfaceDestroyed");
    }

    @Override // com.vk.media.utils.RenderBase
    protected void onDraw() {
        if (this.mTexture != null) {
            GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
            GLES20.glClear(16640);
            this.mTexture.update(this.mSTMatrix);
            draw();
        }
    }

    private void draw() {
        if (this.mRendering.get()) {
            CameraUtils.Frame frame = (!this.mFrameReader.get() || this.mFrame2D == null) ? null : this.mFrame2D.pull();
            if (this.mRecorder != null) {
                if (this.mPortrait) {
                    this.mRecorder.record(frame, this.mEglCore, this.mViewHeight, this.mViewWidth);
                } else {
                    this.mRecorder.record(frame, this.mEglCore, this.mViewWidth, this.mViewHeight);
                }
            }
            GLES20.glViewport(0, 0, this.mDisplayWidth, this.mDisplayHeight);
            this.mDisplaySurface.makeCurrent();
            renderFrame(frame, RenderDrawable.Flip.NO_FLIP);
            this.mDisplaySurface.swapBuffers();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long renderFrame(CameraUtils.Frame frame, RenderDrawable.Flip flip) {
        if (this.mFrameReader.get() && frame != null && frame.exists()) {
            if (this.mFrame2D == null) {
                return 0L;
            }
            return this.mFrame2D.drawFrame(frame, this.mSTMatrix, flip);
        }
        this.mFrameExt.drawFrame(this.mTexture.getTextureId(), this.mSTMatrix, flip);
        return this.mTexture.getTimestamp();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class RenderDrawableExt extends RenderDrawable {
        public RenderDrawableExt() {
            super(new Texture2dProgram(Texture2dProgram.ProgramType.TEXTURE_EXT));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class RenderDrawable2D extends RenderDrawable {
        private static final int SKIP_FIRST_FRAMES = 10;
        private CameraUtils.Frame mFrame;
        private int mFrames;
        private CameraUtils.FrameReader mReader;
        private int mTextureId;

        public RenderDrawable2D() {
            super(new Texture2dProgram(Texture2dProgram.ProgramType.TEXTURE_2D));
            this.mTextureId = 0;
            this.mFrame = new CameraUtils.Frame();
            this.mFrames = 0;
            this.mTextureId = createTextureObject();
        }

        public void setReader(CameraUtils.FrameReader reader, boolean delayRendering, boolean backCamera) {
            if (reader != null) {
                getDrawable().makeTexCoordArrays(backCamera);
                if (delayRendering && this.mReader == null) {
                    this.mFrames = 10;
                }
                this.mReader = reader;
                this.mReader.setTexture(CameraRender.this.mTexture);
                return;
            }
            clear();
        }

        public CameraUtils.Frame pull() {
            if (this.mReader != null) {
                this.mReader.pull(this.mFrame);
            }
            return this.mFrame;
        }

        public long drawFrame(CameraUtils.Frame frame, float[] texMatrix, RenderDrawable.Flip flip) {
            if (this.mReader == null || this.mFrames < 10) {
                this.mFrames++;
                return 0L;
            }
            super.drawFrame2D(this.mTextureId, texMatrix, flip, frame.getPixels(), frame.getWidth(), frame.getHeight());
            return frame.getTimestamp();
        }

        public void clear() {
            if (this.mReader != null) {
                this.mReader.clear();
            }
            this.mFrame.clear();
            this.mFrames = 0;
        }
    }
}
