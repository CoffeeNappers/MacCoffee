package com.vk.medianative;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.SystemClock;
import android.util.Log;
import com.vk.analytics.Analytics;
/* loaded from: classes2.dex */
public class MediaAnimationPlayer implements Runnable {
    private static final boolean DEBUG = false;
    private static final String TAG = MediaAnimationPlayer.class.getSimpleName();
    private int mHeight;
    private boolean mIsReady;
    private boolean mIsRecycled;
    private boolean mIsRunning;
    private Listener mListener;
    private long mNativePtr;
    private String mPath;
    private Bitmap mRenderingBitmap;
    private boolean mRepeat;
    private int mResolution;
    private int mWidth;
    private final Object mLock = new Object();
    private int mSeekTo = -1;
    private int mPositionMs = 0;
    private long fpsTime = 0;
    private long fps = 0;

    /* loaded from: classes2.dex */
    public interface Listener {
        void onComplete();

        void onDraw(long j);

        void onPrepared();

        void onRedraw();
    }

    public MediaAnimationPlayer(String path, int resolution, boolean repeat) {
        this.mResolution = -1;
        this.mPath = path;
        this.mRepeat = repeat;
        this.mResolution = resolution;
    }

    public void setListener(Listener listener) {
        this.mListener = listener;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public void draw(Canvas canvas, Rect bounds) {
        synchronized (this.mLock) {
            if (this.mNativePtr != 0 && this.mRenderingBitmap != null && !this.mIsRecycled && !this.mRenderingBitmap.isRecycled()) {
                canvas.drawBitmap(this.mRenderingBitmap, (Rect) null, bounds, (Paint) null);
            }
        }
    }

    public boolean start() {
        boolean z = true;
        synchronized (this.mLock) {
            if (this.mIsRunning) {
                z = false;
            } else {
                this.mIsRunning = true;
            }
        }
        return z;
    }

    public int getPosition() {
        int i;
        synchronized (this.mLock) {
            i = this.mPositionMs;
        }
        return i;
    }

    public void seek(int position) {
        synchronized (this.mLock) {
            this.mSeekTo = position;
        }
    }

    public Bitmap getRenderingBitmap() {
        return this.mRenderingBitmap;
    }

    protected void finalize() throws Throwable {
        recycle();
        super.finalize();
    }

    public void stop() {
        synchronized (this.mLock) {
            this.mIsRunning = false;
        }
    }

    public boolean isRunning() {
        return this.mIsRunning;
    }

    public boolean isReady() {
        return this.mIsReady;
    }

    public void recycle() {
        synchronized (this.mLock) {
            recycleInternal();
        }
    }

    private boolean create() {
        if (this.mNativePtr != 0) {
            return true;
        }
        this.mNativePtr = MediaNative.nativeAnimationPlayerCreate(this.mPath, this.mSeekTo, this.mResolution, this.mRepeat);
        this.mSeekTo = -1;
        if (this.mNativePtr == 0) {
            return false;
        }
        int size = MediaNative.nativeAnimationPlayerGetSize(this.mNativePtr);
        this.mWidth = size >> 16;
        this.mHeight = (short) size;
        if (this.mRenderingBitmap == null && this.mWidth > 0 && this.mHeight > 0) {
            this.mRenderingBitmap = Bitmap.createBitmap(this.mWidth, this.mHeight, Bitmap.Config.ARGB_8888);
        }
        return this.mRenderingBitmap != null;
    }

    private void releaseInternal() {
        if (this.mNativePtr != 0) {
            this.mIsRunning = false;
            this.mIsReady = false;
            if (this.mListener != null) {
                this.mListener.onComplete();
            }
            MediaNative.nativeAnimationPlayerRelease(this.mNativePtr);
            this.mNativePtr = 0L;
            if (this.mRenderingBitmap != null) {
                this.mRenderingBitmap.recycle();
                this.mRenderingBitmap = null;
            }
        }
    }

    private void recycleInternal() {
        if (this.mIsRunning) {
            this.mIsRunning = false;
            this.mIsRecycled = true;
            return;
        }
        releaseInternal();
    }

    private void decode() {
        if (this.mIsRecycled) {
            releaseInternal();
            return;
        }
        boolean created = false;
        try {
            if (this.mNativePtr == 0) {
                created = create();
            } else if (this.mSeekTo >= 0) {
                MediaNative.nativeAnimationPlayerSeek(this.mNativePtr, this.mSeekTo);
                this.mPositionMs = this.mSeekTo;
                this.mSeekTo = -1;
            }
            int previousPositionMs = this.mPositionMs;
            long start = SystemClock.uptimeMillis();
            if (this.mRenderingBitmap != null) {
                int positionMs = MediaNative.nativeAnimationPlayerDecode(this.mNativePtr, this.mRenderingBitmap);
                if (positionMs < 0) {
                    recycleInternal();
                }
                this.mPositionMs = positionMs;
                if (previousPositionMs == 0) {
                    previousPositionMs = this.mPositionMs;
                }
            }
            if (this.mListener == null) {
                return;
            }
            if (this.mIsRunning || this.mIsRecycled) {
                long time = SystemClock.uptimeMillis() - start;
                long next = (this.mPositionMs - previousPositionMs) - time;
                this.mListener.onDraw(Math.max(1L, next));
                if (this.mIsRunning) {
                    if (created) {
                        this.mIsReady = true;
                        this.mListener.onPrepared();
                    }
                    this.mListener.onRedraw();
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Decoding error", t);
            Analytics.getInstance();
            Analytics.log(MediaNative.dump());
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        synchronized (this.mLock) {
            decode();
        }
    }
}
