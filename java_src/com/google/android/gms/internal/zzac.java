package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import android.net.http.AndroidHttpClient;
import android.os.Build;
import com.vk.media.camera.CameraUtilsEffects;
import java.io.File;
/* loaded from: classes2.dex */
public class zzac {
    public static zzl zza(Context context) {
        return zza(context, null);
    }

    public static zzl zza(Context context, zzy zzyVar) {
        File file = new File(context.getCacheDir(), "volley");
        String str = "volley/0";
        try {
            String packageName = context.getPackageName();
            str = new StringBuilder(String.valueOf(packageName).length() + 12).append(packageName).append(CameraUtilsEffects.FILE_DELIM).append(context.getPackageManager().getPackageInfo(packageName, 0).versionCode).toString();
        } catch (PackageManager.NameNotFoundException e) {
        }
        if (zzyVar == null) {
            zzyVar = Build.VERSION.SDK_INT >= 9 ? new zzz() : new zzw(AndroidHttpClient.newInstance(str));
        }
        zzl zzlVar = new zzl(new zzv(file), new zzt(zzyVar));
        zzlVar.start();
        return zzlVar;
    }
}
