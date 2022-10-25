package com.vk.medianative;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Process;
import com.facebook.soloader.SoLoader;
import java.io.File;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Scanner;
/* loaded from: classes.dex */
public class MediaNative {
    private static boolean sMediaSupported = false;

    public static native long nativeAnimationPlayerCreate(String str, int i, int i2, boolean z);

    public static native int nativeAnimationPlayerDecode(long j, Bitmap bitmap);

    public static native int nativeAnimationPlayerGetSize(long j);

    public static native void nativeAnimationPlayerRelease(long j);

    public static native boolean nativeAnimationPlayerSeek(long j, int i);

    public static native long nativeAudioGetTotalPcmDuration();

    public static native byte[] nativeAudioGetWaveform(short[] sArr, int i);

    public static native int nativeAudioIsOpusFile(String str);

    public static native int nativeAudioOpenOpusFile(String str);

    public static native void nativeAudioReadOpusFile(ByteBuffer byteBuffer, int i, int[] iArr);

    public static native int nativeAudioSeekOpusFile(float f);

    public static native int nativeAudioStartRecord(String str);

    public static native void nativeAudioStopRecord();

    public static native int nativeAudioWriteFrame(ByteBuffer byteBuffer, int i);

    public static native void nativeProcessorDestroy();

    public static native long nativeProcessorDoFrame(byte[] bArr, int i, int i2, long j, int i3, int[] iArr, boolean z);

    public static native int nativeProcessorGetFPS();

    public static native int nativeProcessorGetVersion();

    public static native boolean nativeProcessorInit(String str, int i, int i2, boolean z);

    public static native boolean nativeProcessorLoad(String str, boolean z);

    public static boolean isMediaSupported() {
        return sMediaSupported;
    }

    public static void init(Context applicationContext) {
        SoLoader.init(applicationContext, false);
        loadLibrary("ffmpeg");
        loadLibrary("vkvideo");
        loadLibrary("vkaudio");
        loadLibrary("chronicle");
        if (Build.VERSION.SDK_INT >= 18) {
            try {
                if (!isX86()) {
                    loadLibrary("vkmedia");
                    sMediaSupported = true;
                }
            } catch (UnsatisfiedLinkError e) {
                sMediaSupported = false;
            }
        }
    }

    public static File getLibPath(String name) {
        return SoLoader.unpackLibraryAndDependencies(name);
    }

    public static String dump() {
        StringBuilder state = new StringBuilder();
        state.append("LD_LIBRARY_PATH:\n").append(SoLoader.makeLdLibraryPath()).append("\n");
        state.append("SELF_MAPS:\n").append(getSelfMaps()).append("\n");
        state.append("PID_MAPS:\n").append(getPidMaps()).append("\n");
        return state.toString();
    }

    private static void loadLibrary(String libraryName) {
        try {
            SoLoader.loadLibrary(libraryName);
        } catch (UnsatisfiedLinkError e) {
            try {
                System.loadLibrary(libraryName);
            } catch (Exception e2) {
            }
        }
    }

    private static boolean isX86() {
        String[] abis = null;
        if (Build.VERSION.SDK_INT >= 21) {
            abis = Build.SUPPORTED_ABIS;
        }
        if (abis == null || abis.length == 0) {
            abis = getABIList();
        }
        if (abis != null) {
            boolean hasX86 = false;
            boolean hasArm = false;
            for (String abi : abis) {
                if (abi.equals("x86") || abi.equals("x86_64")) {
                    hasX86 = true;
                } else if (abi.contains("armeabi")) {
                    hasArm = true;
                }
            }
            return hasX86 && !hasArm;
        }
        return false;
    }

    private static String[] getABIList() {
        String[] abis = {Build.CPU_ABI, Build.CPU_ABI2};
        return abis;
    }

    private static String getMaps(String pid) {
        String empty = "empty";
        InputStream is = null;
        try {
            Process process = Runtime.getRuntime().exec("cat /proc/" + pid + "/maps");
            if (process != null) {
                is = process.getInputStream();
                Scanner s = new Scanner(is).useDelimiter("\\A");
                if (s.hasNext()) {
                    empty = s.next();
                }
                if (is != null) {
                    try {
                        is.close();
                    } catch (Exception e) {
                    }
                }
            } else if (0 != 0) {
                try {
                    is.close();
                } catch (Exception e2) {
                }
            }
        } catch (Exception e3) {
            if (is != null) {
                try {
                    is.close();
                } catch (Exception e4) {
                }
            }
        } catch (Throwable th) {
            if (is != null) {
                try {
                    is.close();
                } catch (Exception e5) {
                }
            }
            throw th;
        }
        return empty;
    }

    private static String getSelfMaps() {
        return getMaps("self");
    }

    private static String getPidMaps() {
        return getMaps(String.valueOf(Process.myPid()));
    }
}
