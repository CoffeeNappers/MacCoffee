package com.google.android.gms.ads.internal.overlay;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.vk.media.camera.CameraUtilsEffects;
@zzji
/* loaded from: classes.dex */
public class zza {
    public boolean zza(Context context, Intent intent, zzp zzpVar) {
        try {
            String valueOf = String.valueOf(intent.toURI());
            zzkx.v(valueOf.length() != 0 ? "Launching an intent: ".concat(valueOf) : new String("Launching an intent: "));
            com.google.android.gms.ads.internal.zzu.zzgm().zzb(context, intent);
            if (zzpVar != null) {
                zzpVar.zzeh();
            }
            return true;
        } catch (ActivityNotFoundException e) {
            zzkx.zzdi(e.getMessage());
            return false;
        }
    }

    public boolean zza(Context context, AdLauncherIntentInfoParcel adLauncherIntentInfoParcel, zzp zzpVar) {
        int i;
        if (adLauncherIntentInfoParcel == null) {
            zzkx.zzdi("No intent data for launcher overlay.");
            return false;
        } else if (adLauncherIntentInfoParcel.intent != null) {
            return zza(context, adLauncherIntentInfoParcel.intent, zzpVar);
        } else {
            Intent intent = new Intent();
            if (TextUtils.isEmpty(adLauncherIntentInfoParcel.url)) {
                zzkx.zzdi("Open GMSG did not contain a URL.");
                return false;
            }
            if (!TextUtils.isEmpty(adLauncherIntentInfoParcel.mimeType)) {
                intent.setDataAndType(Uri.parse(adLauncherIntentInfoParcel.url), adLauncherIntentInfoParcel.mimeType);
            } else {
                intent.setData(Uri.parse(adLauncherIntentInfoParcel.url));
            }
            intent.setAction("android.intent.action.VIEW");
            if (!TextUtils.isEmpty(adLauncherIntentInfoParcel.packageName)) {
                intent.setPackage(adLauncherIntentInfoParcel.packageName);
            }
            if (!TextUtils.isEmpty(adLauncherIntentInfoParcel.zzbzm)) {
                String[] split = adLauncherIntentInfoParcel.zzbzm.split(CameraUtilsEffects.FILE_DELIM, 2);
                if (split.length < 2) {
                    String valueOf = String.valueOf(adLauncherIntentInfoParcel.zzbzm);
                    zzkx.zzdi(valueOf.length() != 0 ? "Could not parse component name from open GMSG: ".concat(valueOf) : new String("Could not parse component name from open GMSG: "));
                    return false;
                }
                intent.setClassName(split[0], split[1]);
            }
            String str = adLauncherIntentInfoParcel.zzbzn;
            if (!TextUtils.isEmpty(str)) {
                try {
                    i = Integer.parseInt(str);
                } catch (NumberFormatException e) {
                    zzkx.zzdi("Could not parse intent flags.");
                    i = 0;
                }
                intent.addFlags(i);
            }
            return zza(context, intent, zzpVar);
        }
    }
}
