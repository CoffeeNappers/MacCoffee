package com.google.android.gms.internal;

import android.os.Bundle;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.firebase.analytics.FirebaseAnalytics;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzga {
    private final Object[] mParams;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzga(AdRequestParcel adRequestParcel, String str, int i) {
        this.mParams = zza(adRequestParcel, str, i);
    }

    private static Object[] zza(AdRequestParcel adRequestParcel, String str, int i) {
        HashSet hashSet = new HashSet(Arrays.asList(zzdr.zzbgi.get().split(",")));
        ArrayList arrayList = new ArrayList();
        arrayList.add(str);
        if (hashSet.contains("networkType")) {
            arrayList.add(Integer.valueOf(i));
        }
        if (hashSet.contains("birthday")) {
            arrayList.add(Long.valueOf(adRequestParcel.zzayl));
        }
        if (hashSet.contains("extras")) {
            arrayList.add(zzc(adRequestParcel.extras));
        }
        if (hashSet.contains("gender")) {
            arrayList.add(Integer.valueOf(adRequestParcel.zzaym));
        }
        if (hashSet.contains("keywords")) {
            if (adRequestParcel.zzayn != null) {
                arrayList.add(adRequestParcel.zzayn.toString());
            } else {
                arrayList.add(null);
            }
        }
        if (hashSet.contains("isTestDevice")) {
            arrayList.add(Boolean.valueOf(adRequestParcel.zzayo));
        }
        if (hashSet.contains("tagForChildDirectedTreatment")) {
            arrayList.add(Integer.valueOf(adRequestParcel.zzayp));
        }
        if (hashSet.contains("manualImpressionsEnabled")) {
            arrayList.add(Boolean.valueOf(adRequestParcel.zzayq));
        }
        if (hashSet.contains("publisherProvidedId")) {
            arrayList.add(adRequestParcel.zzayr);
        }
        if (hashSet.contains(FirebaseAnalytics.Param.LOCATION)) {
            if (adRequestParcel.zzayt != null) {
                arrayList.add(adRequestParcel.zzayt.toString());
            } else {
                arrayList.add(null);
            }
        }
        if (hashSet.contains("contentUrl")) {
            arrayList.add(adRequestParcel.zzayu);
        }
        if (hashSet.contains("networkExtras")) {
            arrayList.add(zzc(adRequestParcel.zzayv));
        }
        if (hashSet.contains("customTargeting")) {
            arrayList.add(zzc(adRequestParcel.zzayw));
        }
        if (hashSet.contains("categoryExclusions")) {
            if (adRequestParcel.zzayx != null) {
                arrayList.add(adRequestParcel.zzayx.toString());
            } else {
                arrayList.add(null);
            }
        }
        if (hashSet.contains("requestAgent")) {
            arrayList.add(adRequestParcel.zzayy);
        }
        if (hashSet.contains("requestPackage")) {
            arrayList.add(adRequestParcel.zzayz);
        }
        return arrayList.toArray();
    }

    private static String zzc(@Nullable Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        Iterator it = new TreeSet(bundle.keySet()).iterator();
        while (it.hasNext()) {
            Object obj = bundle.get((String) it.next());
            sb.append(obj == null ? "null" : obj instanceof Bundle ? zzc((Bundle) obj) : obj.toString());
        }
        return sb.toString();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzga)) {
            return false;
        }
        return Arrays.equals(this.mParams, ((zzga) obj).mParams);
    }

    public int hashCode() {
        return Arrays.hashCode(this.mParams);
    }

    public String toString() {
        String valueOf = String.valueOf(Arrays.toString(this.mParams));
        return new StringBuilder(String.valueOf(valueOf).length() + 24).append("[InterstitialAdPoolKey ").append(valueOf).append("]").toString();
    }
}
