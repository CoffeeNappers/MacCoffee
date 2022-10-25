package com.vk.core.util;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Environment;
import android.os.Process;
import android.util.Log;
import com.facebook.appevents.AppEventsConstants;
import java.io.File;
/* loaded from: classes2.dex */
public class LibraryLoader {
    public static final String CUSTOM_LIB_DIR = "lib";
    public static final String LOG_TAG = LibraryLoader.class.getName();
    private static long sUpdatedTime = 0;
    private static String sVersion = null;

    public static void loadLibraries(Context context, boolean fromAssets, String[] libraries) throws UnsatisfiedLinkError {
        if (context == null) {
            throw new UnsatisfiedLinkError("Null context");
        }
        Context appContext = context.getApplicationContext();
        getPackageInfo(appContext);
        if (!fromAssets && trySystemLibraries(appContext, false, libraries)) {
            if (!trySystemLibraries(appContext, true, libraries)) {
                throw new UnsatisfiedLinkError("Error appkit_loading libraries from APK");
            }
            return;
        }
        unpackAndLoadLibraries(appContext, fromAssets, libraries);
    }

    private static void getPackageInfo(Context appContext) {
        if (sVersion == null) {
            PackageManager pm = appContext.getPackageManager();
            if (pm != null) {
                try {
                    PackageInfo info = pm.getPackageInfo(appContext.getPackageName(), 0);
                    sUpdatedTime = info.lastUpdateTime;
                    if (sUpdatedTime == 0) {
                        sUpdatedTime = info.firstInstallTime;
                    }
                    sVersion = Integer.toString(info.versionCode) + "-" + Long.toString(sUpdatedTime);
                } catch (PackageManager.NameNotFoundException e) {
                    Log.e(LOG_TAG, "Package information not found.");
                }
            }
            if (sVersion == null) {
                sVersion = AppEventsConstants.EVENT_PARAM_VALUE_NO;
            }
        }
    }

    private static boolean trySystemLibraries(Context appContext, boolean load, String[] libraries) throws UnsatisfiedLinkError {
        String libRoot = appContext.getApplicationInfo().nativeLibraryDir;
        String preinstallRoot = Environment.getRootDirectory() + "/system/vendor/lib";
        for (String libName : libraries) {
            String libTail = System.mapLibraryName(libName);
            File libFile = new File(libRoot, libTail);
            if (!libFile.exists()) {
                libFile = new File(preinstallRoot, libTail);
            }
            if (load) {
                if (!libFile.exists()) {
                    throw new UnsatisfiedLinkError("Missing library: " + libName);
                }
                System.load(libFile.getAbsolutePath());
            } else if (!libFile.exists() || libFile.lastModified() < sUpdatedTime) {
                return false;
            }
        }
        return true;
    }

    private static void unpackAndLoadLibraries(Context appContext, boolean fromAssets, String[] libraries) throws UnsatisfiedLinkError {
        boolean unpacked = false;
        File libRoot = unpackLibVersionedDir(appContext);
        for (String libName : libraries) {
            String libTail = System.mapLibraryName(libName);
            File libFile = new File(libRoot, libTail);
            if (!libFile.exists() && !unpacked) {
                unpackLibraries(appContext, fromAssets, libraries);
                unpacked = true;
            }
            if (libFile.exists()) {
                if (libFile.length() > 0) {
                    System.load(libFile.getAbsolutePath());
                }
            } else {
                throw new UnsatisfiedLinkError("Missing library for unpack: " + libName);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:83:0x0101 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00fc A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void unpackLibraries(android.content.Context r24, boolean r25, java.lang.String[] r26) throws java.lang.UnsatisfiedLinkError {
        /*
            Method dump skipped, instructions count: 621
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vk.core.util.LibraryLoader.unpackLibraries(android.content.Context, boolean, java.lang.String[]):void");
    }

    private static void cleanOldFiles(File dir, boolean deleteDir) {
        File[] files = dir.listFiles();
        if (files != null) {
            for (File file : files) {
                if (!file.isDirectory() || !file.getName().startsWith(sVersion)) {
                    if (file.isDirectory()) {
                        cleanOldFiles(file, true);
                    } else if (!file.delete()) {
                        Log.w(LOG_TAG, "Failed to remove " + file.getAbsolutePath());
                    } else {
                        Log.d(LOG_TAG, "Deleted stale file " + file.getAbsolutePath());
                    }
                }
            }
        }
        if (deleteDir && !dir.delete()) {
            Log.w(LOG_TAG, "Failed to remove " + dir.getAbsolutePath());
        }
    }

    private static File unpackLibDir(Context appContext) {
        return appContext.getDir(CUSTOM_LIB_DIR, 0);
    }

    private static File unpackLibVersionedDir(Context appContext) {
        File root = unpackLibDir(appContext);
        return new File(root, sVersion);
    }

    private static File unpackTmpDir(Context appContext) {
        File root = unpackLibDir(appContext);
        return new File(root, sVersion + "-" + Integer.toString(Process.myPid()));
    }
}
