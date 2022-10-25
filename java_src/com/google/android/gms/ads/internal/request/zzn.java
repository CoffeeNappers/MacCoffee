package com.google.android.gms.ads.internal.request;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.zza;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzfe;
import com.google.android.gms.internal.zzff;
import com.google.android.gms.internal.zzfj;
import com.google.android.gms.internal.zzge;
import com.google.android.gms.internal.zzgh;
import com.google.android.gms.internal.zzgi;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzjj;
import com.google.android.gms.internal.zzjm;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkw;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlg;
import com.google.android.gms.internal.zzlw;
import com.google.android.gms.internal.zzmd;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzn extends zzkw {
    private final Context mContext;
    private final Object zzcgi;
    private final zza.InterfaceC0022zza zzcjh;
    private final AdRequestInfoParcel.zza zzcji;
    private zzgh.zzc zzcmp;
    static final long zzcmk = TimeUnit.SECONDS.toMillis(10);
    private static final Object zzaox = new Object();
    static boolean zzcml = false;
    private static zzgh zzchl = null;
    private static zzff zzcmm = null;
    private static zzfj zzcmn = null;
    private static zzfe zzcmo = null;

    /* loaded from: classes.dex */
    public static class zza implements zzlg<zzge> {
        @Override // com.google.android.gms.internal.zzlg
        /* renamed from: zza */
        public void zzd(zzge zzgeVar) {
            zzn.zzc(zzgeVar);
        }
    }

    /* loaded from: classes.dex */
    public static class zzb implements zzlg<zzge> {
        @Override // com.google.android.gms.internal.zzlg
        /* renamed from: zza */
        public void zzd(zzge zzgeVar) {
            zzn.zzb(zzgeVar);
        }
    }

    /* loaded from: classes.dex */
    public static class zzc implements zzfe {
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            String str = map.get("request_id");
            String valueOf = String.valueOf(map.get("errors"));
            zzkx.zzdi(valueOf.length() != 0 ? "Invalid request: ".concat(valueOf) : new String("Invalid request: "));
            zzn.zzcmn.zzbe(str);
        }
    }

    public zzn(Context context, AdRequestInfoParcel.zza zzaVar, zza.InterfaceC0022zza interfaceC0022zza) {
        super(true);
        this.zzcgi = new Object();
        this.zzcjh = interfaceC0022zza;
        this.mContext = context;
        this.zzcji = zzaVar;
        synchronized (zzaox) {
            if (!zzcml) {
                zzcmn = new zzfj();
                zzcmm = new zzff(context.getApplicationContext(), zzaVar.zzari);
                zzcmo = new zzc();
                zzchl = new zzgh(this.mContext.getApplicationContext(), this.zzcji.zzari, zzdr.zzbcx.get(), new zzb(), new zza());
                zzcml = true;
            }
        }
    }

    private JSONObject zza(AdRequestInfoParcel adRequestInfoParcel, String str) {
        JSONObject zza2;
        AdvertisingIdClient.Info info;
        Bundle bundle = adRequestInfoParcel.zzcju.extras.getBundle("sdk_less_server_data");
        if (bundle == null || (zza2 = zzjm.zza(this.mContext, new zzjj().zzf(adRequestInfoParcel).zza(zzu.zzgv().zzv(this.mContext)))) == null) {
            return null;
        }
        try {
            info = AdvertisingIdClient.getAdvertisingIdInfo(this.mContext);
        } catch (GooglePlayServicesNotAvailableException | GooglePlayServicesRepairableException | IOException | IllegalStateException e) {
            zzkx.zzc("Cannot get advertising id info", e);
            info = null;
        }
        HashMap hashMap = new HashMap();
        hashMap.put("request_id", str);
        hashMap.put("request_param", zza2);
        hashMap.put("data", bundle);
        if (info != null) {
            hashMap.put("adid", info.getId());
            hashMap.put("lat", Integer.valueOf(info.isLimitAdTrackingEnabled() ? 1 : 0));
        }
        try {
            return zzu.zzgm().zzap(hashMap);
        } catch (JSONException e2) {
            return null;
        }
    }

    protected static void zzb(zzge zzgeVar) {
        zzgeVar.zza("/loadAd", zzcmn);
        zzgeVar.zza("/fetchHttpRequest", zzcmm);
        zzgeVar.zza("/invalidRequest", zzcmo);
    }

    protected static void zzc(zzge zzgeVar) {
        zzgeVar.zzb("/loadAd", zzcmn);
        zzgeVar.zzb("/fetchHttpRequest", zzcmm);
        zzgeVar.zzb("/invalidRequest", zzcmo);
    }

    private AdResponseParcel zze(AdRequestInfoParcel adRequestInfoParcel) {
        final String zzvr = zzu.zzgm().zzvr();
        final JSONObject zza2 = zza(adRequestInfoParcel, zzvr);
        if (zza2 == null) {
            return new AdResponseParcel(0);
        }
        long elapsedRealtime = zzu.zzgs().elapsedRealtime();
        Future<JSONObject> zzbd = zzcmn.zzbd(zzvr);
        com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.ads.internal.request.zzn.2
            @Override // java.lang.Runnable
            public void run() {
                zzn.this.zzcmp = zzn.zzchl.zzny();
                zzn.this.zzcmp.zza(new zzlw.zzc<zzgi>() { // from class: com.google.android.gms.ads.internal.request.zzn.2.1
                    @Override // com.google.android.gms.internal.zzlw.zzc
                    /* renamed from: zzb */
                    public void zzd(zzgi zzgiVar) {
                        try {
                            zzgiVar.zza("AFMA_getAdapterLessMediationAd", zza2);
                        } catch (Exception e) {
                            zzkx.zzb("Error requesting an ad url", e);
                            zzn.zzcmn.zzbe(zzvr);
                        }
                    }
                }, new zzlw.zza() { // from class: com.google.android.gms.ads.internal.request.zzn.2.2
                    @Override // com.google.android.gms.internal.zzlw.zza
                    public void run() {
                        zzn.zzcmn.zzbe(zzvr);
                    }
                });
            }
        });
        try {
            JSONObject jSONObject = zzbd.get(zzcmk - (zzu.zzgs().elapsedRealtime() - elapsedRealtime), TimeUnit.MILLISECONDS);
            if (jSONObject == null) {
                return new AdResponseParcel(-1);
            }
            AdResponseParcel zza3 = zzjm.zza(this.mContext, adRequestInfoParcel, jSONObject.toString());
            return (zza3.errorCode == -3 || !TextUtils.isEmpty(zza3.body)) ? zza3 : new AdResponseParcel(3);
        } catch (InterruptedException e) {
            return new AdResponseParcel(-1);
        } catch (CancellationException e2) {
            return new AdResponseParcel(-1);
        } catch (ExecutionException e3) {
            return new AdResponseParcel(0);
        } catch (TimeoutException e4) {
            return new AdResponseParcel(2);
        }
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
        synchronized (this.zzcgi) {
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.ads.internal.request.zzn.3
                @Override // java.lang.Runnable
                public void run() {
                    if (zzn.this.zzcmp != null) {
                        zzn.this.zzcmp.release();
                        zzn.this.zzcmp = null;
                    }
                }
            });
        }
    }

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        zzkx.zzdg("SdkLessAdLoaderBackgroundTask started.");
        AdRequestInfoParcel adRequestInfoParcel = new AdRequestInfoParcel(this.zzcji, null, -1L);
        AdResponseParcel zze = zze(adRequestInfoParcel);
        final zzko.zza zzaVar = new zzko.zza(adRequestInfoParcel, zze, null, null, zze.errorCode, zzu.zzgs().elapsedRealtime(), zze.zzclf, null);
        com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.ads.internal.request.zzn.1
            @Override // java.lang.Runnable
            public void run() {
                zzn.this.zzcjh.zza(zzaVar);
                if (zzn.this.zzcmp != null) {
                    zzn.this.zzcmp.release();
                    zzn.this.zzcmp = null;
                }
            }
        });
    }
}
