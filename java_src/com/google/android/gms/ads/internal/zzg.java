package com.google.android.gms.ads.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzfe;
import com.google.android.gms.internal.zzgh;
import com.google.android.gms.internal.zzgi;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkq;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzlw;
import com.google.android.gms.internal.zzmd;
import java.util.Map;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzg {
    private Context mContext;
    private final Object zzako = new Object();
    public final zzfe zzana = new zzfe() { // from class: com.google.android.gms.ads.internal.zzg.1
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            zzmdVar.zzb("/appSettingsFetched", this);
            synchronized (zzg.this.zzako) {
                if (map != null) {
                    if ("true".equalsIgnoreCase(map.get("isSuccessful"))) {
                        zzu.zzgq().zzd(zzg.this.mContext, map.get("appSettingsJson"));
                    }
                }
            }
        }
    };

    private static boolean zza(@Nullable zzkq zzkqVar) {
        if (zzkqVar == null) {
            return true;
        }
        return (((zzu.zzgs().currentTimeMillis() - zzkqVar.zzum()) > zzdr.zzbjx.get().longValue() ? 1 : ((zzu.zzgs().currentTimeMillis() - zzkqVar.zzum()) == zzdr.zzbjx.get().longValue() ? 0 : -1)) > 0) || !zzkqVar.zzun();
    }

    public void zza(final Context context, VersionInfoParcel versionInfoParcel, final boolean z, @Nullable zzkq zzkqVar, final String str, @Nullable final String str2) {
        if (!zza(zzkqVar)) {
            return;
        }
        if (context == null) {
            zzkx.zzdi("Context not provided to fetch application settings");
        } else if (TextUtils.isEmpty(str) && TextUtils.isEmpty(str2)) {
            zzkx.zzdi("App settings could not be fetched. Required parameters missing");
        } else {
            this.mContext = context;
            final zzgh zzd = zzu.zzgm().zzd(context, versionInfoParcel);
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.zzg.2
                @Override // java.lang.Runnable
                public void run() {
                    zzd.zzny().zza(new zzlw.zzc<zzgi>() { // from class: com.google.android.gms.ads.internal.zzg.2.1
                        @Override // com.google.android.gms.internal.zzlw.zzc
                        /* renamed from: zzb */
                        public void zzd(zzgi zzgiVar) {
                            zzgiVar.zza("/appSettingsFetched", zzg.this.zzana);
                            try {
                                JSONObject jSONObject = new JSONObject();
                                if (!TextUtils.isEmpty(str)) {
                                    jSONObject.put("app_id", str);
                                } else if (!TextUtils.isEmpty(str2)) {
                                    jSONObject.put("ad_unit_id", str2);
                                }
                                jSONObject.put("is_init", z);
                                jSONObject.put("pn", context.getPackageName());
                                zzgiVar.zza("AFMA_fetchAppSettings", jSONObject);
                            } catch (Exception e) {
                                zzgiVar.zzb("/appSettingsFetched", zzg.this.zzana);
                                zzkx.zzb("Error requesting application settings", e);
                            }
                        }
                    }, new zzlw.zzb());
                }
            });
        }
    }
}
