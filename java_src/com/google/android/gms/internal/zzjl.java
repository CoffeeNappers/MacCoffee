package com.google.android.gms.internal;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.exoplayer2.extractor.ogg.DefaultOggSeeker;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.request.zzk;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzgh;
import com.google.android.gms.internal.zzjv;
import com.google.android.gms.internal.zzlw;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public final class zzjl extends zzk.zza {
    private static final Object zzaox = new Object();
    private static zzjl zzcnk;
    private final Context mContext;
    private final zzjk zzcnl;
    private final zzdk zzcnm;
    private final zzgh zzcnn;

    zzjl(Context context, zzdk zzdkVar, zzjk zzjkVar) {
        this.mContext = context;
        this.zzcnl = zzjkVar;
        this.zzcnm = zzdkVar;
        this.zzcnn = new zzgh(context.getApplicationContext() != null ? context.getApplicationContext() : context, VersionInfoParcel.zzwr(), zzdkVar.zzlo(), new zzlg<zzge>() { // from class: com.google.android.gms.internal.zzjl.4
            @Override // com.google.android.gms.internal.zzlg
            /* renamed from: zza */
            public void zzd(zzge zzgeVar) {
                zzgeVar.zza("/log", zzfd.zzbpr);
            }
        }, new zzgh.zzb());
    }

    private static AdResponseParcel zza(final Context context, final zzgh zzghVar, zzdk zzdkVar, final zzjk zzjkVar, final AdRequestInfoParcel adRequestInfoParcel) {
        Bundle bundle;
        zzlt zzltVar;
        String string;
        zzkx.zzdg("Starting ad request from service using: AFMA_getAd");
        zzdr.initialize(context);
        zzlt<Bundle> zzrl = zzjkVar.zzcni.zzrl();
        final zzdz zzdzVar = new zzdz(zzdr.zzbeq.get().booleanValue(), "load_ad", adRequestInfoParcel.zzarm.zzazq);
        if (adRequestInfoParcel.versionCode > 10 && adRequestInfoParcel.zzckl != -1) {
            zzdzVar.zza(zzdzVar.zzc(adRequestInfoParcel.zzckl), "cts");
        }
        zzdx zzlz = zzdzVar.zzlz();
        final Bundle bundle2 = (adRequestInfoParcel.versionCode < 4 || adRequestInfoParcel.zzckb == null) ? null : adRequestInfoParcel.zzckb;
        if (!zzdr.zzbfh.get().booleanValue() || zzjkVar.zzcna == null) {
            bundle = bundle2;
            zzltVar = null;
        } else {
            if (bundle2 == null && zzdr.zzbfi.get().booleanValue()) {
                zzkx.v("contentInfo is not present, but we'll still launch the app index task");
                bundle2 = new Bundle();
            }
            if (bundle2 != null) {
                bundle = bundle2;
                zzltVar = zzla.zza(new Callable<Void>() { // from class: com.google.android.gms.internal.zzjl.1
                    @Override // java.util.concurrent.Callable
                    /* renamed from: zzdo */
                    public Void call() throws Exception {
                        zzjk.this.zzcna.zza(context, adRequestInfoParcel.zzcjv.packageName, bundle2);
                        return null;
                    }
                });
            } else {
                bundle = bundle2;
                zzltVar = null;
            }
        }
        zzlr zzlrVar = new zzlr(null);
        Bundle bundle3 = adRequestInfoParcel.zzcju.extras;
        zzlr zza = (!adRequestInfoParcel.zzcks || (bundle3 != null && bundle3.getString("_ad") != null)) ? zzlrVar : zzjkVar.zzcnf.zza(adRequestInfoParcel.applicationInfo);
        zzjr zzv = com.google.android.gms.ads.internal.zzu.zzgv().zzv(context);
        if (zzv.zzcqe == -1) {
            zzkx.zzdg("Device is offline.");
            return new AdResponseParcel(2);
        }
        String uuid = adRequestInfoParcel.versionCode >= 7 ? adRequestInfoParcel.zzcki : UUID.randomUUID().toString();
        final zzjn zzjnVar = new zzjn(uuid, adRequestInfoParcel.applicationInfo.packageName);
        if (adRequestInfoParcel.zzcju.extras != null && (string = adRequestInfoParcel.zzcju.extras.getString("_ad")) != null) {
            return zzjm.zza(context, adRequestInfoParcel, string);
        }
        List<String> zza2 = zzjkVar.zzcnd.zza(adRequestInfoParcel);
        String zzg = zzjkVar.zzcnj.zzg(adRequestInfoParcel);
        zzjv zzjvVar = zzjkVar.zzcnh;
        if (zzltVar != null) {
            try {
                zzkx.v("Waiting for app index fetching task.");
                zzltVar.get(zzdr.zzbfj.get().longValue(), TimeUnit.MILLISECONDS);
                zzkx.v("App index fetching task completed.");
            } catch (InterruptedException e) {
                e = e;
                zzkx.zzc("Failed to fetch app index signal", e);
            } catch (ExecutionException e2) {
                e = e2;
                zzkx.zzc("Failed to fetch app index signal", e);
            } catch (TimeoutException e3) {
                zzkx.zzdg("Timed out waiting for app index fetching task");
            }
        }
        zzkk zzkkVar = zzjkVar.zzcnc;
        String str = adRequestInfoParcel.zzcjv.packageName;
        zzd(zzrl);
        JSONObject zza3 = zzjm.zza(context, new zzjj().zzf(adRequestInfoParcel).zza(zzv).zza((zzjv.zza) null).zzc(zzc(zza)).zze(zzd(zzrl)).zzcm(zzg).zzk(zza2).zzf(bundle).zzcn(null).zzi(zzjkVar.zzcnb.zzi(context)));
        if (zza3 == null) {
            return new AdResponseParcel(0);
        }
        if (adRequestInfoParcel.versionCode < 7) {
            try {
                zza3.put("request_id", uuid);
            } catch (JSONException e4) {
            }
        }
        try {
            zza3.put("prefetch_mode", "url");
        } catch (JSONException e5) {
            zzkx.zzc("Failed putting prefetch parameters to ad request.", e5);
        }
        final String jSONObject = zza3.toString();
        zzdzVar.zza(zzlz, "arc");
        final zzdx zzlz2 = zzdzVar.zzlz();
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzjl.2
            @Override // java.lang.Runnable
            public void run() {
                zzgh.zzc zzny = zzgh.this.zzny();
                zzjnVar.zzb(zzny);
                zzdzVar.zza(zzlz2, "rwc");
                final zzdx zzlz3 = zzdzVar.zzlz();
                zzny.zza(new zzlw.zzc<zzgi>() { // from class: com.google.android.gms.internal.zzjl.2.1
                    @Override // com.google.android.gms.internal.zzlw.zzc
                    /* renamed from: zzb */
                    public void zzd(zzgi zzgiVar) {
                        zzdzVar.zza(zzlz3, "jsf");
                        zzdzVar.zzma();
                        zzgiVar.zza("/invalidRequest", zzjnVar.zzcoc);
                        zzgiVar.zza("/loadAdURL", zzjnVar.zzcod);
                        zzgiVar.zza("/loadAd", zzjnVar.zzcoe);
                        try {
                            zzgiVar.zzi("AFMA_getAd", jSONObject);
                        } catch (Exception e6) {
                            zzkx.zzb("Error requesting an ad url", e6);
                        }
                    }
                }, new zzlw.zza() { // from class: com.google.android.gms.internal.zzjl.2.2
                    @Override // com.google.android.gms.internal.zzlw.zza
                    public void run() {
                    }
                });
            }
        });
        try {
            zzjq zzjqVar = zzjnVar.zztk().get(10L, TimeUnit.SECONDS);
            if (zzjqVar == null) {
                return new AdResponseParcel(0);
            }
            if (zzjqVar.getErrorCode() != -2) {
                return new AdResponseParcel(zzjqVar.getErrorCode());
            }
            if (zzdzVar.zzmd() != null) {
                zzdzVar.zza(zzdzVar.zzmd(), "rur");
            }
            AdResponseParcel adResponseParcel = null;
            if (!TextUtils.isEmpty(zzjqVar.zztq())) {
                adResponseParcel = zzjm.zza(context, adRequestInfoParcel, zzjqVar.zztq());
            }
            if (adResponseParcel == null && !TextUtils.isEmpty(zzjqVar.getUrl())) {
                adResponseParcel = zza(adRequestInfoParcel, context, adRequestInfoParcel.zzari.zzda, zzjqVar.getUrl(), null, zzjqVar, zzdzVar, zzjkVar);
            }
            if (adResponseParcel == null) {
                adResponseParcel = new AdResponseParcel(0);
            }
            zzdzVar.zza(zzlz, "tts");
            adResponseParcel.zzclo = zzdzVar.zzmb();
            return adResponseParcel;
        } catch (Exception e6) {
            return new AdResponseParcel(0);
        } finally {
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzjl.3
                @Override // java.lang.Runnable
                public void run() {
                    zzjk.this.zzcne.zza(context, zzjnVar, adRequestInfoParcel.zzari);
                }
            });
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:117:?, code lost:
        return r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x0193, code lost:
        com.google.android.gms.internal.zzkx.zzdi(new java.lang.StringBuilder(46).append("Received error HTTP response code: ").append(r9).toString());
        r3 = new com.google.android.gms.ads.internal.request.AdResponseParcel(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x01b2, code lost:
        r2.disconnect();
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x01b5, code lost:
        if (r20 == null) goto L98;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x01b7, code lost:
        r20.zzcng.zztt();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.google.android.gms.ads.internal.request.AdResponseParcel zza(com.google.android.gms.ads.internal.request.AdRequestInfoParcel r13, android.content.Context r14, java.lang.String r15, java.lang.String r16, java.lang.String r17, com.google.android.gms.internal.zzjq r18, com.google.android.gms.internal.zzdz r19, com.google.android.gms.internal.zzjk r20) {
        /*
            Method dump skipped, instructions count: 481
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzjl.zza(com.google.android.gms.ads.internal.request.AdRequestInfoParcel, android.content.Context, java.lang.String, java.lang.String, java.lang.String, com.google.android.gms.internal.zzjq, com.google.android.gms.internal.zzdz, com.google.android.gms.internal.zzjk):com.google.android.gms.ads.internal.request.AdResponseParcel");
    }

    public static zzjl zza(Context context, zzdk zzdkVar, zzjk zzjkVar) {
        zzjl zzjlVar;
        synchronized (zzaox) {
            if (zzcnk == null) {
                if (context.getApplicationContext() != null) {
                    context = context.getApplicationContext();
                }
                zzcnk = new zzjl(context, zzdkVar, zzjkVar);
            }
            zzjlVar = zzcnk;
        }
        return zzjlVar;
    }

    private static void zza(String str, Map<String, List<String>> map, String str2, int i) {
        if (zzkx.zzbi(2)) {
            zzkx.v(new StringBuilder(String.valueOf(str).length() + 39).append("Http Response: {\n  URL:\n    ").append(str).append("\n  Headers:").toString());
            if (map != null) {
                for (String str3 : map.keySet()) {
                    zzkx.v(new StringBuilder(String.valueOf(str3).length() + 5).append("    ").append(str3).append(":").toString());
                    for (String str4 : map.get(str3)) {
                        String valueOf = String.valueOf(str4);
                        zzkx.v(valueOf.length() != 0 ? "      ".concat(valueOf) : new String("      "));
                    }
                }
            }
            zzkx.v("  Body:");
            if (str2 != null) {
                for (int i2 = 0; i2 < Math.min(str2.length(), (int) DefaultOggSeeker.MATCH_BYTE_RANGE); i2 += 1000) {
                    zzkx.v(str2.substring(i2, Math.min(str2.length(), i2 + 1000)));
                }
            } else {
                zzkx.v("    null");
            }
            zzkx.v(new StringBuilder(34).append("  Response Code:\n    ").append(i).append("\n}").toString());
        }
    }

    private static Location zzc(zzlt<Location> zzltVar) {
        try {
            return zzltVar.get(zzdr.zzbjr.get().longValue(), TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            zzkx.zzc("Exception caught while getting location", e);
            return null;
        }
    }

    private static Bundle zzd(zzlt<Bundle> zzltVar) {
        Bundle bundle = new Bundle();
        try {
            return zzltVar.get(zzdr.zzbkj.get().longValue(), TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            zzkx.zzc("Exception caught while getting parental controls.", e);
            return bundle;
        }
    }

    @Override // com.google.android.gms.ads.internal.request.zzk
    public void zza(final AdRequestInfoParcel adRequestInfoParcel, final com.google.android.gms.ads.internal.request.zzl zzlVar) {
        com.google.android.gms.ads.internal.zzu.zzgq().zzc(this.mContext, adRequestInfoParcel.zzari);
        zzla.zza(new Runnable() { // from class: com.google.android.gms.internal.zzjl.5
            @Override // java.lang.Runnable
            public void run() {
                AdResponseParcel adResponseParcel;
                try {
                    adResponseParcel = zzjl.this.zzd(adRequestInfoParcel);
                } catch (Exception e) {
                    com.google.android.gms.ads.internal.zzu.zzgq().zza(e, "AdRequestServiceImpl.loadAdAsync");
                    zzkx.zzc("Could not fetch ad response due to an Exception.", e);
                    adResponseParcel = null;
                }
                if (adResponseParcel == null) {
                    adResponseParcel = new AdResponseParcel(0);
                }
                try {
                    zzlVar.zzb(adResponseParcel);
                } catch (RemoteException e2) {
                    zzkx.zzc("Fail to forward ad response.", e2);
                }
            }
        });
    }

    @Override // com.google.android.gms.ads.internal.request.zzk
    public AdResponseParcel zzd(AdRequestInfoParcel adRequestInfoParcel) {
        return zza(this.mContext, this.zzcnn, this.zzcnm, this.zzcnl, adRequestInfoParcel);
    }
}
