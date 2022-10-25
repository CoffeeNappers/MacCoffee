package io.sentry.android.event.helper;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.util.Log;
import com.facebook.internal.NativeProtocol;
import com.facebook.internal.ServerProtocol;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.FragmentWrapperActivity;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.fabric.sdk.android.services.common.CommonUtils;
import io.sentry.event.EventBuilder;
import io.sentry.event.helper.EventBuilderHelper;
import io.sentry.event.interfaces.UserInterface;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes3.dex */
public class AndroidEventBuilderHelper implements EventBuilderHelper {
    private Context ctx;
    public static final String TAG = AndroidEventBuilderHelper.class.getName();
    private static final Boolean IS_EMULATOR = isEmulator();
    private static final String KERNEL_VERSION = getKernelVersion();

    public AndroidEventBuilderHelper(Context ctx) {
        this.ctx = ctx;
    }

    @Override // io.sentry.event.helper.EventBuilderHelper
    public void helpBuildingEvent(EventBuilder eventBuilder) {
        eventBuilder.withSdkIntegration(AbstractSpiCall.ANDROID_CLIENT_TYPE);
        PackageInfo packageInfo = getPackageInfo(this.ctx);
        if (packageInfo != null) {
            eventBuilder.withRelease(packageInfo.packageName + "-" + packageInfo.versionName);
            eventBuilder.withDist(Integer.toString(packageInfo.versionCode));
        }
        String androidId = Settings.Secure.getString(this.ctx.getContentResolver(), "android_id");
        if (androidId != null && !androidId.trim().equals("")) {
            UserInterface userInterface = new UserInterface("android:" + androidId, null, null, null);
            eventBuilder.withSentryInterface(userInterface, false);
        }
        eventBuilder.withContexts(getContexts());
    }

    private Map<String, Map<String, Object>> getContexts() {
        Map<String, Map<String, Object>> contexts = new HashMap<>();
        Map<String, Object> deviceMap = new HashMap<>();
        Map<String, Object> osMap = new HashMap<>();
        Map<String, Object> appMap = new HashMap<>();
        contexts.put("os", osMap);
        contexts.put("device", deviceMap);
        contexts.put("app", appMap);
        deviceMap.put("manufacturer", Build.MANUFACTURER);
        deviceMap.put("brand", Build.BRAND);
        deviceMap.put("model", Build.MODEL);
        deviceMap.put("family", getFamily());
        deviceMap.put("model_id", Build.ID);
        deviceMap.put("battery_level", getBatteryLevel(this.ctx));
        deviceMap.put(FragmentWrapperActivity.ORIENTATION_KEY, getOrientation(this.ctx));
        deviceMap.put("simulator", IS_EMULATOR);
        deviceMap.put("arch", Build.CPU_ABI);
        deviceMap.put("storage_size", getTotalInternalStorage());
        deviceMap.put("free_storage", getUnusedInternalStorage());
        deviceMap.put("external_storage_size", getTotalExternalStorage());
        deviceMap.put("external_free_storage", getUnusedExternalStorage());
        deviceMap.put("charging", isCharging(this.ctx));
        deviceMap.put("online", Boolean.valueOf(isConnected(this.ctx)));
        DisplayMetrics displayMetrics = getDisplayMetrics(this.ctx);
        if (displayMetrics != null) {
            int largestSide = Math.max(displayMetrics.widthPixels, displayMetrics.heightPixels);
            int smallestSide = Math.min(displayMetrics.widthPixels, displayMetrics.heightPixels);
            String resolution = Integer.toString(largestSide) + "x" + Integer.toString(smallestSide);
            deviceMap.put("screen_resolution", resolution);
            deviceMap.put("screen_density", Float.valueOf(displayMetrics.density));
            deviceMap.put("screen_dpi", Integer.valueOf(displayMetrics.densityDpi));
        }
        ActivityManager.MemoryInfo memInfo = getMemInfo(this.ctx);
        if (memInfo != null) {
            deviceMap.put("free_memory", Long.valueOf(memInfo.availMem));
            deviceMap.put("memory_size", Long.valueOf(memInfo.totalMem));
            deviceMap.put("low_memory", Boolean.valueOf(memInfo.lowMemory));
        }
        osMap.put("name", "Android");
        osMap.put(ServerProtocol.FALLBACK_DIALOG_PARAM_VERSION, Build.VERSION.RELEASE);
        osMap.put("build", Build.DISPLAY);
        osMap.put("kernel_version", KERNEL_VERSION);
        osMap.put("rooted", isRooted());
        PackageInfo packageInfo = getPackageInfo(this.ctx);
        if (packageInfo != null) {
            appMap.put("app_version", packageInfo.versionName);
            appMap.put("app_build", Integer.valueOf(packageInfo.versionCode));
            appMap.put("app_identifier", packageInfo.packageName);
        }
        appMap.put(NativeProtocol.BRIDGE_ARG_APP_NAME_STRING, getApplicationName(this.ctx));
        appMap.put("app_start_time", stringifyDate(new Date()));
        return contexts;
    }

    private static PackageInfo getPackageInfo(Context ctx) {
        try {
            return ctx.getPackageManager().getPackageInfo(ctx.getPackageName(), 0);
        } catch (PackageManager.NameNotFoundException e) {
            Log.e(TAG, "Error getting package info.", e);
            return null;
        }
    }

    private static String getFamily() {
        try {
            return Build.MODEL.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR)[0];
        } catch (Exception e) {
            Log.e(TAG, "Error getting device family.", e);
            return null;
        }
    }

    private static Boolean isEmulator() {
        try {
            return Boolean.valueOf(Build.FINGERPRINT.startsWith("generic") || Build.FINGERPRINT.startsWith("unknown") || Build.MODEL.contains(CommonUtils.GOOGLE_SDK) || Build.MODEL.contains("Emulator") || Build.MODEL.contains("Android SDK built for x86") || Build.MANUFACTURER.contains("Genymotion") || (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic")) || CommonUtils.GOOGLE_SDK.equals(Build.PRODUCT));
        } catch (Exception e) {
            Log.e(TAG, "Error checking whether application is running in an emulator.", e);
            return null;
        }
    }

    private static ActivityManager.MemoryInfo getMemInfo(Context ctx) {
        try {
            ActivityManager actManager = (ActivityManager) ctx.getSystemService("activity");
            ActivityManager.MemoryInfo memInfo = new ActivityManager.MemoryInfo();
            actManager.getMemoryInfo(memInfo);
            return memInfo;
        } catch (Exception e) {
            Log.e(TAG, "Error getting MemoryInfo.", e);
            return null;
        }
    }

    private static String getOrientation(Context ctx) {
        try {
            switch (ctx.getResources().getConfiguration().orientation) {
                case 1:
                    return "portrait";
                case 2:
                    return "landscape";
                default:
                    return null;
            }
        } catch (Exception e) {
            Log.e(TAG, "Error getting device orientation.", e);
            return null;
        }
    }

    private static Float getBatteryLevel(Context ctx) {
        try {
            Intent intent = ctx.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
            if (intent == null) {
                return null;
            }
            int level = intent.getIntExtra("level", -1);
            int scale = intent.getIntExtra("scale", -1);
            if (level != -1 && scale != -1) {
                return Float.valueOf((level / scale) * 100.0f);
            }
            return null;
        } catch (Exception e) {
            Log.e(TAG, "Error getting device battery level.", e);
            return null;
        }
    }

    private static Boolean isCharging(Context ctx) {
        boolean z = true;
        try {
            Intent intent = ctx.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
            if (intent == null) {
                return null;
            }
            int plugged = intent.getIntExtra("plugged", -1);
            if (plugged != 1 && plugged != 2) {
                z = false;
            }
            return Boolean.valueOf(z);
        } catch (Exception e) {
            Log.e(TAG, "Error getting device charging state.", e);
            return null;
        }
    }

    private static String getKernelVersion() {
        BufferedReader br;
        BufferedReader br2 = null;
        try {
            try {
                br = new BufferedReader(new FileReader("/proc/version"));
            } catch (Throwable th) {
                th = th;
            }
        } catch (Exception e) {
            e = e;
        }
        try {
            String readLine = br.readLine();
            if (br != null) {
                try {
                    br.close();
                } catch (IOException ioe) {
                    Log.e(TAG, "Exception while attempting to read kernel information", ioe);
                }
            }
            br2 = br;
            return readLine;
        } catch (Exception e2) {
            e = e2;
            br2 = br;
            Log.e(TAG, "Exception while attempting to read kernel information", e);
            if (br2 != null) {
                try {
                    br2.close();
                } catch (IOException ioe2) {
                    Log.e(TAG, "Exception while attempting to read kernel information", ioe2);
                }
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            br2 = br;
            if (br2 != null) {
                try {
                    br2.close();
                } catch (IOException ioe3) {
                    Log.e(TAG, "Exception while attempting to read kernel information", ioe3);
                }
            }
            throw th;
        }
    }

    private static Boolean isRooted() {
        if (Build.TAGS != null && Build.TAGS.contains("test-keys")) {
            return true;
        }
        String[] probableRootPaths = {"/data/local/bin/su", "/data/local/su", "/data/local/xbin/su", "/sbin/su", "/su/bin", "/su/bin/su", "/system/app/SuperSU", "/system/app/SuperSU.apk", "/system/app/Superuser", "/system/app/Superuser.apk", "/system/bin/failsafe/su", "/system/bin/su", "/system/sd/xbin/su", "/system/xbin/daemonsu", "/system/xbin/su"};
        for (String probableRootPath : probableRootPaths) {
            try {
            } catch (Exception e) {
                Log.e(TAG, "Exception while attempting to detect whether the device is rooted", e);
            }
            if (!new File(probableRootPath).exists()) {
                continue;
            } else {
                return true;
            }
        }
        return false;
    }

    private static boolean isExternalStorageMounted() {
        return Environment.getExternalStorageState().equals("mounted") && !Environment.isExternalStorageEmulated();
    }

    private static Long getUnusedInternalStorage() {
        try {
            File path = Environment.getDataDirectory();
            StatFs stat = new StatFs(path.getPath());
            long blockSize = stat.getBlockSize();
            long availableBlocks = stat.getAvailableBlocks();
            return Long.valueOf(availableBlocks * blockSize);
        } catch (Exception e) {
            Log.e(TAG, "Error getting unused internal storage amount.", e);
            return null;
        }
    }

    private static Long getTotalInternalStorage() {
        try {
            File path = Environment.getDataDirectory();
            StatFs stat = new StatFs(path.getPath());
            long blockSize = stat.getBlockSize();
            long totalBlocks = stat.getBlockCount();
            return Long.valueOf(totalBlocks * blockSize);
        } catch (Exception e) {
            Log.e(TAG, "Error getting total internal storage amount.", e);
            return null;
        }
    }

    private static Long getUnusedExternalStorage() {
        try {
            if (isExternalStorageMounted()) {
                File path = Environment.getExternalStorageDirectory();
                StatFs stat = new StatFs(path.getPath());
                long blockSize = stat.getBlockSize();
                long availableBlocks = stat.getAvailableBlocks();
                return Long.valueOf(availableBlocks * blockSize);
            }
        } catch (Exception e) {
            Log.e(TAG, "Error getting unused external storage amount.", e);
        }
        return null;
    }

    private static Long getTotalExternalStorage() {
        try {
            if (isExternalStorageMounted()) {
                File path = Environment.getExternalStorageDirectory();
                StatFs stat = new StatFs(path.getPath());
                long blockSize = stat.getBlockSize();
                long totalBlocks = stat.getBlockCount();
                return Long.valueOf(totalBlocks * blockSize);
            }
        } catch (Exception e) {
            Log.e(TAG, "Error getting total external storage amount.", e);
        }
        return null;
    }

    private static DisplayMetrics getDisplayMetrics(Context ctx) {
        try {
            return ctx.getResources().getDisplayMetrics();
        } catch (Exception e) {
            Log.e(TAG, "Error getting DisplayMetrics.", e);
            return null;
        }
    }

    private static String stringifyDate(Date date) {
        return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(date);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0021 -> B:7:0x0012). Please submit an issue!!! */
    private static String getApplicationName(Context ctx) {
        ApplicationInfo applicationInfo;
        int stringId;
        try {
            applicationInfo = ctx.getApplicationInfo();
            stringId = applicationInfo.labelRes;
        } catch (Exception e) {
            Log.e(TAG, "Error getting application name.", e);
        }
        if (stringId == 0) {
            if (applicationInfo.nonLocalizedLabel != null) {
                return applicationInfo.nonLocalizedLabel.toString();
            }
            return null;
        }
        return ctx.getString(stringId);
    }

    private static boolean isConnected(Context ctx) {
        ConnectivityManager connectivityManager = (ConnectivityManager) ctx.getSystemService("connectivity");
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }
}
