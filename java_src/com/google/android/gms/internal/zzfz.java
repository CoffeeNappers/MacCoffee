package com.google.android.gms.internal;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Parcel;
import android.support.annotation.Nullable;
import android.util.Base64;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.internal.zzgb;
import com.google.android.gms.internal.zzjr;
import com.vk.media.camera.CameraUtilsEffects;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.regex.Pattern;
@zzji
/* loaded from: classes.dex */
public class zzfz {
    private final Map<zzga, zzgb> zzbsl = new HashMap();
    private final LinkedList<zzga> zzbsm = new LinkedList<>();
    @Nullable
    private zzfw zzbsn;

    private static void zza(String str, zzga zzgaVar) {
        if (zzkx.zzbi(2)) {
            zzkx.v(String.format(str, zzgaVar));
        }
    }

    private String[] zzbl(String str) {
        try {
            String[] split = str.split("\u0000");
            for (int i = 0; i < split.length; i++) {
                split[i] = new String(Base64.decode(split[i], 0), "UTF-8");
            }
            return split;
        } catch (UnsupportedEncodingException e) {
            return new String[0];
        }
    }

    private boolean zzbm(String str) {
        try {
            return Pattern.matches(zzdr.zzbgn.get(), str);
        } catch (RuntimeException e) {
            com.google.android.gms.ads.internal.zzu.zzgq().zza(e, "InterstitialAdPool.isExcludedAdUnit");
            return false;
        }
    }

    private static void zzc(Bundle bundle, String str) {
        String[] split = str.split(CameraUtilsEffects.FILE_DELIM, 2);
        if (split.length == 0) {
            return;
        }
        String str2 = split[0];
        if (split.length == 1) {
            bundle.remove(str2);
            return;
        }
        Bundle bundle2 = bundle.getBundle(str2);
        if (bundle2 == null) {
            return;
        }
        zzc(bundle2, split[1]);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Nullable
    public static Bundle zzk(AdRequestParcel adRequestParcel) {
        Bundle bundle = adRequestParcel.zzayv;
        if (bundle == null) {
            return null;
        }
        return bundle.getBundle("com.google.ads.mediation.admob.AdMobAdapter");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static AdRequestParcel zzl(AdRequestParcel adRequestParcel) {
        AdRequestParcel zzo = zzo(adRequestParcel);
        Bundle zzk = zzk(zzo);
        if (zzk == null) {
            zzk = new Bundle();
            zzo.zzayv.putBundle("com.google.ads.mediation.admob.AdMobAdapter", zzk);
        }
        zzk.putBoolean("_skipMediation", true);
        return zzo;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean zzm(AdRequestParcel adRequestParcel) {
        Bundle bundle;
        Bundle bundle2 = adRequestParcel.zzayv;
        return (bundle2 == null || (bundle = bundle2.getBundle("com.google.ads.mediation.admob.AdMobAdapter")) == null || !bundle.containsKey("_skipMediation")) ? false : true;
    }

    private static AdRequestParcel zzn(AdRequestParcel adRequestParcel) {
        AdRequestParcel zzo = zzo(adRequestParcel);
        for (String str : zzdr.zzbgj.get().split(",")) {
            zzc(zzo.zzayv, str);
        }
        return zzo;
    }

    private String zznn() {
        try {
            StringBuilder sb = new StringBuilder();
            Iterator<zzga> it = this.zzbsm.iterator();
            while (it.hasNext()) {
                sb.append(Base64.encodeToString(it.next().toString().getBytes("UTF-8"), 0));
                if (it.hasNext()) {
                    sb.append("\u0000");
                }
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }

    static AdRequestParcel zzo(AdRequestParcel adRequestParcel) {
        Parcel obtain = Parcel.obtain();
        adRequestParcel.writeToParcel(obtain, 0);
        obtain.setDataPosition(0);
        AdRequestParcel createFromParcel = AdRequestParcel.CREATOR.createFromParcel(obtain);
        obtain.recycle();
        AdRequestParcel.zzj(createFromParcel);
        return createFromParcel;
    }

    void flush() {
        while (this.zzbsm.size() > 0) {
            zzga remove = this.zzbsm.remove();
            zzgb zzgbVar = this.zzbsl.get(remove);
            zza("Flushing interstitial queue for %s.", remove);
            while (zzgbVar.size() > 0) {
                zzgbVar.zzp(null).zzbss.zzfn();
            }
            this.zzbsl.remove(remove);
        }
    }

    void restore() {
        if (this.zzbsn == null) {
            return;
        }
        SharedPreferences sharedPreferences = this.zzbsn.getApplicationContext().getSharedPreferences("com.google.android.gms.ads.internal.interstitial.InterstitialAdPool", 0);
        flush();
        try {
            HashMap hashMap = new HashMap();
            for (Map.Entry<String, ?> entry : sharedPreferences.getAll().entrySet()) {
                if (!entry.getKey().equals("PoolKeys")) {
                    zzgd zzbn = zzgd.zzbn((String) entry.getValue());
                    zzga zzgaVar = new zzga(zzbn.zzapj, zzbn.zzant, zzbn.zzbsq);
                    if (!this.zzbsl.containsKey(zzgaVar)) {
                        this.zzbsl.put(zzgaVar, new zzgb(zzbn.zzapj, zzbn.zzant, zzbn.zzbsq));
                        hashMap.put(zzgaVar.toString(), zzgaVar);
                        zza("Restored interstitial queue for %s.", zzgaVar);
                    }
                }
            }
            for (String str : zzbl(sharedPreferences.getString("PoolKeys", ""))) {
                zzga zzgaVar2 = (zzga) hashMap.get(str);
                if (this.zzbsl.containsKey(zzgaVar2)) {
                    this.zzbsm.add(zzgaVar2);
                }
            }
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.zzu.zzgq().zza(th, "InterstitialAdPool.restore");
            zzkx.zzc("Malformed preferences value for InterstitialAdPool.", th);
            this.zzbsl.clear();
            this.zzbsm.clear();
        }
    }

    void save() {
        if (this.zzbsn == null) {
            return;
        }
        SharedPreferences.Editor edit = this.zzbsn.getApplicationContext().getSharedPreferences("com.google.android.gms.ads.internal.interstitial.InterstitialAdPool", 0).edit();
        edit.clear();
        for (Map.Entry<zzga, zzgb> entry : this.zzbsl.entrySet()) {
            zzga key = entry.getKey();
            zzgb value = entry.getValue();
            if (value.zzns()) {
                edit.putString(key.toString(), new zzgd(value).zznv());
                zza("Saved interstitial queue for %s.", key);
            }
        }
        edit.putString("PoolKeys", zznn());
        edit.apply();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Nullable
    public zzgb.zza zza(AdRequestParcel adRequestParcel, String str) {
        zzgb zzgbVar;
        if (zzbm(str)) {
            return null;
        }
        int i = new zzjr.zza(this.zzbsn.getApplicationContext()).zztr().zzcqe;
        AdRequestParcel zzn = zzn(adRequestParcel);
        zzga zzgaVar = new zzga(zzn, str, i);
        zzgb zzgbVar2 = this.zzbsl.get(zzgaVar);
        if (zzgbVar2 == null) {
            zza("Interstitial pool created at %s.", zzgaVar);
            zzgb zzgbVar3 = new zzgb(zzn, str, i);
            this.zzbsl.put(zzgaVar, zzgbVar3);
            zzgbVar = zzgbVar3;
        } else {
            zzgbVar = zzgbVar2;
        }
        this.zzbsm.remove(zzgaVar);
        this.zzbsm.add(zzgaVar);
        zzgbVar.zznr();
        while (this.zzbsm.size() > zzdr.zzbgk.get().intValue()) {
            zzga remove = this.zzbsm.remove();
            zzgb zzgbVar4 = this.zzbsl.get(remove);
            zza("Evicting interstitial queue for %s.", remove);
            while (zzgbVar4.size() > 0) {
                zzgbVar4.zzp(null).zzbss.zzfn();
            }
            this.zzbsl.remove(remove);
        }
        while (zzgbVar.size() > 0) {
            zzgb.zza zzp = zzgbVar.zzp(zzn);
            if (!zzp.zzbsw || com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis() - zzp.zzbsv <= 1000 * zzdr.zzbgm.get().intValue()) {
                String str2 = zzp.zzbst != null ? " (inline) " : MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR;
                zza(new StringBuilder(String.valueOf(str2).length() + 34).append("Pooled interstitial").append(str2).append("returned at %s.").toString(), zzgaVar);
                return zzp;
            }
            zza("Expired interstitial at %s.", zzgaVar);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zzfw zzfwVar) {
        if (this.zzbsn == null) {
            this.zzbsn = zzfwVar.zznl();
            restore();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(AdRequestParcel adRequestParcel, String str) {
        if (this.zzbsn == null) {
            return;
        }
        int i = new zzjr.zza(this.zzbsn.getApplicationContext()).zztr().zzcqe;
        AdRequestParcel zzn = zzn(adRequestParcel);
        zzga zzgaVar = new zzga(zzn, str, i);
        zzgb zzgbVar = this.zzbsl.get(zzgaVar);
        if (zzgbVar == null) {
            zza("Interstitial pool created at %s.", zzgaVar);
            zzgbVar = new zzgb(zzn, str, i);
            this.zzbsl.put(zzgaVar, zzgbVar);
        }
        zzgbVar.zza(this.zzbsn, adRequestParcel);
        zzgbVar.zznr();
        zza("Inline entry added to the queue at %s.", zzgaVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zznm() {
        int size;
        int zznp;
        if (this.zzbsn == null) {
            return;
        }
        for (Map.Entry<zzga, zzgb> entry : this.zzbsl.entrySet()) {
            zzga key = entry.getKey();
            zzgb value = entry.getValue();
            if (zzkx.zzbi(2) && (zznp = value.zznp()) < (size = value.size())) {
                zzkx.v(String.format("Loading %s/%s pooled interstitials for %s.", Integer.valueOf(size - zznp), Integer.valueOf(size), key));
            }
            value.zznq();
            while (value.size() < zzdr.zzbgl.get().intValue()) {
                zza("Pooling and loading one new interstitial for %s.", key);
                value.zzb(this.zzbsn);
            }
        }
        save();
    }
}
