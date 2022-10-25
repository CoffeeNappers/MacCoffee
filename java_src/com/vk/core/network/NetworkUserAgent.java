package com.vk.core.network;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;
import java.util.Locale;
import okio.Buffer;
/* loaded from: classes2.dex */
public class NetworkUserAgent {
    private String userAgent = "VKAndroidApp";
    private String userAgentAd = "VKAndroidApp";

    public void init(Context context) {
        String appVersion = "";
        int appBuild = 0;
        try {
            PackageInfo pkgInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            appVersion = pkgInfo.versionName;
            appBuild = pkgInfo.versionCode;
        } catch (Exception e) {
        }
        this.userAgent = toHumanReadableAscii(String.format(Locale.US, "VKAndroidApp/%s-%d (Android %s; SDK %d; %s; %s %s; %s)", appVersion, Integer.valueOf(appBuild), Build.VERSION.RELEASE, Integer.valueOf(Build.VERSION.SDK_INT), Build.CPU_ABI, Build.MANUFACTURER, Build.MODEL, System.getProperty("user.language")));
        this.userAgentAd = toHumanReadableAscii(String.format(Locale.US, "VKApp/%s (Linux; U; Android %s; %s Build/%s)", appVersion, Build.VERSION.RELEASE, Build.MODEL, Build.ID));
    }

    public String userAgent() {
        return this.userAgent;
    }

    public String userAgentAd() {
        return this.userAgentAd;
    }

    public static String toHumanReadableAscii(String s) {
        int i = 0;
        int length = s.length();
        while (i < length) {
            int c = s.codePointAt(i);
            if (c > 31 && c < 127) {
                i += Character.charCount(c);
            } else {
                Buffer buffer = new Buffer();
                buffer.mo1227writeUtf8(s, 0, i);
                int j = i;
                while (j < length) {
                    int c2 = s.codePointAt(j);
                    buffer.mo1228writeUtf8CodePoint((c2 <= 31 || c2 >= 127) ? 63 : c2);
                    j += Character.charCount(c2);
                }
                return buffer.readUtf8();
            }
        }
        return s;
    }
}
