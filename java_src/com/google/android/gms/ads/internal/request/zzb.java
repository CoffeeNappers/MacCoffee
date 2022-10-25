package com.google.android.gms.ads.internal.request;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.webkit.CookieManager;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.zza;
import com.google.android.gms.ads.internal.request.zzc;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.internal.zzav;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzgq;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkw;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzla;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzld;
import com.google.android.gms.internal.zzlw;
import com.google.android.gms.internal.zzlx;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzb extends zzkw implements zzc.zza {
    private final Context mContext;
    private final zzav zzbnx;
    zzgq zzbwc;
    private AdRequestInfoParcel zzbws;
    AdResponseParcel zzcgg;
    private Runnable zzcgh;
    private final Object zzcgi = new Object();
    private final zza.InterfaceC0022zza zzcjh;
    private final AdRequestInfoParcel.zza zzcji;
    zzld zzcjj;

    /* JADX INFO: Access modifiers changed from: package-private */
    @zzji
    /* loaded from: classes.dex */
    public static final class zza extends Exception {
        private final int zzcgw;

        public zza(String str, int i) {
            super(str);
            this.zzcgw = i;
        }

        public int getErrorCode() {
            return this.zzcgw;
        }
    }

    public zzb(Context context, AdRequestInfoParcel.zza zzaVar, zzav zzavVar, zza.InterfaceC0022zza interfaceC0022zza) {
        this.zzcjh = interfaceC0022zza;
        this.mContext = context;
        this.zzcji = zzaVar;
        this.zzbnx = zzavVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzd(int i, String str) {
        if (i == 3 || i == -1) {
            zzkx.zzdh(str);
        } else {
            zzkx.zzdi(str);
        }
        if (this.zzcgg == null) {
            this.zzcgg = new AdResponseParcel(i);
        } else {
            this.zzcgg = new AdResponseParcel(i, this.zzcgg.zzbvq);
        }
        this.zzcjh.zza(new zzko.zza(this.zzbws != null ? this.zzbws : new AdRequestInfoParcel(this.zzcji, null, -1L), this.zzcgg, this.zzbwc, null, i, -1L, this.zzcgg.zzclf, null));
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
        synchronized (this.zzcgi) {
            if (this.zzcjj != null) {
                this.zzcjj.cancel();
            }
        }
    }

    zzld zza(VersionInfoParcel versionInfoParcel, zzlw<AdRequestInfoParcel> zzlwVar) {
        return zzc.zza(this.mContext, versionInfoParcel, zzlwVar, this);
    }

    protected AdSizeParcel zzb(AdRequestInfoParcel adRequestInfoParcel) throws zza {
        AdSizeParcel[] adSizeParcelArr;
        AdSizeParcel[] adSizeParcelArr2;
        if (this.zzcgg.zzazu) {
            for (AdSizeParcel adSizeParcel : adRequestInfoParcel.zzarm.zzazs) {
                if (adSizeParcel.zzazu) {
                    return new AdSizeParcel(adSizeParcel, adRequestInfoParcel.zzarm.zzazs);
                }
            }
        }
        if (this.zzcgg.zzcle == null) {
            throw new zza("The ad response must specify one of the supported ad sizes.", 0);
        }
        String[] split = this.zzcgg.zzcle.split("x");
        if (split.length != 2) {
            String valueOf = String.valueOf(this.zzcgg.zzcle);
            throw new zza(valueOf.length() != 0 ? "Invalid ad size format from the ad response: ".concat(valueOf) : new String("Invalid ad size format from the ad response: "), 0);
        }
        try {
            int parseInt = Integer.parseInt(split[0]);
            int parseInt2 = Integer.parseInt(split[1]);
            for (AdSizeParcel adSizeParcel2 : adRequestInfoParcel.zzarm.zzazs) {
                float f = this.mContext.getResources().getDisplayMetrics().density;
                int i = adSizeParcel2.width == -1 ? (int) (adSizeParcel2.widthPixels / f) : adSizeParcel2.width;
                int i2 = adSizeParcel2.height == -2 ? (int) (adSizeParcel2.heightPixels / f) : adSizeParcel2.height;
                if (parseInt == i && parseInt2 == i2 && !adSizeParcel2.zzazu) {
                    return new AdSizeParcel(adSizeParcel2, adRequestInfoParcel.zzarm.zzazs);
                }
            }
            String valueOf2 = String.valueOf(this.zzcgg.zzcle);
            throw new zza(valueOf2.length() != 0 ? "The ad size from the ad response was not one of the requested sizes: ".concat(valueOf2) : new String("The ad size from the ad response was not one of the requested sizes: "), 0);
        } catch (NumberFormatException e) {
            String valueOf3 = String.valueOf(this.zzcgg.zzcle);
            throw new zza(valueOf3.length() != 0 ? "Invalid ad size number from the ad response: ".concat(valueOf3) : new String("Invalid ad size number from the ad response: "), 0);
        }
    }

    @Override // com.google.android.gms.ads.internal.request.zzc.zza
    public void zzb(@NonNull AdResponseParcel adResponseParcel) {
        JSONObject jSONObject;
        zzkx.zzdg("Received ad response.");
        this.zzcgg = adResponseParcel;
        long elapsedRealtime = zzu.zzgs().elapsedRealtime();
        synchronized (this.zzcgi) {
            this.zzcjj = null;
        }
        zzu.zzgq().zzd(this.mContext, this.zzcgg.zzcks);
        try {
            if (this.zzcgg.errorCode != -2 && this.zzcgg.errorCode != -3) {
                throw new zza(new StringBuilder(66).append("There was a problem getting an ad response. ErrorCode: ").append(this.zzcgg.errorCode).toString(), this.zzcgg.errorCode);
            }
            zzta();
            AdSizeParcel zzb = this.zzbws.zzarm.zzazs != null ? zzb(this.zzbws) : null;
            zzu.zzgq().zzaf(this.zzcgg.zzcll);
            zzu.zzgq().zzag(this.zzcgg.zzcly);
            if (!TextUtils.isEmpty(this.zzcgg.zzclj)) {
                try {
                    jSONObject = new JSONObject(this.zzcgg.zzclj);
                } catch (Exception e) {
                    zzkx.zzb("Error parsing the JSON for Active View.", e);
                }
                this.zzcjh.zza(new zzko.zza(this.zzbws, this.zzcgg, this.zzbwc, zzb, -2, elapsedRealtime, this.zzcgg.zzclf, jSONObject));
                zzlb.zzcvl.removeCallbacks(this.zzcgh);
            }
            jSONObject = null;
            this.zzcjh.zza(new zzko.zza(this.zzbws, this.zzcgg, this.zzbwc, zzb, -2, elapsedRealtime, this.zzcgg.zzclf, jSONObject));
            zzlb.zzcvl.removeCallbacks(this.zzcgh);
        } catch (zza e2) {
            zzd(e2.getErrorCode(), e2.getMessage());
            zzlb.zzcvl.removeCallbacks(this.zzcgh);
        }
    }

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        zzkx.zzdg("AdLoaderBackgroundTask started.");
        this.zzcgh = new Runnable() { // from class: com.google.android.gms.ads.internal.request.zzb.1
            @Override // java.lang.Runnable
            public void run() {
                synchronized (zzb.this.zzcgi) {
                    if (zzb.this.zzcjj == null) {
                        return;
                    }
                    zzb.this.onStop();
                    zzb.this.zzd(2, "Timed out waiting for ad response.");
                }
            }
        };
        zzlb.zzcvl.postDelayed(this.zzcgh, zzdr.zzbhj.get().longValue());
        final zzlx zzlxVar = new zzlx();
        long elapsedRealtime = zzu.zzgs().elapsedRealtime();
        zzla.zza(new Runnable() { // from class: com.google.android.gms.ads.internal.request.zzb.2
            @Override // java.lang.Runnable
            public void run() {
                synchronized (zzb.this.zzcgi) {
                    zzb.this.zzcjj = zzb.this.zza(zzb.this.zzcji.zzari, zzlxVar);
                    if (zzb.this.zzcjj == null) {
                        zzb.this.zzd(0, "Could not start the ad request service.");
                        zzlb.zzcvl.removeCallbacks(zzb.this.zzcgh);
                    }
                }
            }
        });
        this.zzbws = new AdRequestInfoParcel(this.zzcji, this.zzbnx.zzaz().zzb(this.mContext), elapsedRealtime);
        zzlxVar.zzg(this.zzbws);
    }

    protected void zzta() throws zza {
        if (this.zzcgg.errorCode == -3) {
            return;
        }
        if (TextUtils.isEmpty(this.zzcgg.body)) {
            throw new zza("No fill from ad server.", 3);
        }
        zzu.zzgq().zzc(this.mContext, this.zzcgg.zzckc);
        if (this.zzcgg.zzclb) {
            try {
                this.zzbwc = new zzgq(this.zzcgg.body);
                zzu.zzgq().zzah(this.zzbwc.zzbvo);
            } catch (JSONException e) {
                zzkx.zzb("Could not parse mediation config.", e);
                String valueOf = String.valueOf(this.zzcgg.body);
                throw new zza(valueOf.length() != 0 ? "Could not parse mediation config: ".concat(valueOf) : new String("Could not parse mediation config: "), 0);
            }
        } else {
            zzu.zzgq().zzah(this.zzcgg.zzbvo);
        }
        if (TextUtils.isEmpty(this.zzcgg.zzckt) || !zzdr.zzbkn.get().booleanValue()) {
            return;
        }
        zzkx.zzdg("Received cookie from server. Setting webview cookie in CookieManager.");
        CookieManager zzal = zzu.zzgo().zzal(this.mContext);
        if (zzal == null) {
            return;
        }
        zzal.setCookie("googleads.g.doubleclick.net", this.zzcgg.zzckt);
    }
}
