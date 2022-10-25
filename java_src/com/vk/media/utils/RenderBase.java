package com.vk.media.utils;

import android.content.Context;
import android.opengl.GLES20;
import android.opengl.GLSurfaceView;
import android.opengl.Matrix;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.media.utils.RenderHelpers;
import com.vk.media.utils.grafika.EglCore;
import com.vk.media.utils.grafika.WindowSurface;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
/* loaded from: classes2.dex */
public class RenderBase {
    protected Context mContext;
    protected int mDisplayHeight;
    protected WindowSurface mDisplaySurface;
    protected int mDisplayWidth;
    protected EglCore mEglCore;
    private TextureView.SurfaceTextureListener mListener;
    private RenderHelpers.Renderer mRenderer;
    private View mView;
    protected int mViewHeight;
    protected int mViewWidth;
    protected RenderHelpers.RenderTexture mTexture = new RenderHelpers.RenderTexture();
    protected float[] mSTMatrix = new float[16];
    private Runnable mCreated = new Runnable() { // from class: com.vk.media.utils.RenderBase.1
        @Override // java.lang.Runnable
        public void run() {
            if (RenderBase.this.mListener != null) {
                RenderBase.this.mListener.onSurfaceTextureAvailable(RenderBase.this.mTexture.texture(), RenderBase.this.mDisplayWidth, RenderBase.this.mDisplayHeight);
            }
        }
    };
    private Runnable mChanged = new Runnable() { // from class: com.vk.media.utils.RenderBase.2
        @Override // java.lang.Runnable
        public void run() {
            if (RenderBase.this.mListener != null) {
                RenderBase.this.mListener.onSurfaceTextureSizeChanged(RenderBase.this.mTexture.texture(), RenderBase.this.mDisplayWidth, RenderBase.this.mDisplayHeight);
            }
        }
    };
    private Runnable mDestroyed = new Runnable() { // from class: com.vk.media.utils.RenderBase.3
        @Override // java.lang.Runnable
        public void run() {
            if (RenderBase.this.mListener != null) {
                RenderBase.this.mListener.onSurfaceTextureDestroyed(RenderBase.this.mTexture.texture());
            }
        }
    };

    public RenderBase(Context context, TextureView.SurfaceTextureListener listener, SurfaceView view) {
        this.mContext = null;
        this.mContext = context;
        this.mListener = listener;
        if (view == null) {
            GLRenderer r = new GLRenderer(context);
            this.mRenderer = r;
            this.mView = r.getView();
        } else {
            this.mRenderer = new CustomRenderer(view);
            this.mView = view;
        }
        this.mTexture.setRenderer(this.mRenderer);
        Matrix.setIdentityM(this.mSTMatrix, 0);
    }

    public View getView() {
        return this.mView;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setViewSize(int width, int height) {
        this.mViewWidth = width;
        this.mViewHeight = height;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void queueEvent(Runnable r) {
        this.mRenderer.queueEvent(r);
    }

    protected void onDraw() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onSurfaceCreated(Surface surface) {
        this.mEglCore = new EglCore(null, 1);
        if (surface != null && surface.isValid()) {
            this.mDisplaySurface = new WindowSurface(this.mEglCore, surface, false);
            this.mDisplaySurface.makeCurrent();
        }
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    }

    protected void onSurfaceChanged(int width, int height) {
    }

    protected void onSurfaceDestroyed() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void runOnUiThread(Runnable r) {
        if (this.mView != null) {
            this.mView.post(r);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateDisplaySize(int width, int height) {
        this.mDisplayWidth = width;
        this.mDisplayHeight = height;
    }

    /* loaded from: classes2.dex */
    private class GLRenderer implements RenderHelpers.Renderer, GLSurfaceView.Renderer {
        private GLSurfaceView mView;

        public GLRenderer(Context context) {
            this.mView = new GLSurfaceView(context);
            this.mView.setEGLContextClientVersion(2);
            this.mView.setEGLConfigChooser(8, 8, 8, 8, 16, 0);
            this.mView.setPreserveEGLContextOnPause(true);
            this.mView.setZOrderMediaOverlay(true);
            this.mView.setRenderer(this);
            this.mView.setRenderMode(0);
        }

        public View getView() {
            return this.mView;
        }

        @Override // com.vk.media.utils.RenderHelpers.Renderer
        public void queueEvent(Runnable r) {
            this.mView.queueEvent(r);
        }

        @Override // com.vk.media.utils.RenderHelpers.Renderer
        public void draw() {
            this.mView.requestRender();
        }

        @Override // com.vk.media.utils.RenderHelpers.Renderer
        public void release() {
        }

        @Override // android.opengl.GLSurfaceView.Renderer
        public void onSurfaceCreated(GL10 gl, EGLConfig config) {
            RenderBase.this.onSurfaceCreated(null);
            RenderBase.this.runOnUiThread(RenderBase.this.mCreated);
        }

        @Override // android.opengl.GLSurfaceView.Renderer
        public void onSurfaceChanged(GL10 gl, int width, int height) {
            RenderBase.this.updateDisplaySize(width, height);
            RenderBase.this.onSurfaceChanged(width, height);
            RenderBase.this.runOnUiThread(RenderBase.this.mChanged);
        }

        @Override // android.opengl.GLSurfaceView.Renderer
        public void onDrawFrame(GL10 gl) {
            RenderBase.this.onDraw();
        }
    }

    /* loaded from: classes2.dex */
    private class CustomRenderer extends RenderHelpers.RenderThread implements RenderHelpers.Renderer, SurfaceHolder.Callback {
        CustomRenderer(SurfaceView view) {
            SurfaceHolder holder = view.getHolder();
            holder.addCallback(this);
            start();
        }

        @Override // com.vk.media.utils.RenderHelpers.Renderer
        public void queueEvent(Runnable r) {
            RenderHelpers.RenderHandler rh = getHandler();
            if (rh != null && isAlive()) {
                rh.sendEvent(r);
            }
        }

        @Override // com.vk.media.utils.RenderHelpers.Renderer
        public void release() {
            RenderHelpers.RenderHandler rh = getHandler();
            if (rh != null) {
                rh.sendShutdown();
            }
        }

        @Override // com.vk.media.utils.RenderHelpers.Renderer
        public void draw() {
            RenderHelpers.RenderHandler rh = getHandler();
            if (rh != null) {
                rh.sendDoFrame(0L);
            }
        }

        @Override // android.view.SurfaceHolder.Callback
        public void surfaceCreated(SurfaceHolder holder) {
            start();
            Log.d(TAG, "surfaceCreated=" + holder);
            RenderHelpers.RenderHandler rh = getHandler();
            if (rh != null && isAlive()) {
                rh.sendSurfaceCreated(holder.getSurface());
            }
        }

        @Override // android.view.SurfaceHolder.Callback
        public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
            Log.d(TAG, "surfaceChanged=" + holder + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + width + "x" + height);
            RenderHelpers.RenderHandler rh = getHandler();
            if (rh != null && isAlive()) {
                rh.sendSurfaceChanged(width, height);
            }
        }

        @Override // android.view.SurfaceHolder.Callback
        public void surfaceDestroyed(SurfaceHolder holder) {
            Log.d(TAG, "surfaceDestroyed=" + holder);
            RenderHelpers.RenderHandler rh = getHandler();
            if (rh != null && isAlive()) {
                rh.sendSurfaceDestroyed();
            }
        }

        @Override // com.vk.media.utils.RenderHelpers.RenderThread
        protected void notifySurfaceCreated(Surface surface) {
            RenderBase.this.onSurfaceCreated(surface);
            RenderBase.this.runOnUiThread(RenderBase.this.mCreated);
        }

        @Override // com.vk.media.utils.RenderHelpers.RenderThread
        protected void notifySurfaceChanged(int width, int height) {
            RenderBase.this.updateDisplaySize(width, height);
            RenderBase.this.onSurfaceChanged(width, height);
            RenderBase.this.runOnUiThread(RenderBase.this.mChanged);
        }

        @Override // com.vk.media.utils.RenderHelpers.RenderThread
        protected void notifySurfaceDestroyed() {
            RenderBase.this.onSurfaceDestroyed();
            RenderBase.this.runOnUiThread(RenderBase.this.mDestroyed);
            if (RenderBase.this.mRenderer != null) {
                RenderBase.this.mRenderer.release();
            }
        }

        @Override // com.vk.media.utils.RenderHelpers.RenderThread
        protected void notifyDoFrame(long timestamp) {
            if (isAlive()) {
                RenderBase.this.onDraw();
            }
        }
    }
}
