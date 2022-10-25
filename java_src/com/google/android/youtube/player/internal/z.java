package com.google.android.youtube.player.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build;
/* loaded from: classes2.dex */
public final class z {
    private static final Uri a = Uri.parse("http://play.google.com/store/apps/details");
    private static final String[] b = {"com.google.android.youtube", "com.google.android.youtube.tv", "com.google.android.youtube.googletv", "com.google.android.gms", null};

    public static Intent a(String str) {
        Uri fromParts = Uri.fromParts("package", str, null);
        Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
        intent.setData(fromParts);
        return intent;
    }

    public static String a() {
        return new StringBuilder(35).append(1).append(".2.2").toString();
    }

    public static String a(Context context) {
        PackageManager packageManager = context.getPackageManager();
        for (String str : b) {
            ResolveInfo resolveService = packageManager.resolveService(new Intent("com.google.android.youtube.api.service.START").setPackage(str), 0);
            if (resolveService != null && resolveService.serviceInfo != null && resolveService.serviceInfo.packageName != null) {
                return resolveService.serviceInfo.packageName;
            }
        }
        return packageManager.hasSystemFeature("android.software.leanback") ? "com.google.android.youtube.tv" : packageManager.hasSystemFeature("com.google.android.tv") ? "com.google.android.youtube.googletv" : "com.google.android.youtube";
    }

    public static boolean a(Context context, String str) {
        try {
            Resources resourcesForApplication = context.getPackageManager().getResourcesForApplication(str);
            if (str.equals("com.google.android.youtube.googletvdev")) {
                str = "com.google.android.youtube.googletv";
            }
            int identifier = resourcesForApplication.getIdentifier("youtube_api_version_code", "integer", str);
            return identifier == 0 || 12 > resourcesForApplication.getInteger(identifier) / 100;
        } catch (PackageManager.NameNotFoundException e) {
            return true;
        }
    }

    public static boolean a(PackageManager packageManager) {
        return packageManager.hasSystemFeature("com.google.android.tv");
    }

    public static Context b(Context context) {
        try {
            return context.createPackageContext(a(context), 3);
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    public static Intent b(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(a.buildUpon().appendQueryParameter("id", str).build());
        intent.setPackage("com.android.vending");
        intent.addFlags(524288);
        return intent;
    }

    public static boolean b(PackageManager packageManager) {
        return packageManager.hasSystemFeature("android.software.leanback");
    }

    public static int c(Context context) {
        Context b2 = b(context);
        int i = 0;
        if (b2 != null) {
            i = b2.getResources().getIdentifier("clientTheme", "style", a(context));
        }
        if (i == 0) {
            if (Build.VERSION.SDK_INT >= 14) {
                return 16974120;
            }
            return Build.VERSION.SDK_INT >= 11 ? 16973931 : 16973829;
        }
        return i;
    }

    public static String d(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            throw new IllegalStateException("Cannot retrieve calling Context's PackageInfo", e);
        }
    }
}
