package com.vk.media.utils.grafika;

import android.graphics.SurfaceTexture;
import android.view.Surface;
/* loaded from: classes2.dex */
public class WindowSurface extends EglSurfaceBase {
    private boolean mReleaseSurface;
    private Surface mSurface;

    public WindowSurface(EglCore eglCore, Surface surface, boolean releaseSurface) {
        super(eglCore);
        createWindowSurface(surface);
        this.mSurface = surface;
        this.mReleaseSurface = releaseSurface;
    }

    public WindowSurface(EglCore eglCore, SurfaceTexture surfaceTexture) {
        super(eglCore);
        createWindowSurface(surfaceTexture);
    }

    public void release() {
        releaseEglSurface();
        if (this.mSurface != null) {
            if (this.mReleaseSurface) {
                this.mSurface.release();
            }
            this.mSurface = null;
        }
    }

    public void recreate(EglCore newEglCore) {
        if (this.mSurface == null) {
            throw new RuntimeException("not yet implemented for SurfaceTexture");
        }
        this.mEglCore = newEglCore;
        createWindowSurface(this.mSurface);
    }
}
