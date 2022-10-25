package net.ypresto.androidtranscoder.engine;

import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.view.Surface;
/* loaded from: classes3.dex */
class InputSurface {
    private static final int EGL_RECORDABLE_ANDROID = 12610;
    private static final String TAG = "InputSurface";
    private Surface mSurface;
    private EGLDisplay mEGLDisplay = EGL14.EGL_NO_DISPLAY;
    private EGLContext mEGLContext = EGL14.EGL_NO_CONTEXT;
    private EGLSurface mEGLSurface = EGL14.EGL_NO_SURFACE;

    public InputSurface(Surface surface) {
        if (surface == null) {
            throw new NullPointerException();
        }
        this.mSurface = surface;
        eglSetup();
    }

    private void eglSetup() {
        this.mEGLDisplay = EGL14.eglGetDisplay(0);
        if (this.mEGLDisplay == EGL14.EGL_NO_DISPLAY) {
            throw new RuntimeException("unable to get EGL14 display");
        }
        int[] version = new int[2];
        if (!EGL14.eglInitialize(this.mEGLDisplay, version, 0, version, 1)) {
            this.mEGLDisplay = null;
            throw new RuntimeException("unable to initialize EGL14");
        }
        int[] attribList = {12324, 8, 12323, 8, 12322, 8, 12352, 4, EGL_RECORDABLE_ANDROID, 1, 12344};
        EGLConfig[] configs = new EGLConfig[1];
        int[] numConfigs = new int[1];
        if (!EGL14.eglChooseConfig(this.mEGLDisplay, attribList, 0, configs, 0, configs.length, numConfigs, 0)) {
            throw new RuntimeException("unable to find RGB888+recordable ES2 EGL config");
        }
        int[] attrib_list = {12440, 2, 12344};
        this.mEGLContext = EGL14.eglCreateContext(this.mEGLDisplay, configs[0], EGL14.EGL_NO_CONTEXT, attrib_list, 0);
        checkEglError("eglCreateContext");
        if (this.mEGLContext == null) {
            throw new RuntimeException("null context");
        }
        int[] surfaceAttribs = {12344};
        this.mEGLSurface = EGL14.eglCreateWindowSurface(this.mEGLDisplay, configs[0], this.mSurface, surfaceAttribs, 0);
        checkEglError("eglCreateWindowSurface");
        if (this.mEGLSurface == null) {
            throw new RuntimeException("surface was null");
        }
    }

    public void release() {
        if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY) {
            EGL14.eglDestroySurface(this.mEGLDisplay, this.mEGLSurface);
            EGL14.eglDestroyContext(this.mEGLDisplay, this.mEGLContext);
            EGL14.eglReleaseThread();
            EGL14.eglTerminate(this.mEGLDisplay);
        }
        this.mSurface.release();
        this.mEGLDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEGLContext = EGL14.EGL_NO_CONTEXT;
        this.mEGLSurface = EGL14.EGL_NO_SURFACE;
        this.mSurface = null;
    }

    public void makeCurrent() {
        if (!EGL14.eglMakeCurrent(this.mEGLDisplay, this.mEGLSurface, this.mEGLSurface, this.mEGLContext)) {
            throw new RuntimeException("eglMakeCurrent failed");
        }
    }

    public void makeUnCurrent() {
        if (!EGL14.eglMakeCurrent(this.mEGLDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT)) {
            throw new RuntimeException("eglMakeCurrent failed");
        }
    }

    public boolean swapBuffers() {
        return EGL14.eglSwapBuffers(this.mEGLDisplay, this.mEGLSurface);
    }

    public Surface getSurface() {
        return this.mSurface;
    }

    public int getWidth() {
        int[] value = new int[1];
        EGL14.eglQuerySurface(this.mEGLDisplay, this.mEGLSurface, 12375, value, 0);
        return value[0];
    }

    public int getHeight() {
        int[] value = new int[1];
        EGL14.eglQuerySurface(this.mEGLDisplay, this.mEGLSurface, 12374, value, 0);
        return value[0];
    }

    public void setPresentationTime(long nsecs) {
        EGLExt.eglPresentationTimeANDROID(this.mEGLDisplay, this.mEGLSurface, nsecs);
    }

    private void checkEglError(String msg) {
        int error = EGL14.eglGetError();
        if (error != 12288) {
            throw new RuntimeException(msg + ": EGL error: 0x" + Integer.toHexString(error));
        }
    }
}
