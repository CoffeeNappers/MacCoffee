package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.SystemClock;
import android.text.TextUtils;
import com.google.ads.mediation.AdUrlAdapter;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.formats.NativeAdOptions;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.internal.zzgu;
import com.google.android.gms.internal.zzhc;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzgt implements zzgu.zza {
    private final Context mContext;
    private final zzgz zzamf;
    private final NativeAdOptionsParcel zzanq;
    private final List<String> zzanr;
    private final VersionInfoParcel zzanu;
    private AdRequestParcel zzapj;
    private final AdSizeParcel zzapp;
    private final boolean zzasz;
    private final String zzbwa;
    private final long zzbwb;
    private final zzgq zzbwc;
    private final zzgp zzbwd;
    private final boolean zzbwe;
    private zzha zzbwf;
    private zzhc zzbwh;
    private final Object zzako = new Object();
    private int zzbwg = -2;

    public zzgt(Context context, String str, zzgz zzgzVar, zzgq zzgqVar, zzgp zzgpVar, AdRequestParcel adRequestParcel, AdSizeParcel adSizeParcel, VersionInfoParcel versionInfoParcel, boolean z, boolean z2, NativeAdOptionsParcel nativeAdOptionsParcel, List<String> list) {
        this.mContext = context;
        this.zzamf = zzgzVar;
        this.zzbwd = zzgpVar;
        if ("com.google.ads.mediation.customevent.CustomEventAdapter".equals(str)) {
            this.zzbwa = zzof();
        } else {
            this.zzbwa = str;
        }
        this.zzbwc = zzgqVar;
        this.zzbwb = zzgqVar.zzbvj != -1 ? zzgqVar.zzbvj : 10000L;
        this.zzapj = adRequestParcel;
        this.zzapp = adSizeParcel;
        this.zzanu = versionInfoParcel;
        this.zzasz = z;
        this.zzbwe = z2;
        this.zzanq = nativeAdOptionsParcel;
        this.zzanr = list;
    }

    private long zza(long j, long j2, long j3, long j4) {
        while (this.zzbwg == -2) {
            zzb(j, j2, j3, j4);
        }
        return com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime() - j;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(zzgs zzgsVar) {
        String zzbr = zzbr(this.zzbwd.zzbva);
        try {
            if (this.zzanu.zzcyb < 4100000) {
                if (this.zzapp.zzazr) {
                    this.zzbwf.zza(com.google.android.gms.dynamic.zze.zzac(this.mContext), this.zzapj, zzbr, zzgsVar);
                } else {
                    this.zzbwf.zza(com.google.android.gms.dynamic.zze.zzac(this.mContext), this.zzapp, this.zzapj, zzbr, zzgsVar);
                }
            } else if (this.zzasz) {
                this.zzbwf.zza(com.google.android.gms.dynamic.zze.zzac(this.mContext), this.zzapj, zzbr, this.zzbwd.zzbus, zzgsVar, this.zzanq, this.zzanr);
            } else if (this.zzapp.zzazr) {
                this.zzbwf.zza(com.google.android.gms.dynamic.zze.zzac(this.mContext), this.zzapj, zzbr, this.zzbwd.zzbus, zzgsVar);
            } else if (!this.zzbwe) {
                this.zzbwf.zza(com.google.android.gms.dynamic.zze.zzac(this.mContext), this.zzapp, this.zzapj, zzbr, this.zzbwd.zzbus, zzgsVar);
            } else if (this.zzbwd.zzbvd != null) {
                this.zzbwf.zza(com.google.android.gms.dynamic.zze.zzac(this.mContext), this.zzapj, zzbr, this.zzbwd.zzbus, zzgsVar, new NativeAdOptionsParcel(zzbs(this.zzbwd.zzbvh)), this.zzbwd.zzbvg);
            } else {
                this.zzbwf.zza(com.google.android.gms.dynamic.zze.zzac(this.mContext), this.zzapp, this.zzapj, zzbr, this.zzbwd.zzbus, zzgsVar);
            }
        } catch (RemoteException e) {
            zzkx.zzc("Could not request ad from mediation adapter.", e);
            zzad(5);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean zzae(int i) {
        try {
            Bundle zzop = this.zzasz ? this.zzbwf.zzop() : this.zzapp.zzazr ? this.zzbwf.getInterstitialAdapterInfo() : this.zzbwf.zzoo();
            if (zzop == null) {
                return false;
            }
            return (zzop.getInt("capabilities", 0) & i) == i;
        } catch (RemoteException e) {
            zzkx.zzdi("Could not get adapter info. Returning false");
            return false;
        }
    }

    private static zzhc zzaf(final int i) {
        return new zzhc.zza() { // from class: com.google.android.gms.internal.zzgt.2
            @Override // com.google.android.gms.internal.zzhc
            public int zzok() throws RemoteException {
                return i;
            }
        };
    }

    private void zzb(long j, long j2, long j3, long j4) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        long j5 = j2 - (elapsedRealtime - j);
        long j6 = j4 - (elapsedRealtime - j3);
        if (j5 <= 0 || j6 <= 0) {
            zzkx.zzdh("Timed out waiting for adapter.");
            this.zzbwg = 3;
            return;
        }
        try {
            this.zzako.wait(Math.min(j5, j6));
        } catch (InterruptedException e) {
            this.zzbwg = -1;
        }
    }

    private String zzbr(String str) {
        if (str == null || !zzoi() || zzae(2)) {
            return str;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            jSONObject.remove("cpm_floor_cents");
            return jSONObject.toString();
        } catch (JSONException e) {
            zzkx.zzdi("Could not remove field. Returning the original value");
            return str;
        }
    }

    private static NativeAdOptions zzbs(String str) {
        NativeAdOptions.Builder builder = new NativeAdOptions.Builder();
        if (str == null) {
            return builder.build();
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            builder.setRequestMultipleImages(jSONObject.optBoolean("multiple_images", false));
            builder.setReturnUrlsForImageAssets(jSONObject.optBoolean("only_urls", false));
            builder.setImageOrientation(zzbt(jSONObject.optString("native_image_orientation", "any")));
        } catch (JSONException e) {
            zzkx.zzc("Exception occurred when creating native ad options", e);
        }
        return builder.build();
    }

    private static int zzbt(String str) {
        if ("landscape".equals(str)) {
            return 2;
        }
        return "portrait".equals(str) ? 1 : 0;
    }

    private String zzof() {
        try {
            if (!TextUtils.isEmpty(this.zzbwd.zzbuw)) {
                return this.zzamf.zzbv(this.zzbwd.zzbuw) ? "com.google.android.gms.ads.mediation.customevent.CustomEventAdapter" : "com.google.ads.mediation.customevent.CustomEventAdapter";
            }
        } catch (RemoteException e) {
            zzkx.zzdi("Fail to determine the custom event's version, assuming the old one.");
        }
        return "com.google.ads.mediation.customevent.CustomEventAdapter";
    }

    private zzhc zzog() {
        if (this.zzbwg != 0 || !zzoi()) {
            return null;
        }
        try {
            if (zzae(4) && this.zzbwh != null && this.zzbwh.zzok() != 0) {
                return this.zzbwh;
            }
        } catch (RemoteException e) {
            zzkx.zzdi("Could not get cpm value from MediationResponseMetadata");
        }
        return zzaf(zzoj());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public zzha zzoh() {
        String valueOf = String.valueOf(this.zzbwa);
        zzkx.zzdh(valueOf.length() != 0 ? "Instantiating mediation adapter: ".concat(valueOf) : new String("Instantiating mediation adapter: "));
        if (!this.zzasz) {
            if (zzdr.zzbhh.get().booleanValue() && "com.google.ads.mediation.admob.AdMobAdapter".equals(this.zzbwa)) {
                return zza(new AdMobAdapter());
            }
            if (zzdr.zzbhi.get().booleanValue() && "com.google.ads.mediation.AdUrlAdapter".equals(this.zzbwa)) {
                return zza(new AdUrlAdapter());
            }
            if ("com.google.ads.mediation.admob.AdMobCustomTabsAdapter".equals(this.zzbwa)) {
                return new zzhg(new zzho());
            }
        }
        try {
            return this.zzamf.zzbu(this.zzbwa);
        } catch (RemoteException e) {
            String valueOf2 = String.valueOf(this.zzbwa);
            zzkx.zza(valueOf2.length() != 0 ? "Could not instantiate mediation adapter: ".concat(valueOf2) : new String("Could not instantiate mediation adapter: "), e);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean zzoi() {
        return this.zzbwc.zzbvt != -1;
    }

    private int zzoj() {
        if (this.zzbwd.zzbva == null) {
            return 0;
        }
        try {
            JSONObject jSONObject = new JSONObject(this.zzbwd.zzbva);
            if ("com.google.ads.mediation.admob.AdMobAdapter".equals(this.zzbwa)) {
                return jSONObject.optInt("cpm_cents", 0);
            }
            int optInt = zzae(2) ? jSONObject.optInt("cpm_floor_cents", 0) : 0;
            return optInt == 0 ? jSONObject.optInt("penalized_average_cpm_cents", 0) : optInt;
        } catch (JSONException e) {
            zzkx.zzdi("Could not convert to json. Returning 0");
            return 0;
        }
    }

    public void cancel() {
        synchronized (this.zzako) {
            try {
                if (this.zzbwf != null) {
                    this.zzbwf.destroy();
                }
            } catch (RemoteException e) {
                zzkx.zzc("Could not destroy mediation adapter.", e);
            }
            this.zzbwg = -1;
            this.zzako.notify();
        }
    }

    public zzgu zza(long j, long j2) {
        zzgu zzguVar;
        synchronized (this.zzako) {
            long elapsedRealtime = SystemClock.elapsedRealtime();
            final zzgs zzgsVar = new zzgs();
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzgt.1
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (zzgt.this.zzako) {
                        if (zzgt.this.zzbwg != -2) {
                            return;
                        }
                        zzgt.this.zzbwf = zzgt.this.zzoh();
                        if (zzgt.this.zzbwf == null) {
                            zzgt.this.zzad(4);
                        } else if (!zzgt.this.zzoi() || zzgt.this.zzae(1)) {
                            zzgsVar.zza(zzgt.this);
                            zzgt.this.zza(zzgsVar);
                        } else {
                            String str = zzgt.this.zzbwa;
                            zzkx.zzdi(new StringBuilder(String.valueOf(str).length() + 56).append("Ignoring adapter ").append(str).append(" as delayed impression is not supported").toString());
                            zzgt.this.zzad(2);
                        }
                    }
                }
            });
            zzguVar = new zzgu(this.zzbwd, this.zzbwf, this.zzbwa, zzgsVar, this.zzbwg, zzog(), zza(elapsedRealtime, this.zzbwb, j, j2));
        }
        return zzguVar;
    }

    protected zzha zza(MediationAdapter mediationAdapter) {
        return new zzhg(mediationAdapter);
    }

    @Override // com.google.android.gms.internal.zzgu.zza
    public void zza(int i, zzhc zzhcVar) {
        synchronized (this.zzako) {
            this.zzbwg = i;
            this.zzbwh = zzhcVar;
            this.zzako.notify();
        }
    }

    @Override // com.google.android.gms.internal.zzgu.zza
    public void zzad(int i) {
        synchronized (this.zzako) {
            this.zzbwg = i;
            this.zzako.notify();
        }
    }
}
