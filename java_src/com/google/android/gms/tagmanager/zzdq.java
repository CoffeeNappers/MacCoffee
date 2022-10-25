package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
/* loaded from: classes2.dex */
class zzdq {
    private static zzce<zzaj.zza> zza(zzce<zzaj.zza> zzceVar) {
        try {
            return new zzce<>(zzdm.zzat(zzqe(zzdm.zzg(zzceVar.getObject()))), zzceVar.zzcfu());
        } catch (UnsupportedEncodingException e) {
            zzbo.zzb("Escape URI: unsupported encoding", e);
            return zzceVar;
        }
    }

    private static zzce<zzaj.zza> zza(zzce<zzaj.zza> zzceVar, int i) {
        if (!zzn(zzceVar.getObject())) {
            zzbo.e("Escaping can only be applied to strings.");
            return zzceVar;
        }
        switch (i) {
            case 12:
                return zza(zzceVar);
            default:
                zzbo.e(new StringBuilder(39).append("Unsupported Value Escaping: ").append(i).toString());
                return zzceVar;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static zzce<zzaj.zza> zza(zzce<zzaj.zza> zzceVar, int... iArr) {
        for (int i : iArr) {
            zzceVar = zza(zzceVar, i);
        }
        return zzceVar;
    }

    private static boolean zzn(zzaj.zza zzaVar) {
        return zzdm.zzl(zzaVar) instanceof String;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zzqe(String str) throws UnsupportedEncodingException {
        return URLEncoder.encode(str, "UTF-8").replaceAll("\\+", "%20");
    }
}
