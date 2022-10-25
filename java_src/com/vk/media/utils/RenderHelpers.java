package com.vk.media.utils;

import android.graphics.SurfaceTexture;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.view.Surface;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public class RenderHelpers {

    /* loaded from: classes2.dex */
    public interface Renderer {
        void draw();

        void queueEvent(Runnable runnable);

        void release();
    }

    /* loaded from: classes2.dex */
    public static class RenderThread {
        protected static final String TAG = RenderThread.class.getSimpleName();
        private volatile RenderHandler mHandler;
        private Thread mThread;
        private final Object mStartLock = new Object();
        private boolean mReady = false;
        private Runnable mRunnable = new Runnable() { // from class: com.vk.media.utils.RenderHelpers.RenderThread.1
            @Override // java.lang.Runnable
            public void run() {
                Looper.prepare();
                RenderThread.this.mHandler = new RenderHandler(RenderThread.this);
                synchronized (RenderThread.this.mStartLock) {
                    RenderThread.this.mReady = true;
                    RenderThread.this.mStartLock.notify();
                }
                Log.d(RenderThread.TAG, "looper loop");
                Looper.loop();
                synchronized (RenderThread.this.mStartLock) {
                    RenderThread.this.mReady = false;
                }
                RenderThread.this.mHandler = null;
                Log.d(RenderThread.TAG, "looper quit");
            }
        };

        public void start() {
            if (!this.mReady) {
                Log.d(TAG, TtmlNode.START);
                if (this.mThread == null) {
                    this.mThread = new Thread(this.mRunnable);
                }
                this.mThread.start();
                waitUntilReady();
            }
        }

        public void waitUntilReady() {
            synchronized (this.mStartLock) {
                while (!this.mReady) {
                    try {
                        this.mStartLock.wait();
                    } catch (InterruptedException e) {
                    }
                }
            }
        }

        public boolean isAlive() {
            return this.mReady && this.mThread != null && this.mThread.isAlive();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void shutdown() {
            this.mReady = false;
            Looper.myLooper().quit();
            try {
                if (this.mThread != null && !this.mThread.isInterrupted()) {
                    this.mThread.interrupt();
                }
                this.mThread.join();
            } catch (Exception e) {
            }
            this.mThread = null;
            Log.d(TAG, "shutdown");
        }

        public final RenderHandler getHandler() {
            return this.mHandler;
        }

        protected void notifySurfaceCreated(Surface surface) {
        }

        protected void notifySurfaceChanged(int width, int height) {
        }

        protected void notifySurfaceDestroyed() {
        }

        protected void notifyDoFrame(long timestamp) {
        }

        protected void notifyDoEvent(Runnable event) {
            if (event != null) {
                event.run();
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class RenderHandler extends Handler {
        private static final int MSG_DO_EVENT = 4;
        private static final int MSG_DO_FRAME = 3;
        private static final int MSG_SHUTDOWN = 5;
        private static final int MSG_SURFACE_CHANGED = 1;
        private static final int MSG_SURFACE_CREATED = 0;
        private static final int MSG_SURFACE_DESTROYED = 2;
        private WeakReference<RenderThread> mWeakRenderThread;

        public RenderHandler(RenderThread rt) {
            this.mWeakRenderThread = new WeakReference<>(rt);
        }

        public void sendSurfaceCreated(Surface surface) {
            sendMessage(obtainMessage(0, surface));
        }

        public void sendSurfaceChanged(int width, int height) {
            sendMessage(obtainMessage(1, width, height));
        }

        public void sendSurfaceDestroyed() {
            if (isAlive()) {
                sendMessage(obtainMessage(2));
            }
        }

        public void sendDoFrame(long frameTimeNanos) {
            sendMessage(obtainMessage(3, (int) (frameTimeNanos >> 32), (int) frameTimeNanos));
        }

        public void sendEvent(Runnable r) {
            sendMessage(obtainMessage(4, r));
        }

        public void sendShutdown() {
            sendMessage(obtainMessage(5));
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            int what = msg.what;
            RenderThread renderThread = this.mWeakRenderThread.get();
            if (renderThread != null) {
                switch (what) {
                    case 0:
                        renderThread.notifySurfaceCreated((Surface) msg.obj);
                        return;
                    case 1:
                        renderThread.notifySurfaceChanged(msg.arg1, msg.arg2);
                        return;
                    case 2:
                        renderThread.notifySurfaceDestroyed();
                        return;
                    case 3:
                        long timestamp = (msg.arg1 << 32) | (msg.arg2 & 4294967295L);
                        renderThread.notifyDoFrame(timestamp);
                        return;
                    case 4:
                        renderThread.notifyDoEvent((Runnable) msg.obj);
                        return;
                    case 5:
                        renderThread.shutdown();
                        return;
                    default:
                        throw new RuntimeException("unknown message " + what);
                }
            }
        }

        private boolean isAlive() {
            RenderThread renderThread;
            return (this.mWeakRenderThread == null || (renderThread = this.mWeakRenderThread.get()) == null || !renderThread.isAlive()) ? false : true;
        }
    }

    /* loaded from: classes2.dex */
    public static class RenderTexture {
        private static final String TAG = "RenderTexture";
        private Renderer mRenderer;
        private SurfaceTexture mSurfaceTexture;
        private int mTextureId;
        private boolean mUpdateSurface = false;

        public void setRenderer(Renderer renderer) {
            this.mRenderer = renderer;
        }

        public void create(int textureId) {
            Log.v(TAG, "create " + textureId);
            this.mTextureId = textureId;
            this.mSurfaceTexture = new SurfaceTexture(textureId);
            this.mSurfaceTexture.setOnFrameAvailableListener(new SurfaceTexture.OnFrameAvailableListener() { // from class: com.vk.media.utils.RenderHelpers.RenderTexture.1
                @Override // android.graphics.SurfaceTexture.OnFrameAvailableListener
                public void onFrameAvailable(SurfaceTexture texture) {
                    synchronized (this) {
                        RenderTexture.this.mUpdateSurface = true;
                        if (RenderTexture.this.mRenderer != null) {
                            RenderTexture.this.mRenderer.draw();
                        }
                    }
                }
            });
        }

        public void update(float[] transformMatrix) {
            synchronized (this) {
                if (this.mUpdateSurface) {
                    this.mSurfaceTexture.updateTexImage();
                    if (transformMatrix != null) {
                        this.mSurfaceTexture.getTransformMatrix(transformMatrix);
                    }
                    this.mUpdateSurface = false;
                }
            }
        }

        public int getTextureId() {
            return this.mTextureId;
        }

        public long getTimestamp() {
            if (this.mSurfaceTexture != null) {
                return this.mSurfaceTexture.getTimestamp();
            }
            return 0L;
        }

        public void release() {
            synchronized (this) {
                if (this.mSurfaceTexture != null) {
                    this.mSurfaceTexture.setOnFrameAvailableListener(null);
                    this.mSurfaceTexture = null;
                }
                this.mUpdateSurface = false;
                Log.d(TAG, "texture released!");
            }
        }

        public SurfaceTexture texture() {
            if (this.mSurfaceTexture == null) {
                Log.w(TAG, "Warning! request empty texture!");
            }
            return this.mSurfaceTexture;
        }
    }

    /* loaded from: classes2.dex */
    public static class Size {
        public int mHeight;
        public int mWidth;

        public Size(int w, int h) {
            this.mWidth = w;
            this.mHeight = h;
        }
    }
}
