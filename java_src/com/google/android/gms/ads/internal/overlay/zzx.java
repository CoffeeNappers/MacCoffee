package com.google.android.gms.ads.internal.overlay;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.support.annotation.Nullable;
import android.util.Log;
import com.google.android.gms.ads.internal.overlay.zzw;
import com.google.android.gms.gcm.Task;
import com.google.android.gms.internal.zzdn;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.concurrent.CountDownLatch;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
@zzji
@TargetApi(14)
/* loaded from: classes.dex */
public class zzx extends Thread implements SurfaceTexture.OnFrameAvailableListener, zzw.zza {
    private static final float[] zzcdd = {-1.0f, -1.0f, -1.0f, 1.0f, -1.0f, -1.0f, -1.0f, 1.0f, -1.0f, 1.0f, 1.0f, -1.0f};
    private int zzakh;
    private int zzaki;
    private final float[] zzccz;
    private final zzw zzcde;
    private final float[] zzcdf;
    private final float[] zzcdg;
    private final float[] zzcdh;
    private final float[] zzcdi;
    private final float[] zzcdj;
    private final float[] zzcdk;
    private float zzcdl;
    private float zzcdm;
    private float zzcdn;
    private SurfaceTexture zzcdo;
    private SurfaceTexture zzcdp;
    private int zzcdq;
    private int zzcdr;
    private int zzcds;
    private FloatBuffer zzcdt;
    private final CountDownLatch zzcdu;
    private final Object zzcdv;
    private EGL10 zzcdw;
    private EGLDisplay zzcdx;
    private EGLContext zzcdy;
    private EGLSurface zzcdz;
    private volatile boolean zzcea;
    private volatile boolean zzceb;

    public zzx(Context context) {
        super("SphericalVideoProcessor");
        this.zzcdt = ByteBuffer.allocateDirect(zzcdd.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        this.zzcdt.put(zzcdd).position(0);
        this.zzccz = new float[9];
        this.zzcdf = new float[9];
        this.zzcdg = new float[9];
        this.zzcdh = new float[9];
        this.zzcdi = new float[9];
        this.zzcdj = new float[9];
        this.zzcdk = new float[9];
        this.zzcdl = Float.NaN;
        this.zzcde = new zzw(context);
        this.zzcde.zza(this);
        this.zzcdu = new CountDownLatch(1);
        this.zzcdv = new Object();
    }

    private void zza(float[] fArr, float f) {
        fArr[0] = 1.0f;
        fArr[1] = 0.0f;
        fArr[2] = 0.0f;
        fArr[3] = 0.0f;
        fArr[4] = (float) Math.cos(f);
        fArr[5] = (float) (-Math.sin(f));
        fArr[6] = 0.0f;
        fArr[7] = (float) Math.sin(f);
        fArr[8] = (float) Math.cos(f);
    }

    private void zza(float[] fArr, float[] fArr2, float[] fArr3) {
        fArr[0] = (fArr2[0] * fArr3[0]) + (fArr2[1] * fArr3[3]) + (fArr2[2] * fArr3[6]);
        fArr[1] = (fArr2[0] * fArr3[1]) + (fArr2[1] * fArr3[4]) + (fArr2[2] * fArr3[7]);
        fArr[2] = (fArr2[0] * fArr3[2]) + (fArr2[1] * fArr3[5]) + (fArr2[2] * fArr3[8]);
        fArr[3] = (fArr2[3] * fArr3[0]) + (fArr2[4] * fArr3[3]) + (fArr2[5] * fArr3[6]);
        fArr[4] = (fArr2[3] * fArr3[1]) + (fArr2[4] * fArr3[4]) + (fArr2[5] * fArr3[7]);
        fArr[5] = (fArr2[3] * fArr3[2]) + (fArr2[4] * fArr3[5]) + (fArr2[5] * fArr3[8]);
        fArr[6] = (fArr2[6] * fArr3[0]) + (fArr2[7] * fArr3[3]) + (fArr2[8] * fArr3[6]);
        fArr[7] = (fArr2[6] * fArr3[1]) + (fArr2[7] * fArr3[4]) + (fArr2[8] * fArr3[7]);
        fArr[8] = (fArr2[6] * fArr3[2]) + (fArr2[7] * fArr3[5]) + (fArr2[8] * fArr3[8]);
    }

    private float[] zza(float[] fArr, float[] fArr2) {
        return new float[]{(fArr[0] * fArr2[0]) + (fArr[1] * fArr2[1]) + (fArr[2] * fArr2[2]), (fArr[3] * fArr2[0]) + (fArr[4] * fArr2[1]) + (fArr[5] * fArr2[2]), (fArr[6] * fArr2[0]) + (fArr[7] * fArr2[1]) + (fArr[8] * fArr2[2])};
    }

    private void zzb(float[] fArr, float f) {
        fArr[0] = (float) Math.cos(f);
        fArr[1] = (float) (-Math.sin(f));
        fArr[2] = 0.0f;
        fArr[3] = (float) Math.sin(f);
        fArr[4] = (float) Math.cos(f);
        fArr[5] = 0.0f;
        fArr[6] = 0.0f;
        fArr[7] = 0.0f;
        fArr[8] = 1.0f;
    }

    private float zzc(float[] fArr) {
        float[] zza = zza(fArr, new float[]{0.0f, 1.0f, 0.0f});
        return ((float) Math.atan2(zza[1], zza[0])) - 1.5707964f;
    }

    private int zzc(int i, String str) {
        int glCreateShader = GLES20.glCreateShader(i);
        zzcf("createShader");
        if (glCreateShader != 0) {
            GLES20.glShaderSource(glCreateShader, str);
            zzcf("shaderSource");
            GLES20.glCompileShader(glCreateShader);
            zzcf("compileShader");
            int[] iArr = new int[1];
            GLES20.glGetShaderiv(glCreateShader, 35713, iArr, 0);
            zzcf("getShaderiv");
            if (iArr[0] == 0) {
                Log.e("SphericalVideoRenderer", new StringBuilder(37).append("Could not compile shader ").append(i).append(":").toString());
                Log.e("SphericalVideoRenderer", GLES20.glGetShaderInfoLog(glCreateShader));
                GLES20.glDeleteShader(glCreateShader);
                zzcf("deleteShader");
                return 0;
            }
        }
        return glCreateShader;
    }

    private void zzcf(String str) {
        int glGetError = GLES20.glGetError();
        if (glGetError != 0) {
            Log.e("SphericalVideoRenderer", new StringBuilder(String.valueOf(str).length() + 21).append(str).append(": glError ").append(glGetError).toString());
        }
    }

    private void zzqv() {
        GLES20.glViewport(0, 0, this.zzakh, this.zzaki);
        zzcf("viewport");
        int glGetUniformLocation = GLES20.glGetUniformLocation(this.zzcdq, "uFOVx");
        int glGetUniformLocation2 = GLES20.glGetUniformLocation(this.zzcdq, "uFOVy");
        if (this.zzakh > this.zzaki) {
            GLES20.glUniform1f(glGetUniformLocation, 0.87266463f);
            GLES20.glUniform1f(glGetUniformLocation2, (this.zzaki * 0.87266463f) / this.zzakh);
            return;
        }
        GLES20.glUniform1f(glGetUniformLocation, (this.zzakh * 0.87266463f) / this.zzaki);
        GLES20.glUniform1f(glGetUniformLocation2, 0.87266463f);
    }

    private int zzqx() {
        int zzc;
        int zzc2 = zzc(35633, zzra());
        if (zzc2 == 0 || (zzc = zzc(35632, zzrb())) == 0) {
            return 0;
        }
        int glCreateProgram = GLES20.glCreateProgram();
        zzcf("createProgram");
        if (glCreateProgram != 0) {
            GLES20.glAttachShader(glCreateProgram, zzc2);
            zzcf("attachShader");
            GLES20.glAttachShader(glCreateProgram, zzc);
            zzcf("attachShader");
            GLES20.glLinkProgram(glCreateProgram);
            zzcf("linkProgram");
            int[] iArr = new int[1];
            GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
            zzcf("getProgramiv");
            if (iArr[0] != 1) {
                Log.e("SphericalVideoRenderer", "Could not link program: ");
                Log.e("SphericalVideoRenderer", GLES20.glGetProgramInfoLog(glCreateProgram));
                GLES20.glDeleteProgram(glCreateProgram);
                zzcf("deleteProgram");
                return 0;
            }
            GLES20.glValidateProgram(glCreateProgram);
            zzcf("validateProgram");
        }
        return glCreateProgram;
    }

    @Nullable
    private EGLConfig zzqz() {
        int[] iArr = new int[1];
        EGLConfig[] eGLConfigArr = new EGLConfig[1];
        if (this.zzcdw.eglChooseConfig(this.zzcdx, new int[]{12352, 4, 12324, 8, 12323, 8, 12322, 8, 12325, 16, 12344}, eGLConfigArr, 1, iArr) && iArr[0] > 0) {
            return eGLConfigArr[0];
        }
        return null;
    }

    private String zzra() {
        zzdn<String> zzdnVar = zzdr.zzbgo;
        return !zzdnVar.get().equals(zzdnVar.zzlp()) ? zzdnVar.get() : "attribute highp vec3 aPosition;varying vec3 pos;void main() {  gl_Position = vec4(aPosition, 1.0);  pos = aPosition;}";
    }

    private String zzrb() {
        zzdn<String> zzdnVar = zzdr.zzbgp;
        return !zzdnVar.get().equals(zzdnVar.zzlp()) ? zzdnVar.get() : "#extension GL_OES_EGL_image_external : require\n#define INV_PI 0.3183\nprecision highp float;varying vec3 pos;uniform samplerExternalOES uSplr;uniform mat3 uVMat;uniform float uFOVx;uniform float uFOVy;void main() {  vec3 ray = vec3(pos.x * tan(uFOVx), pos.y * tan(uFOVy), -1);  ray = (uVMat * ray).xyz;  ray = normalize(ray);  vec2 texCrd = vec2(    0.5 + atan(ray.x, - ray.z) * INV_PI * 0.5, acos(ray.y) * INV_PI);  gl_FragColor = vec4(texture2D(uSplr, texCrd).xyz, 1.0);}";
    }

    @Override // android.graphics.SurfaceTexture.OnFrameAvailableListener
    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        this.zzcds++;
        synchronized (this.zzcdv) {
            this.zzcdv.notifyAll();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v0, types: [android.graphics.SurfaceTexture, android.graphics.SurfaceTexture$OnFrameAvailableListener] */
    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        boolean z = true;
        if (this.zzcdp == null) {
            zzkx.e("SphericalVideoProcessor started with no output texture.");
            this.zzcdu.countDown();
            return;
        }
        boolean zzqy = zzqy();
        int zzqw = zzqw();
        if (this.zzcdq == 0) {
            z = false;
        }
        if (!zzqy || !z) {
            String valueOf = String.valueOf(GLUtils.getEGLErrorString(this.zzcdw.eglGetError()));
            String concat = valueOf.length() != 0 ? "EGL initialization failed: ".concat(valueOf) : new String("EGL initialization failed: ");
            zzkx.e(concat);
            com.google.android.gms.ads.internal.zzu.zzgq().zza(new Throwable(concat), "SphericalVideoProcessor.run.1");
            zzrc();
            this.zzcdu.countDown();
            return;
        }
        this.zzcdo = new SurfaceTexture(zzqw);
        this.zzcdo.setOnFrameAvailableListener(this);
        this.zzcdu.countDown();
        this.zzcde.start();
        try {
            this.zzcea = true;
            while (!this.zzceb) {
                zzqu();
                if (this.zzcea) {
                    zzqv();
                    this.zzcea = false;
                }
                try {
                    synchronized (this.zzcdv) {
                        if (!this.zzceb && !this.zzcea && this.zzcds == 0) {
                            this.zzcdv.wait();
                        }
                    }
                } catch (InterruptedException e) {
                }
            }
        } catch (IllegalStateException e2) {
            zzkx.zzdi("SphericalVideoProcessor halted unexpectedly.");
        } finally {
            this.zzcde.stop();
            this.zzcdo.setOnFrameAvailableListener(null);
            this.zzcdo = null;
            zzrc();
        }
    }

    public void zza(SurfaceTexture surfaceTexture, int i, int i2) {
        this.zzakh = i;
        this.zzaki = i2;
        this.zzcdp = surfaceTexture;
    }

    public void zzb(float f, float f2) {
        float f3;
        float f4;
        if (this.zzakh > this.zzaki) {
            f3 = (1.7453293f * f) / this.zzakh;
            f4 = (1.7453293f * f2) / this.zzakh;
        } else {
            f3 = (1.7453293f * f) / this.zzaki;
            f4 = (1.7453293f * f2) / this.zzaki;
        }
        this.zzcdm -= f3;
        this.zzcdn -= f4;
        if (this.zzcdn < -1.5707964f) {
            this.zzcdn = -1.5707964f;
        }
        if (this.zzcdn > 1.5707964f) {
            this.zzcdn = 1.5707964f;
        }
    }

    public void zzi(int i, int i2) {
        synchronized (this.zzcdv) {
            this.zzakh = i;
            this.zzaki = i2;
            this.zzcea = true;
            this.zzcdv.notifyAll();
        }
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzw.zza
    public void zzpr() {
        synchronized (this.zzcdv) {
            this.zzcdv.notifyAll();
        }
    }

    public void zzqs() {
        synchronized (this.zzcdv) {
            this.zzceb = true;
            this.zzcdp = null;
            this.zzcdv.notifyAll();
        }
    }

    public SurfaceTexture zzqt() {
        if (this.zzcdp == null) {
            return null;
        }
        try {
            this.zzcdu.await();
        } catch (InterruptedException e) {
        }
        return this.zzcdo;
    }

    void zzqu() {
        while (this.zzcds > 0) {
            this.zzcdo.updateTexImage();
            this.zzcds--;
        }
        if (this.zzcde.zzb(this.zzccz)) {
            if (Float.isNaN(this.zzcdl)) {
                this.zzcdl = -zzc(this.zzccz);
            }
            zzb(this.zzcdj, this.zzcdl + this.zzcdm);
        } else {
            zza(this.zzccz, -1.5707964f);
            zzb(this.zzcdj, this.zzcdm);
        }
        zza(this.zzcdf, 1.5707964f);
        zza(this.zzcdg, this.zzcdj, this.zzcdf);
        zza(this.zzcdh, this.zzccz, this.zzcdg);
        zza(this.zzcdi, this.zzcdn);
        zza(this.zzcdk, this.zzcdi, this.zzcdh);
        GLES20.glUniformMatrix3fv(this.zzcdr, 1, false, this.zzcdk, 0);
        GLES20.glDrawArrays(5, 0, 4);
        zzcf("drawArrays");
        GLES20.glFinish();
        this.zzcdw.eglSwapBuffers(this.zzcdx, this.zzcdz);
    }

    int zzqw() {
        this.zzcdq = zzqx();
        GLES20.glUseProgram(this.zzcdq);
        zzcf("useProgram");
        int glGetAttribLocation = GLES20.glGetAttribLocation(this.zzcdq, "aPosition");
        GLES20.glVertexAttribPointer(glGetAttribLocation, 3, 5126, false, 12, (Buffer) this.zzcdt);
        zzcf("vertexAttribPointer");
        GLES20.glEnableVertexAttribArray(glGetAttribLocation);
        zzcf("enableVertexAttribArray");
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        zzcf("genTextures");
        int i = iArr[0];
        GLES20.glBindTexture(36197, i);
        zzcf("bindTextures");
        GLES20.glTexParameteri(36197, Task.EXTRAS_LIMIT_BYTES, 9729);
        zzcf("texParameteri");
        GLES20.glTexParameteri(36197, 10241, 9729);
        zzcf("texParameteri");
        GLES20.glTexParameteri(36197, 10242, 33071);
        zzcf("texParameteri");
        GLES20.glTexParameteri(36197, 10243, 33071);
        zzcf("texParameteri");
        this.zzcdr = GLES20.glGetUniformLocation(this.zzcdq, "uVMat");
        GLES20.glUniformMatrix3fv(this.zzcdr, 1, false, new float[]{1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f}, 0);
        return i;
    }

    boolean zzqy() {
        EGLConfig zzqz;
        this.zzcdw = (EGL10) EGLContext.getEGL();
        this.zzcdx = this.zzcdw.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
        if (this.zzcdx == EGL10.EGL_NO_DISPLAY) {
            return false;
        }
        if (this.zzcdw.eglInitialize(this.zzcdx, new int[2]) && (zzqz = zzqz()) != null) {
            this.zzcdy = this.zzcdw.eglCreateContext(this.zzcdx, zzqz, EGL10.EGL_NO_CONTEXT, new int[]{12440, 2, 12344});
            if (this.zzcdy == null || this.zzcdy == EGL10.EGL_NO_CONTEXT) {
                return false;
            }
            this.zzcdz = this.zzcdw.eglCreateWindowSurface(this.zzcdx, zzqz, this.zzcdp, null);
            if (this.zzcdz == null || this.zzcdz == EGL10.EGL_NO_SURFACE) {
                return false;
            }
            return this.zzcdw.eglMakeCurrent(this.zzcdx, this.zzcdz, this.zzcdz, this.zzcdy);
        }
        return false;
    }

    boolean zzrc() {
        boolean z = false;
        if (this.zzcdz != null && this.zzcdz != EGL10.EGL_NO_SURFACE) {
            z = this.zzcdw.eglMakeCurrent(this.zzcdx, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT) | false | this.zzcdw.eglDestroySurface(this.zzcdx, this.zzcdz);
            this.zzcdz = null;
        }
        if (this.zzcdy != null) {
            z |= this.zzcdw.eglDestroyContext(this.zzcdx, this.zzcdy);
            this.zzcdy = null;
        }
        if (this.zzcdx != null) {
            boolean eglTerminate = z | this.zzcdw.eglTerminate(this.zzcdx);
            this.zzcdx = null;
            return eglTerminate;
        }
        return z;
    }
}
