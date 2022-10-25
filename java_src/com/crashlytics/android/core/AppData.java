package com.crashlytics.android.core;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import io.fabric.sdk.android.services.common.IdManager;
/* loaded from: classes.dex */
class AppData {
    public final String apiKey;
    public final String buildId;
    public final String installerPackageName;
    public final String packageName;
    public final String versionCode;
    public final String versionName;

    public static AppData create(Context context, IdManager idManager, String apiKey, String buildId) throws PackageManager.NameNotFoundException {
        String packageName = context.getPackageName();
        String installerPackageName = idManager.getInstallerPackageName();
        PackageManager packageManager = context.getPackageManager();
        PackageInfo packageInfo = packageManager.getPackageInfo(packageName, 0);
        String versionCode = Integer.toString(packageInfo.versionCode);
        String versionName = packageInfo.versionName == null ? IdManager.DEFAULT_VERSION_NAME : packageInfo.versionName;
        return new AppData(apiKey, buildId, installerPackageName, packageName, versionCode, versionName);
    }

    AppData(String apiKey, String buildId, String installerPackageName, String packageName, String versionCode, String versionName) {
        this.apiKey = apiKey;
        this.buildId = buildId;
        this.installerPackageName = installerPackageName;
        this.packageName = packageName;
        this.versionCode = versionCode;
        this.versionName = versionName;
    }
}
