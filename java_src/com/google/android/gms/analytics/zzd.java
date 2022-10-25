package com.google.android.gms.analytics;

import android.net.Uri;
import android.text.TextUtils;
import android.util.LogPrinter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
/* loaded from: classes2.dex */
public final class zzd implements zzk {
    private static final Uri aT;
    private final LogPrinter aU = new LogPrinter(4, "GA/LogCatTransport");

    static {
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("uri");
        builder.authority("local");
        aT = builder.build();
    }

    @Override // com.google.android.gms.analytics.zzk
    public void zzb(zze zzeVar) {
        ArrayList<zzg> arrayList = new ArrayList(zzeVar.zzzj());
        Collections.sort(arrayList, new Comparator<zzg>() { // from class: com.google.android.gms.analytics.zzd.1
            @Override // java.util.Comparator
            /* renamed from: zza */
            public int compare(zzg zzgVar, zzg zzgVar2) {
                return zzgVar.getClass().getCanonicalName().compareTo(zzgVar2.getClass().getCanonicalName());
            }
        });
        StringBuilder sb = new StringBuilder();
        for (zzg zzgVar : arrayList) {
            String obj = zzgVar.toString();
            if (!TextUtils.isEmpty(obj)) {
                if (sb.length() != 0) {
                    sb.append(", ");
                }
                sb.append(obj);
            }
        }
        this.aU.println(sb.toString());
    }

    @Override // com.google.android.gms.analytics.zzk
    public Uri zzyx() {
        return aT;
    }
}
