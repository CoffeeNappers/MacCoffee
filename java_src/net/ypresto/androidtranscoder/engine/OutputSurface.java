package net.ypresto.androidtranscoder.engine;

import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.view.Surface;
/* loaded from: classes3.dex */
class OutputSurface implements SurfaceTexture.OnFrameAvailableListener {
    private static final String TAG = "OutputSurface";
    private static final boolean VERBOSE = false;
    private boolean mFrameAvailable;
    private Surface mSurface;
    private SurfaceTexture mSurfaceTexture;
    private TextureRender mTextureRender;
    private EGLDisplay mEGLDisplay = EGL14.EGL_NO_DISPLAY;
    private EGLContext mEGLContext = EGL14.EGL_NO_CONTEXT;
    private EGLSurface mEGLSurface = EGL14.EGL_NO_SURFACE;
    private Object mFrameSyncObject = new Object();

    public OutputSurface(int width, int height) {
        if (width <= 0 || height <= 0) {
            throw new IllegalArgumentException();
        }
        eglSetup(width, height);
        makeCurrent();
        setup();
    }

    public OutputSurface() {
        setup();
    }

    private void setup() {
        this.mTextureRender = new TextureRender();
        this.mTextureRender.surfaceCreated();
        this.mSurfaceTexture = new SurfaceTexture(this.mTextureRender.getTextureId());
        this.mSurfaceTexture.setOnFrameAvailableListener(this);
        this.mSurface = new Surface(this.mSurfaceTexture);
    }

    private void eglSetup(int width, int height) {
        this.mEGLDisplay = EGL14.eglGetDisplay(0);
        if (this.mEGLDisplay == EGL14.EGL_NO_DISPLAY) {
            throw new RuntimeException("unable to get EGL14 display");
        }
        int[] version = new int[2];
        if (!EGL14.eglInitialize(this.mEGLDisplay, version, 0, version, 1)) {
            this.mEGLDisplay = null;
            throw new RuntimeException("unable to initialize EGL14");
        }
        int[] attribList = {12324, 8, 12323, 8, 12322, 8, 12352, 4, 12339, 1, 12344};
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
        int[] surfaceAttribs = {12375, width, 12374, height, 12344};
        this.mEGLSurface = EGL14.eglCreatePbufferSurface(this.mEGLDisplay, configs[0], surfaceAttribs, 0);
        checkEglError("eglCreatePbufferSurface");
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
        this.mTextureRender = null;
        this.mSurface = null;
        this.mSurfaceTexture = null;
    }

    public void makeCurrent() {
        if (!EGL14.eglMakeCurrent(this.mEGLDisplay, this.mEGLSurface, this.mEGLSurface, this.mEGLContext)) {
            throw new RuntimeException("eglMakeCurrent failed");
        }
    }

    public Surface getSurface() {
        return this.mSurface;
    }

    public void changeFragmentShader(String fragmentShader) {
        this.mTextureRender.changeFragmentShader(fragmentShader);
    }

    public void awaitNewImage() {
        synchronized (this.mFrameSyncObject) {
            do {
                if (!this.mFrameAvailable) {
                    try {
                        this.mFrameSyncObject.wait(10000L);
                    } catch (InterruptedException ie) {
                        throw new RuntimeException(ie);
                    }
                } else {
                    this.mFrameAvailable = false;
                }
            } while (this.mFrameAvailable);
            throw new RuntimeException("Surface frame wait timed out");
        }
        this.mTextureRender.checkGlError("before updateTexImage");
        this.mSurfaceTexture.updateTexImage();
    }

    public boolean checkForNewImage(int timeoutMs) {
        synchronized (this.mFrameSyncObject) {
            do {
                if (!this.mFrameAvailable) {
                    try {
                        this.mFrameSyncObject.wait(timeoutMs);
                    } catch (InterruptedException ie) {
                        throw new RuntimeException(ie);
                    }
                } else {
                    this.mFrameAvailable = false;
                    this.mTextureRender.checkGlError("before updateTexImage");
                    this.mSurfaceTexture.updateTexImage();
                    return true;
                }
            } while (this.mFrameAvailable);
            return false;
        }
    }

    public void drawImage() {
        this.mTextureRender.drawFrame(this.mSurfaceTexture);
    }

    @Override // android.graphics.SurfaceTexture.OnFrameAvailableListener
    public void onFrameAvailable(SurfaceTexture st) {
        synchronized (this.mFrameSyncObject) {
            if (this.mFrameAvailable) {
                throw new RuntimeException("mFrameAvailable already set, frame could be dropped");
            }
            this.mFrameAvailable = true;
            this.mFrameSyncObject.notifyAll();
        }
    }

    private void checkEglError(String msg) {
        int error = EGL14.eglGetError();
        if (error != 12288) {
            throw new RuntimeException(msg + ": EGL error: 0x" + Integer.toHexString(error));
        }
    }
}
