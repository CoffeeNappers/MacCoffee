package com.vk.analytics;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import com.facebook.appevents.AppEventsConstants;
import io.fabric.sdk.android.services.common.CommonUtils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.reactivex.annotations.SchedulerSupport;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/* loaded from: classes2.dex */
public class AnalyticsUtils {

    /* loaded from: classes2.dex */
    public static class DeviceState {
        public final Long mFreeMemory = AnalyticsUtils.getFreeMemory();
        public final String mNetworkAccess;
        public final String mOrientation;

        DeviceState(Context context) {
            this.mOrientation = AnalyticsUtils.getOrientation(context);
            this.mNetworkAccess = AnalyticsUtils.getNetworkAccess(context);
        }
    }

    public static String getAppHash(Context context) {
        String value = getAppVersion(context) + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + Build.FINGERPRINT;
        return getMD5Hash(value);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x0019 -> B:7:0x0012). Please submit an issue!!! */
    private static String getAppName(Context context) {
        ApplicationInfo applicationInfo;
        int stringId;
        try {
            applicationInfo = context.getApplicationInfo();
            stringId = applicationInfo.labelRes;
        } catch (Exception e) {
        }
        if (stringId == 0) {
            if (applicationInfo.nonLocalizedLabel != null) {
                return applicationInfo.nonLocalizedLabel.toString();
            }
            return null;
        }
        return context.getString(stringId);
    }

    private static String getAppVersion(Context context) {
        try {
            PackageManager manager = context.getPackageManager();
            PackageInfo info = manager.getPackageInfo(context.getPackageName(), 0);
            return info.versionName;
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    private static String getMD5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String md5 = number.toString(16);
            while (md5.length() < 32) {
                md5 = AppEventsConstants.EVENT_PARAM_VALUE_NO + md5;
            }
            return md5;
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Long getFreeMemory() {
        return Runtime.getRuntime().maxMemory() != Long.MAX_VALUE ? Long.valueOf((Runtime.getRuntime().maxMemory() - Runtime.getRuntime().totalMemory()) + Runtime.getRuntime().freeMemory()) : Long.valueOf(Runtime.getRuntime().freeMemory());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getOrientation(Context appContext) {
        switch (appContext.getResources().getConfiguration().orientation) {
            case 1:
                return "portrait";
            case 2:
                return "landscape";
            default:
                return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getNetworkAccess(Context appContext) {
        try {
            ConnectivityManager cm = (ConnectivityManager) appContext.getSystemService("connectivity");
            NetworkInfo activeNetwork = cm.getActiveNetworkInfo();
            if (activeNetwork != null && activeNetwork.isConnectedOrConnecting()) {
                if (activeNetwork.getType() == 1) {
                    return "wifi";
                }
                if (activeNetwork.getType() == 9) {
                    return "ethernet";
                }
                return "cellular";
            }
            return SchedulerSupport.NONE;
        } catch (Exception e) {
            return null;
        }
    }
}
