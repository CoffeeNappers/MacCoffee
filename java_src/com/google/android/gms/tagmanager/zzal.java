package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzai;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzal {
    private static void zza(DataLayer dataLayer, zzai.zzd zzdVar) {
        for (zzaj.zza zzaVar : zzdVar.zzwe) {
            dataLayer.zzpb(zzdm.zzg(zzaVar));
        }
    }

    public static void zza(DataLayer dataLayer, zzai.zzi zziVar) {
        if (zziVar.zzxt == null) {
            zzbo.zzdi("supplemental missing experimentSupplemental");
            return;
        }
        zza(dataLayer, zziVar.zzxt);
        zzb(dataLayer, zziVar.zzxt);
        zzc(dataLayer, zziVar.zzxt);
    }

    private static void zzb(DataLayer dataLayer, zzai.zzd zzdVar) {
        for (zzaj.zza zzaVar : zzdVar.zzwd) {
            Map<String, Object> zzc = zzc(zzaVar);
            if (zzc != null) {
                dataLayer.push(zzc);
            }
        }
    }

    private static Map<String, Object> zzc(zzaj.zza zzaVar) {
        Object zzl = zzdm.zzl(zzaVar);
        if (!(zzl instanceof Map)) {
            String valueOf = String.valueOf(zzl);
            zzbo.zzdi(new StringBuilder(String.valueOf(valueOf).length() + 36).append("value: ").append(valueOf).append(" is not a map value, ignored.").toString());
            return null;
        }
        return (Map) zzl;
    }

    private static void zzc(DataLayer dataLayer, zzai.zzd zzdVar) {
        zzai.zzc[] zzcVarArr;
        for (zzai.zzc zzcVar : zzdVar.zzwf) {
            if (zzcVar.zzcb == null) {
                zzbo.zzdi("GaExperimentRandom: No key");
            } else {
                Object obj = dataLayer.get(zzcVar.zzcb);
                Long valueOf = !(obj instanceof Number) ? null : Long.valueOf(((Number) obj).longValue());
                long j = zzcVar.zzvz;
                long j2 = zzcVar.zzwa;
                if (!zzcVar.zzwb || valueOf == null || valueOf.longValue() < j || valueOf.longValue() > j2) {
                    if (j <= j2) {
                        obj = Long.valueOf(Math.round((Math.random() * (j2 - j)) + j));
                    } else {
                        zzbo.zzdi("GaExperimentRandom: random range invalid");
                    }
                }
                dataLayer.zzpb(zzcVar.zzcb);
                Map<String, Object> zzo = dataLayer.zzo(zzcVar.zzcb, obj);
                if (zzcVar.zzwc > 0) {
                    if (!zzo.containsKey("gtm")) {
                        zzo.put("gtm", DataLayer.mapOf("lifetime", Long.valueOf(zzcVar.zzwc)));
                    } else {
                        Object obj2 = zzo.get("gtm");
                        if (obj2 instanceof Map) {
                            ((Map) obj2).put("lifetime", Long.valueOf(zzcVar.zzwc));
                        } else {
                            zzbo.zzdi("GaExperimentRandom: gtm not a map");
                        }
                    }
                }
                dataLayer.push(zzo);
            }
        }
    }
}
