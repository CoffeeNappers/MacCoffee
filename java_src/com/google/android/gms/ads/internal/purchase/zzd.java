package com.google.android.gms.ads.internal.purchase;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.internal.zzif;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzd extends zzif.zza {
    private Context mContext;
    private String zzasx;
    private String zzcfm;
    private ArrayList<String> zzcfn;

    public zzd(String str, ArrayList<String> arrayList, Context context, String str2) {
        this.zzcfm = str;
        this.zzcfn = arrayList;
        this.zzasx = str2;
        this.mContext = context;
    }

    @Override // com.google.android.gms.internal.zzif
    public String getProductId() {
        return this.zzcfm;
    }

    @Override // com.google.android.gms.internal.zzif
    public void recordPlayBillingResolution(int i) {
        if (i == 0) {
            zzrt();
        }
        Map<String, String> zzrs = zzrs();
        zzrs.put("google_play_status", String.valueOf(i));
        zzrs.put("sku", this.zzcfm);
        zzrs.put("status", String.valueOf(zzan(i)));
        LinkedList linkedList = new LinkedList();
        Iterator<String> it = this.zzcfn.iterator();
        while (it.hasNext()) {
            linkedList.add(zzu.zzgm().zzc(it.next(), zzrs));
        }
        zzu.zzgm().zza(this.mContext, this.zzasx, linkedList);
    }

    @Override // com.google.android.gms.internal.zzif
    public void recordResolution(int i) {
        if (i == 1) {
            zzrt();
        }
        Map<String, String> zzrs = zzrs();
        zzrs.put("status", String.valueOf(i));
        zzrs.put("sku", this.zzcfm);
        LinkedList linkedList = new LinkedList();
        Iterator<String> it = this.zzcfn.iterator();
        while (it.hasNext()) {
            linkedList.add(zzu.zzgm().zzc(it.next(), zzrs));
        }
        zzu.zzgm().zza(this.mContext, this.zzasx, linkedList);
    }

    protected int zzan(int i) {
        if (i == 0) {
            return 1;
        }
        if (i == 1) {
            return 2;
        }
        return i == 4 ? 3 : 0;
    }

    Map<String, String> zzrs() {
        String packageName = this.mContext.getPackageName();
        String str = "";
        try {
            str = this.mContext.getPackageManager().getPackageInfo(packageName, 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            zzkx.zzc("Error to retrieve app version", e);
        }
        long elapsedRealtime = SystemClock.elapsedRealtime() - zzu.zzgq().zzut().zzvk();
        HashMap hashMap = new HashMap();
        hashMap.put("sessionid", zzu.zzgq().getSessionId());
        hashMap.put("appid", packageName);
        hashMap.put("osversion", String.valueOf(Build.VERSION.SDK_INT));
        hashMap.put("sdkversion", this.zzasx);
        hashMap.put("appversion", str);
        hashMap.put(JsonMarshaller.TIMESTAMP, String.valueOf(elapsedRealtime));
        return hashMap;
    }

    void zzrt() {
        try {
            this.mContext.getClassLoader().loadClass("com.google.ads.conversiontracking.IAPConversionReporter").getDeclaredMethod("reportWithProductId", Context.class, String.class, String.class, Boolean.TYPE).invoke(null, this.mContext, this.zzcfm, "", true);
        } catch (ClassNotFoundException e) {
            zzkx.zzdi("Google Conversion Tracking SDK 1.2.0 or above is required to report a conversion.");
        } catch (NoSuchMethodException e2) {
            zzkx.zzdi("Google Conversion Tracking SDK 1.2.0 or above is required to report a conversion.");
        } catch (Exception e3) {
            zzkx.zzc("Fail to report a conversion.", e3);
        }
    }
}
