package com.wmspanel.libstream.gles;

import android.annotation.TargetApi;
import android.opengl.GLES20;
import android.opengl.Matrix;
import android.util.Log;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.gcm.Task;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
@TargetApi(18)
/* loaded from: classes3.dex */
public class GlUtil {
    public static final float[] IDENTITY_MATRIX = new float[16];
    private static final int SIZEOF_FLOAT = 4;
    public static final String TAG = "GLUtil";

    static {
        Matrix.setIdentityM(IDENTITY_MATRIX, 0);
    }

    private GlUtil() {
    }

    public static int createProgram(String vertexSource, String fragmentSource) {
        int loadShader;
        int loadShader2 = loadShader(35633, vertexSource);
        if (loadShader2 == 0 || (loadShader = loadShader(35632, fragmentSource)) == 0) {
            return 0;
        }
        int glCreateProgram = GLES20.glCreateProgram();
        checkGlError("glCreateProgram");
        if (glCreateProgram == 0) {
            Log.e(TAG, "Could not create program");
        }
        GLES20.glAttachShader(glCreateProgram, loadShader2);
        checkGlError("glAttachShader");
        GLES20.glAttachShader(glCreateProgram, loadShader);
        checkGlError("glAttachShader");
        GLES20.glLinkProgram(glCreateProgram);
        int[] iArr = new int[1];
        GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
        if (iArr[0] == 1) {
            return glCreateProgram;
        }
        Log.e(TAG, "Could not link program: ");
        Log.e(TAG, GLES20.glGetProgramInfoLog(glCreateProgram));
        GLES20.glDeleteProgram(glCreateProgram);
        return 0;
    }

    public static int loadShader(int shaderType, String source) {
        int glCreateShader = GLES20.glCreateShader(shaderType);
        checkGlError("glCreateShader type=" + shaderType);
        GLES20.glShaderSource(glCreateShader, source);
        GLES20.glCompileShader(glCreateShader);
        int[] iArr = new int[1];
        GLES20.glGetShaderiv(glCreateShader, 35713, iArr, 0);
        if (iArr[0] == 0) {
            Log.e(TAG, "Could not compile shader " + shaderType + ":");
            Log.e(TAG, MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + GLES20.glGetShaderInfoLog(glCreateShader));
            GLES20.glDeleteShader(glCreateShader);
            return 0;
        }
        return glCreateShader;
    }

    public static void checkGlError(String op) {
        int glGetError;
        if (GLES20.glGetError() != 0) {
            String str = op + ": glError 0x" + Integer.toHexString(glGetError);
            Log.e(TAG, str);
            throw new RuntimeException(str);
        }
    }

    public static void checkLocation(int location, String label) {
        if (location < 0) {
            throw new RuntimeException("Unable to locate '" + label + "' in program");
        }
    }

    public static int createImageTexture(ByteBuffer data, int width, int height, int format) {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        int i = iArr[0];
        checkGlError("glGenTextures");
        GLES20.glBindTexture(3553, i);
        GLES20.glTexParameteri(3553, 10241, 9729);
        GLES20.glTexParameteri(3553, Task.EXTRAS_LIMIT_BYTES, 9729);
        checkGlError("loadImageTexture");
        GLES20.glTexImage2D(3553, 0, format, width, height, 0, format, 5121, data);
        checkGlError("loadImageTexture");
        return i;
    }

    public static FloatBuffer createFloatBuffer(float[] coords) {
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(coords.length * 4);
        allocateDirect.order(ByteOrder.nativeOrder());
        FloatBuffer asFloatBuffer = allocateDirect.asFloatBuffer();
        asFloatBuffer.put(coords);
        asFloatBuffer.position(0);
        return asFloatBuffer;
    }

    public static void logVersionInfo() {
        Log.i(TAG, "vendor  : " + GLES20.glGetString(7936));
        Log.i(TAG, "renderer: " + GLES20.glGetString(7937));
        Log.i(TAG, "version : " + GLES20.glGetString(7938));
    }
}
