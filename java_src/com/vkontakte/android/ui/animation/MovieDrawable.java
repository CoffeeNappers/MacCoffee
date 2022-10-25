package com.vkontakte.android.ui.animation;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.Nullable;
import com.vk.medianative.MediaAnimationPlayer;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.background.WorkerThread;
import com.vkontakte.android.functions.VoidF1;
/* loaded from: classes3.dex */
public class MovieDrawable extends BitmapDrawable implements Animatable {
    private Runnable mInvalidate;
    private MediaAnimationPlayer.Listener mListener;
    private MediaAnimationPlayer mPlayer;
    private Runnable mReady;
    private VoidF1<MovieDrawable> mReadyCallback;
    private final WorkerThread mWorkerThread;

    public MovieDrawable(String path, int resolution, boolean repeat) {
        this.mWorkerThread = new WorkerThread("Gif decoder #" + hashCode());
        this.mListener = new MediaAnimationPlayer.Listener() { // from class: com.vkontakte.android.ui.animation.MovieDrawable.1
            @Override // com.vk.medianative.MediaAnimationPlayer.Listener
            public void onPrepared() {
                ViewUtils.post(MovieDrawable.this.mReady);
            }

            @Override // com.vk.medianative.MediaAnimationPlayer.Listener
            public void onDraw(long delay) {
                MovieDrawable.this.mWorkerThread.postRunnable(MovieDrawable.this.mPlayer, delay);
            }

            @Override // com.vk.medianative.MediaAnimationPlayer.Listener
            public void onRedraw() {
                ViewUtils.post(MovieDrawable.this.mInvalidate);
            }

            @Override // com.vk.medianative.MediaAnimationPlayer.Listener
            public void onComplete() {
                if (MovieDrawable.this.mWorkerThread != null) {
                    MovieDrawable.this.mWorkerThread.interrupt();
                }
            }
        };
        this.mInvalidate = new Runnable() { // from class: com.vkontakte.android.ui.animation.MovieDrawable.2
            @Override // java.lang.Runnable
            public void run() {
                MovieDrawable.this.invalidateSelf();
            }
        };
        this.mReady = new Runnable() { // from class: com.vkontakte.android.ui.animation.MovieDrawable.3
            @Override // java.lang.Runnable
            public void run() {
                if (MovieDrawable.this.mReadyCallback != null) {
                    MovieDrawable.this.mReadyCallback.f(MovieDrawable.this);
                }
            }
        };
        this.mPlayer = new MediaAnimationPlayer(path, resolution, repeat);
        this.mPlayer.setListener(this.mListener);
        this.mWorkerThread.start();
    }

    public MovieDrawable(String path) {
        this(path, true);
    }

    public MovieDrawable(String path, boolean repeat) {
        this(path, -1, repeat);
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public int getOpacity() {
        return -2;
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.mPlayer.getHeight();
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.mPlayer.getWidth();
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        super.draw(canvas);
        if (isRunning()) {
            this.mPlayer.draw(canvas, getBounds());
            return;
        }
        Bitmap bitmap = getRenderingBitmap();
        if (bitmap != null) {
            canvas.drawBitmap(bitmap, (Rect) null, getBounds(), (Paint) null);
        }
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        if (!this.mPlayer.isRunning()) {
            this.mPlayer.start();
            this.mWorkerThread.postRunnable(this.mPlayer);
        }
    }

    public int getPosition() {
        return this.mPlayer.getPosition();
    }

    public void seek(int position) {
        this.mPlayer.seek(position);
    }

    @Nullable
    public Bitmap getRenderingBitmap() {
        return this.mPlayer.getRenderingBitmap();
    }

    protected void finalize() throws Throwable {
        recycle();
        super.finalize();
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        this.mPlayer.stop();
        this.mWorkerThread.removeCallbacks(this.mPlayer);
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return this.mPlayer.isRunning();
    }

    public boolean isReady() {
        return this.mPlayer.isReady();
    }

    public void setReadyCallback(VoidF1<MovieDrawable> callback) {
        this.mReadyCallback = callback;
    }

    public void recycle() {
        this.mPlayer.recycle();
    }
}
