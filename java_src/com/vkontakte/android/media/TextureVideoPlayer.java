package com.vkontakte.android.media;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.support.annotation.Nullable;
import android.view.TextureView;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.ui.widget.VideoTextureView;
/* loaded from: classes3.dex */
public abstract class TextureVideoPlayer extends AbsVideoPlayer implements VideoTextureView.OnVideoTextureCallback, TextureView.SurfaceTextureListener {
    static final String TAG = TextureVideoPlayer.class.getSimpleName();
    private boolean mHasDetachedFromPlayer;
    private boolean mHasDetachedFromWindow;
    private final Object mLock;
    private boolean mOwnSurfaceTexture;
    public SurfaceTexture mSurfaceTexture;

    public TextureVideoPlayer(Context context, VideoFile videoFile, String referrer) {
        super(context, videoFile, referrer);
        this.mLock = new Object();
        this.mOwnSurfaceTexture = true;
        this.mHasDetachedFromWindow = false;
        this.mHasDetachedFromPlayer = false;
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public void stopAndRelease() {
        synchronized (this.mLock) {
            this.mHasDetachedFromPlayer = true;
            if (this.mSurfaceTexture != null && this.mHasDetachedFromWindow && !this.mOwnSurfaceTexture) {
                this.mSurfaceTexture.release();
                this.mSurfaceTexture = null;
            }
        }
    }

    @Override // com.vkontakte.android.media.AbsVideoPlayer
    public final void setView(@Nullable VideoTextureView view) {
        if (view != this.renderView) {
            if (view != null) {
                view.setCallback(this);
                view.setSurfaceTextureListener(this);
                synchronized (this.mLock) {
                    this.mOwnSurfaceTexture = false;
                }
                SurfaceTexture texture = view.getSurfaceTexture();
                if (texture != null) {
                    onSurfaceTextureAvailable(texture, view.getWidth(), view.getHeight());
                }
            } else if (this.renderView != null) {
                SurfaceTexture texture2 = this.renderView.getSurfaceTexture();
                this.renderView.setSurfaceTextureListener(null);
                if (texture2 != null) {
                    onSurfaceTextureDestroyed(texture2);
                }
            }
            super.setView(view);
        }
    }

    public void onSurfaceTextureAvailable(SurfaceTexture texture, int width, int height) {
    }

    public boolean onSurfaceTextureDestroyed(SurfaceTexture texture) {
        boolean z;
        synchronized (this.mLock) {
            if (this.mHasDetachedFromPlayer) {
                this.mOwnSurfaceTexture = true;
            }
            if (!this.mOwnSurfaceTexture) {
                this.mSurfaceTexture = texture;
            }
            z = this.mOwnSurfaceTexture;
        }
        return z;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureUpdated(SurfaceTexture surface) {
    }

    @Override // com.vkontakte.android.ui.widget.VideoTextureView.OnVideoTextureCallback
    public void onDetachedFromWindow() {
        synchronized (this.mLock) {
            this.mHasDetachedFromWindow = true;
        }
    }
}
