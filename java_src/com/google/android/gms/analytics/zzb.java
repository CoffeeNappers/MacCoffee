package com.google.android.gms.analytics;

import android.net.Uri;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;
import com.google.android.gms.analytics.internal.zzab;
import com.google.android.gms.analytics.internal.zzao;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzms;
import com.google.android.gms.internal.zzmt;
import com.google.android.gms.internal.zzmu;
import com.google.android.gms.internal.zzmv;
import com.google.android.gms.internal.zzmw;
import com.google.android.gms.internal.zzmx;
import com.google.android.gms.internal.zzmy;
import com.google.android.gms.internal.zzmz;
import com.google.android.gms.internal.zzna;
import com.google.android.gms.internal.zznb;
import com.google.android.gms.internal.zznc;
import com.google.android.gms.internal.zznd;
import com.google.android.gms.internal.zzne;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.navigation.ArgKeys;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzb extends com.google.android.gms.analytics.internal.zzc implements zzk {
    private static DecimalFormat as;
    private final com.google.android.gms.analytics.internal.zzf ao;
    private final String at;
    private final Uri au;
    private final boolean av;
    private final boolean aw;

    public zzb(com.google.android.gms.analytics.internal.zzf zzfVar, String str) {
        this(zzfVar, str, true, false);
    }

    public zzb(com.google.android.gms.analytics.internal.zzf zzfVar, String str, boolean z, boolean z2) {
        super(zzfVar);
        zzaa.zzib(str);
        this.ao = zzfVar;
        this.at = str;
        this.av = z;
        this.aw = z2;
        this.au = zzdt(this.at);
    }

    private static void zza(Map<String, String> map, String str, double d) {
        if (d != 0.0d) {
            map.put(str, zzb(d));
        }
    }

    private static void zza(Map<String, String> map, String str, int i, int i2) {
        if (i <= 0 || i2 <= 0) {
            return;
        }
        map.put(str, new StringBuilder(23).append(i).append("x").append(i2).toString());
    }

    private static void zza(Map<String, String> map, String str, boolean z) {
        if (z) {
            map.put(str, AppEventsConstants.EVENT_PARAM_VALUE_YES);
        }
    }

    private static String zzaq(Map<String, String> map) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (sb.length() != 0) {
                sb.append(", ");
            }
            sb.append(entry.getKey());
            sb.append("=");
            sb.append(entry.getValue());
        }
        return sb.toString();
    }

    static String zzb(double d) {
        if (as == null) {
            as = new DecimalFormat("0.######");
        }
        return as.format(d);
    }

    private static void zzb(Map<String, String> map, String str, String str2) {
        if (!TextUtils.isEmpty(str2)) {
            map.put(str, str2);
        }
    }

    public static Map<String, String> zzc(zze zzeVar) {
        HashMap hashMap = new HashMap();
        zzmw zzmwVar = (zzmw) zzeVar.zza(zzmw.class);
        if (zzmwVar != null) {
            for (Map.Entry<String, Object> entry : zzmwVar.zzaap().entrySet()) {
                String zzi = zzi(entry.getValue());
                if (zzi != null) {
                    hashMap.put(entry.getKey(), zzi);
                }
            }
        }
        zznb zznbVar = (zznb) zzeVar.zza(zznb.class);
        if (zznbVar != null) {
            zzb(hashMap, "t", zznbVar.zzaba());
            zzb(hashMap, "cid", zznbVar.zzze());
            zzb(hashMap, ArgKeys.UID, zznbVar.getUserId());
            zzb(hashMap, "sc", zznbVar.zzabd());
            zza(hashMap, "sf", zznbVar.zzabf());
            zza(hashMap, "ni", zznbVar.zzabe());
            zzb(hashMap, "adid", zznbVar.zzabb());
            zza(hashMap, "ate", zznbVar.zzabc());
        }
        zznc zzncVar = (zznc) zzeVar.zza(zznc.class);
        if (zzncVar != null) {
            zzb(hashMap, "cd", zzncVar.zzabh());
            zza(hashMap, "a", zzncVar.zzabi());
            zzb(hashMap, "dr", zzncVar.zzabj());
        }
        zzmz zzmzVar = (zzmz) zzeVar.zza(zzmz.class);
        if (zzmzVar != null) {
            zzb(hashMap, "ec", zzmzVar.getCategory());
            zzb(hashMap, "ea", zzmzVar.getAction());
            zzb(hashMap, "el", zzmzVar.getLabel());
            zza(hashMap, "ev", zzmzVar.getValue());
        }
        zzmt zzmtVar = (zzmt) zzeVar.zza(zzmt.class);
        if (zzmtVar != null) {
            zzb(hashMap, "cn", zzmtVar.getName());
            zzb(hashMap, "cs", zzmtVar.getSource());
            zzb(hashMap, "cm", zzmtVar.zzaah());
            zzb(hashMap, "ck", zzmtVar.zzaai());
            zzb(hashMap, "cc", zzmtVar.getContent());
            zzb(hashMap, "ci", zzmtVar.getId());
            zzb(hashMap, "anid", zzmtVar.zzaaj());
            zzb(hashMap, "gclid", zzmtVar.zzaak());
            zzb(hashMap, "dclid", zzmtVar.zzaal());
            zzb(hashMap, "aclid", zzmtVar.zzaam());
        }
        zzna zznaVar = (zzna) zzeVar.zza(zzna.class);
        if (zznaVar != null) {
            zzb(hashMap, "exd", zznaVar.getDescription());
            zza(hashMap, "exf", zznaVar.zzaaz());
        }
        zznd zzndVar = (zznd) zzeVar.zza(zznd.class);
        if (zzndVar != null) {
            zzb(hashMap, "sn", zzndVar.zzabl());
            zzb(hashMap, "sa", zzndVar.getAction());
            zzb(hashMap, "st", zzndVar.getTarget());
        }
        zzne zzneVar = (zzne) zzeVar.zza(zzne.class);
        if (zzneVar != null) {
            zzb(hashMap, "utv", zzneVar.zzabm());
            zza(hashMap, "utt", zzneVar.getTimeInMillis());
            zzb(hashMap, "utc", zzneVar.getCategory());
            zzb(hashMap, "utl", zzneVar.getLabel());
        }
        zzmu zzmuVar = (zzmu) zzeVar.zza(zzmu.class);
        if (zzmuVar != null) {
            for (Map.Entry<Integer, String> entry2 : zzmuVar.zzaan().entrySet()) {
                String zzbm = zzc.zzbm(entry2.getKey().intValue());
                if (!TextUtils.isEmpty(zzbm)) {
                    hashMap.put(zzbm, entry2.getValue());
                }
            }
        }
        zzmv zzmvVar = (zzmv) zzeVar.zza(zzmv.class);
        if (zzmvVar != null) {
            for (Map.Entry<Integer, Double> entry3 : zzmvVar.zzaao().entrySet()) {
                String zzbo = zzc.zzbo(entry3.getKey().intValue());
                if (!TextUtils.isEmpty(zzbo)) {
                    hashMap.put(zzbo, zzb(entry3.getValue().doubleValue()));
                }
            }
        }
        zzmy zzmyVar = (zzmy) zzeVar.zza(zzmy.class);
        if (zzmyVar != null) {
            ProductAction zzaav = zzmyVar.zzaav();
            if (zzaav != null) {
                for (Map.Entry<String, String> entry4 : zzaav.build().entrySet()) {
                    if (entry4.getKey().startsWith("&")) {
                        hashMap.put(entry4.getKey().substring(1), entry4.getValue());
                    } else {
                        hashMap.put(entry4.getKey(), entry4.getValue());
                    }
                }
            }
            int i = 1;
            for (Promotion promotion : zzmyVar.zzaay()) {
                hashMap.putAll(promotion.zzep(zzc.zzbs(i)));
                i++;
            }
            int i2 = 1;
            for (Product product : zzmyVar.zzaaw()) {
                hashMap.putAll(product.zzep(zzc.zzbq(i2)));
                i2++;
            }
            int i3 = 1;
            for (Map.Entry<String, List<Product>> entry5 : zzmyVar.zzaax().entrySet()) {
                String zzbv = zzc.zzbv(i3);
                int i4 = 1;
                for (Product product2 : entry5.getValue()) {
                    String valueOf = String.valueOf(zzbv);
                    String valueOf2 = String.valueOf(zzc.zzbt(i4));
                    hashMap.putAll(product2.zzep(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf)));
                    i4++;
                }
                if (!TextUtils.isEmpty(entry5.getKey())) {
                    String valueOf3 = String.valueOf(zzbv);
                    String valueOf4 = String.valueOf("nm");
                    hashMap.put(valueOf4.length() != 0 ? valueOf3.concat(valueOf4) : new String(valueOf3), entry5.getKey());
                }
                i3++;
            }
        }
        zzmx zzmxVar = (zzmx) zzeVar.zza(zzmx.class);
        if (zzmxVar != null) {
            zzb(hashMap, "ul", zzmxVar.getLanguage());
            zza(hashMap, "sd", zzmxVar.zzaaq());
            zza(hashMap, "sr", zzmxVar.zzaar(), zzmxVar.zzaas());
            zza(hashMap, "vp", zzmxVar.zzaat(), zzmxVar.zzaau());
        }
        zzms zzmsVar = (zzms) zzeVar.zza(zzms.class);
        if (zzmsVar != null) {
            zzb(hashMap, "an", zzmsVar.zzaae());
            zzb(hashMap, AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, zzmsVar.zzup());
            zzb(hashMap, "aiid", zzmsVar.zzaag());
            zzb(hashMap, "av", zzmsVar.zzaaf());
        }
        return hashMap;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Uri zzdt(String str) {
        zzaa.zzib(str);
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("uri");
        builder.authority("google-analytics.com");
        builder.path(str);
        return builder.build();
    }

    private static String zzi(Object obj) {
        if (obj == null) {
            return null;
        }
        if (obj instanceof String) {
            String str = (String) obj;
            if (!TextUtils.isEmpty(str)) {
                return str;
            }
            return null;
        } else if (obj instanceof Double) {
            Double d = (Double) obj;
            if (d.doubleValue() == 0.0d) {
                return null;
            }
            return zzb(d.doubleValue());
        } else if (!(obj instanceof Boolean)) {
            return String.valueOf(obj);
        } else {
            if (obj == Boolean.FALSE) {
                return null;
            }
            return AppEventsConstants.EVENT_PARAM_VALUE_YES;
        }
    }

    @Override // com.google.android.gms.analytics.zzk
    public void zzb(zze zzeVar) {
        zzaa.zzy(zzeVar);
        zzaa.zzb(zzeVar.zzzn(), "Can't deliver not submitted measurement");
        zzaa.zzht("deliver should be called on worker thread");
        zze zzzi = zzeVar.zzzi();
        zznb zznbVar = (zznb) zzzi.zzb(zznb.class);
        if (TextUtils.isEmpty(zznbVar.zzaba())) {
            zzaca().zzh(zzc(zzzi), "Ignoring measurement without type");
        } else if (TextUtils.isEmpty(zznbVar.zzze())) {
            zzaca().zzh(zzc(zzzi), "Ignoring measurement without client id");
        } else if (this.ao.zzacn().getAppOptOut()) {
        } else {
            double zzabf = zznbVar.zzabf();
            if (zzao.zza(zzabf, zznbVar.zzze())) {
                zzb("Sampling enabled. Hit sampled out. sampling rate", Double.valueOf(zzabf));
                return;
            }
            Map<String, String> zzc = zzc(zzzi);
            zzc.put("v", AppEventsConstants.EVENT_PARAM_VALUE_YES);
            zzc.put("_v", com.google.android.gms.analytics.internal.zze.cS);
            zzc.put("tid", this.at);
            if (this.ao.zzacn().isDryRunEnabled()) {
                zzc("Dry run is enabled. GoogleAnalytics would have sent", zzaq(zzc));
                return;
            }
            HashMap hashMap = new HashMap();
            zzao.zzc(hashMap, ArgKeys.UID, zznbVar.getUserId());
            zzms zzmsVar = (zzms) zzeVar.zza(zzms.class);
            if (zzmsVar != null) {
                zzao.zzc(hashMap, "an", zzmsVar.zzaae());
                zzao.zzc(hashMap, AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, zzmsVar.zzup());
                zzao.zzc(hashMap, "av", zzmsVar.zzaaf());
                zzao.zzc(hashMap, "aiid", zzmsVar.zzaag());
            }
            zzc.put("_s", String.valueOf(zzzg().zza(new com.google.android.gms.analytics.internal.zzh(0L, zznbVar.zzze(), this.at, !TextUtils.isEmpty(zznbVar.zzabb()), 0L, hashMap))));
            zzzg().zza(new zzab(zzaca(), zzc, zzeVar.zzzl(), true));
        }
    }

    @Override // com.google.android.gms.analytics.zzk
    public Uri zzyx() {
        return this.au;
    }
}
