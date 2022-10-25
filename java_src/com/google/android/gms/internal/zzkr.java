package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcelable;
import android.security.NetworkSecurityPolicy;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.ads.dynamite.ModuleDescriptor;
import com.google.android.gms.internal.zzcz;
import com.google.android.gms.internal.zzkz;
import com.google.android.gms.internal.zztl;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.Future;
@zzji
/* loaded from: classes.dex */
public class zzkr implements zzcz.zzb, zzkz.zzb {
    private Context mContext;
    private zzco zzama;
    private VersionInfoParcel zzanu;
    private String zzbre;
    private final String zzctq;
    private final zzks zzctr;
    private String zzctz;
    private String zzcua;
    private final Object zzako = new Object();
    private BigInteger zzcts = BigInteger.ONE;
    private final HashSet<zzkp> zzctt = new HashSet<>();
    private final HashMap<String, zzku> zzctu = new HashMap<>();
    private boolean zzctv = false;
    private boolean zzcot = true;
    private int zzctw = 0;
    private boolean zzaoz = false;
    private zzdt zzctx = null;
    private boolean zzcou = true;
    private boolean zzcov = true;
    private zzda zzcty = null;
    private zzcy zzawi = null;
    private Boolean zzcub = null;
    private boolean zzcuc = false;
    private boolean zzcud = false;
    private boolean zzcpd = false;
    private boolean zzcue = false;
    private String zzcuf = "";
    private long zzcug = 0;
    private long zzcuh = 0;
    private int zzcui = -1;

    public zzkr(zzlb zzlbVar) {
        this.zzctq = zzlbVar.zzvs();
        this.zzctr = new zzks(this.zzctq);
    }

    public Resources getResources() {
        if (this.zzanu.zzcyc) {
            return this.mContext.getResources();
        }
        try {
            zztl zza = zztl.zza(this.mContext, zztl.Qm, ModuleDescriptor.MODULE_ID);
            if (zza == null) {
                return null;
            }
            return zza.zzbdt().getResources();
        } catch (zztl.zza e) {
            zzkx.zzc("Cannot load resource from dynamite apk or local jar", e);
            return null;
        }
    }

    public String getSessionId() {
        return this.zzctq;
    }

    public Bundle zza(Context context, zzkt zzktVar, String str) {
        Bundle bundle;
        synchronized (this.zzako) {
            bundle = new Bundle();
            bundle.putBundle("app", this.zzctr.zze(context, str));
            Bundle bundle2 = new Bundle();
            for (String str2 : this.zzctu.keySet()) {
                bundle2.putBundle(str2, this.zzctu.get(str2).toBundle());
            }
            bundle.putBundle("slots", bundle2);
            ArrayList<? extends Parcelable> arrayList = new ArrayList<>();
            Iterator<zzkp> it = this.zzctt.iterator();
            while (it.hasNext()) {
                arrayList.add(it.next().toBundle());
            }
            bundle.putParcelableArrayList("ads", arrayList);
            zzktVar.zza(this.zzctt);
            this.zzctt.clear();
        }
        return bundle;
    }

    public void zza(zzkp zzkpVar) {
        synchronized (this.zzako) {
            this.zzctt.add(zzkpVar);
        }
    }

    public void zza(String str, zzku zzkuVar) {
        synchronized (this.zzako) {
            this.zzctu.put(str, zzkuVar);
        }
    }

    public void zza(Throwable th, String str) {
        zzjg.zzb(this.mContext, this.zzanu).zza(th, str);
    }

    public void zzaf(boolean z) {
        synchronized (this.zzako) {
            if (this.zzcou != z) {
                zzkz.zze(this.mContext, z);
            }
            this.zzcou = z;
            zzda zzw = zzw(this.mContext);
            if (zzw != null && !zzw.isAlive()) {
                zzkx.zzdh("start fetching content...");
                zzw.zzjh();
            }
        }
    }

    public void zzag(boolean z) {
        synchronized (this.zzako) {
            if (this.zzcov != z) {
                zzkz.zze(this.mContext, z);
            }
            zzkz.zze(this.mContext, z);
            this.zzcov = z;
            zzda zzw = zzw(this.mContext);
            if (zzw != null && !zzw.isAlive()) {
                zzkx.zzdh("start fetching content...");
                zzw.zzjh();
            }
        }
    }

    public void zzah(boolean z) {
        this.zzcue = z;
    }

    public void zzai(boolean z) {
        synchronized (this.zzako) {
            this.zzcuc = z;
        }
    }

    public void zzb(Boolean bool) {
        synchronized (this.zzako) {
            this.zzcub = bool;
        }
    }

    public void zzb(HashSet<zzkp> hashSet) {
        synchronized (this.zzako) {
            this.zzctt.addAll(hashSet);
        }
    }

    public Future zzbf(int i) {
        Future zza;
        synchronized (this.zzako) {
            this.zzcui = i;
            zza = zzkz.zza(this.mContext, i);
        }
        return zza;
    }

    public Future zzc(Context context, boolean z) {
        Future future;
        synchronized (this.zzako) {
            if (z != this.zzcot) {
                this.zzcot = z;
                future = zzkz.zzc(context, z);
            } else {
                future = null;
            }
        }
        return future;
    }

    @TargetApi(23)
    public void zzc(Context context, VersionInfoParcel versionInfoParcel) {
        synchronized (this.zzako) {
            if (!this.zzaoz) {
                this.mContext = context.getApplicationContext();
                this.zzanu = versionInfoParcel;
                com.google.android.gms.ads.internal.zzu.zzgp().zza(this);
                zzkz.zza(context, this);
                zzkz.zzb(context, this);
                zzkz.zzc(context, this);
                zzkz.zzd(context, this);
                zzkz.zze(context, this);
                zzkz.zzf(context, this);
                zzkz.zzg(context, this);
                zzvh();
                this.zzbre = com.google.android.gms.ads.internal.zzu.zzgm().zzh(context, versionInfoParcel.zzda);
                if (com.google.android.gms.common.util.zzs.zzayy() && !NetworkSecurityPolicy.getInstance().isCleartextTrafficPermitted()) {
                    this.zzcud = true;
                }
                this.zzama = new zzco(context.getApplicationContext(), this.zzanu, com.google.android.gms.ads.internal.zzu.zzgm().zzd(context, versionInfoParcel));
                zzvj();
                com.google.android.gms.ads.internal.zzu.zzha().zzr(this.mContext);
                this.zzaoz = true;
            }
        }
    }

    public Future zzcw(String str) {
        Future zzf;
        synchronized (this.zzako) {
            if (str != null) {
                if (!str.equals(this.zzctz)) {
                    this.zzctz = str;
                    zzf = zzkz.zzf(this.mContext, str);
                }
            }
            zzf = null;
        }
        return zzf;
    }

    public Future zzcx(String str) {
        Future zzg;
        synchronized (this.zzako) {
            if (str != null) {
                if (!str.equals(this.zzcua)) {
                    this.zzcua = str;
                    zzg = zzkz.zzg(this.mContext, str);
                }
            }
            zzg = null;
        }
        return zzg;
    }

    public Future zzd(Context context, String str) {
        Future zza;
        this.zzcug = com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis();
        synchronized (this.zzako) {
            if (str != null) {
                if (!str.equals(this.zzcuf)) {
                    this.zzcuf = str;
                    zza = zzkz.zza(context, str, this.zzcug);
                }
            }
            zza = null;
        }
        return zza;
    }

    public Future zzd(Context context, boolean z) {
        Future future;
        synchronized (this.zzako) {
            if (z != this.zzcpd) {
                this.zzcpd = z;
                future = zzkz.zzf(context, z);
            } else {
                future = null;
            }
        }
        return future;
    }

    @Override // com.google.android.gms.internal.zzkz.zzb
    public void zzh(Bundle bundle) {
        synchronized (this.zzako) {
            this.zzcot = bundle.getBoolean("use_https", this.zzcot);
            this.zzctw = bundle.getInt("webview_cache_version", this.zzctw);
            if (bundle.containsKey("content_url_opted_out")) {
                zzaf(bundle.getBoolean("content_url_opted_out"));
            }
            if (bundle.containsKey("content_url_hashes")) {
                this.zzctz = bundle.getString("content_url_hashes");
            }
            this.zzcpd = bundle.getBoolean("auto_collect_location", this.zzcpd);
            if (bundle.containsKey("content_vertical_opted_out")) {
                zzag(bundle.getBoolean("content_vertical_opted_out"));
            }
            if (bundle.containsKey("content_vertical_hashes")) {
                this.zzcua = bundle.getString("content_vertical_hashes");
            }
            this.zzcuf = bundle.containsKey("app_settings_json") ? bundle.getString("app_settings_json") : this.zzcuf;
            this.zzcug = bundle.getLong("app_settings_last_update_ms", this.zzcug);
            this.zzcuh = bundle.getLong("app_last_background_time_ms", this.zzcuh);
            this.zzcui = bundle.getInt("request_in_session_count", this.zzcui);
        }
    }

    @Override // com.google.android.gms.internal.zzcz.zzb
    public void zzk(boolean z) {
        if (!z) {
            zzo(com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis());
            zzbf(this.zzctr.zzvd());
        } else if (com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis() - this.zzcuh > zzdr.zzbgb.get().longValue()) {
            this.zzctr.zzbg(-1);
        } else {
            this.zzctr.zzbg(this.zzcui);
        }
    }

    public Future zzo(long j) {
        Future future;
        synchronized (this.zzako) {
            if (this.zzcuh < j) {
                this.zzcuh = j;
                future = zzkz.zza(this.mContext, j);
            } else {
                future = null;
            }
        }
        return future;
    }

    public boolean zzuq() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzcou;
        }
        return z;
    }

    public boolean zzur() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzcov;
        }
        return z;
    }

    public String zzus() {
        String bigInteger;
        synchronized (this.zzako) {
            bigInteger = this.zzcts.toString();
            this.zzcts = this.zzcts.add(BigInteger.ONE);
        }
        return bigInteger;
    }

    public zzks zzut() {
        zzks zzksVar;
        synchronized (this.zzako) {
            zzksVar = this.zzctr;
        }
        return zzksVar;
    }

    public zzdt zzuu() {
        zzdt zzdtVar;
        synchronized (this.zzako) {
            zzdtVar = this.zzctx;
        }
        return zzdtVar;
    }

    public boolean zzuv() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzctv;
            this.zzctv = true;
        }
        return z;
    }

    public boolean zzuw() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzcot || this.zzcud;
        }
        return z;
    }

    public String zzux() {
        String str;
        synchronized (this.zzako) {
            str = this.zzbre;
        }
        return str;
    }

    public String zzuy() {
        String str;
        synchronized (this.zzako) {
            str = this.zzctz;
        }
        return str;
    }

    public String zzuz() {
        String str;
        synchronized (this.zzako) {
            str = this.zzcua;
        }
        return str;
    }

    public Boolean zzva() {
        Boolean bool;
        synchronized (this.zzako) {
            bool = this.zzcub;
        }
        return bool;
    }

    public boolean zzvb() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzcpd;
        }
        return z;
    }

    public long zzvc() {
        long j;
        synchronized (this.zzako) {
            j = this.zzcuh;
        }
        return j;
    }

    public int zzvd() {
        int i;
        synchronized (this.zzako) {
            i = this.zzcui;
        }
        return i;
    }

    public boolean zzve() {
        return this.zzcue;
    }

    public zzkq zzvf() {
        zzkq zzkqVar;
        synchronized (this.zzako) {
            zzkqVar = new zzkq(this.zzcuf, this.zzcug);
        }
        return zzkqVar;
    }

    public zzco zzvg() {
        return this.zzama;
    }

    public void zzvh() {
        zzjg.zzb(this.mContext, this.zzanu);
    }

    public boolean zzvi() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzcuc;
        }
        return z;
    }

    void zzvj() {
        try {
            this.zzctx = com.google.android.gms.ads.internal.zzu.zzgt().zza(new zzds(this.mContext, this.zzanu.zzda));
        } catch (IllegalArgumentException e) {
            zzkx.zzc("Cannot initialize CSI reporter.", e);
        }
    }

    public zzda zzw(Context context) {
        if (zzdr.zzbeu.get().booleanValue() && com.google.android.gms.common.util.zzs.zzayq()) {
            if (!zzdr.zzbfc.get().booleanValue() && !zzdr.zzbfa.get().booleanValue()) {
                return null;
            }
            if (zzuq() && zzur()) {
                return null;
            }
            synchronized (this.zzako) {
                if (Looper.getMainLooper() == null || context == null) {
                    return null;
                }
                if (this.zzawi == null) {
                    this.zzawi = new zzcy();
                }
                if (this.zzcty == null) {
                    this.zzcty = new zzda(this.zzawi, zzjg.zzb(this.mContext, this.zzanu));
                }
                this.zzcty.zzjh();
                return this.zzcty;
            }
        }
        return null;
    }
}
