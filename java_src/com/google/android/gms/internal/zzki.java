package com.google.android.gms.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.gms.internal.zzkd;
import com.google.android.gms.internal.zzko;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.Future;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzki extends zzkw implements zzkh {
    private final Context mContext;
    private final Object zzako;
    private final zzko.zza zzcgf;
    private final long zzcri;
    private final ArrayList<Future> zzcrt;
    private final ArrayList<String> zzcru;
    private final HashMap<String, zzkc> zzcrv;
    private final List<zzkd> zzcrw;
    private final HashSet<String> zzcrx;
    private final zzkb zzcry;

    public zzki(Context context, zzko.zza zzaVar, zzkb zzkbVar) {
        this(context, zzaVar, zzkbVar, zzdr.zzbfy.get().longValue());
    }

    zzki(Context context, zzko.zza zzaVar, zzkb zzkbVar, long j) {
        this.zzcrt = new ArrayList<>();
        this.zzcru = new ArrayList<>();
        this.zzcrv = new HashMap<>();
        this.zzcrw = new ArrayList();
        this.zzcrx = new HashSet<>();
        this.zzako = new Object();
        this.mContext = context;
        this.zzcgf = zzaVar;
        this.zzcry = zzkbVar;
        this.zzcri = j;
    }

    private zzko zza(int i, @Nullable String str, @Nullable zzgp zzgpVar) {
        return new zzko(this.zzcgf.zzcmx.zzcju, null, this.zzcgf.zzcsu.zzbvk, i, this.zzcgf.zzcsu.zzbvl, this.zzcgf.zzcsu.zzcld, this.zzcgf.zzcsu.orientation, this.zzcgf.zzcsu.zzbvq, this.zzcgf.zzcmx.zzcjx, this.zzcgf.zzcsu.zzclb, zzgpVar, null, str, this.zzcgf.zzcsk, null, this.zzcgf.zzcsu.zzclc, this.zzcgf.zzarm, this.zzcgf.zzcsu.zzcla, this.zzcgf.zzcso, this.zzcgf.zzcsu.zzclf, this.zzcgf.zzcsu.zzclg, this.zzcgf.zzcsi, null, this.zzcgf.zzcsu.zzclq, this.zzcgf.zzcsu.zzclr, this.zzcgf.zzcsu.zzcls, this.zzcgf.zzcsu.zzclt, this.zzcgf.zzcsu.zzclu, zzub(), this.zzcgf.zzcsu.zzbvn, this.zzcgf.zzcsu.zzclx);
    }

    private zzko zza(String str, zzgp zzgpVar) {
        return zza(-2, str, zzgpVar);
    }

    private static String zza(zzkd zzkdVar) {
        String str = zzkdVar.zzbuv;
        int zzar = zzar(zzkdVar.errorCode);
        return new StringBuilder(String.valueOf(str).length() + 33).append(str).append(".").append(zzar).append(".").append(zzkdVar.zzbwr).toString();
    }

    private void zza(String str, String str2, zzgp zzgpVar) {
        synchronized (this.zzako) {
            zzkj zzcp = this.zzcry.zzcp(str);
            if (zzcp == null || zzcp.zzud() == null || zzcp.zzuc() == null) {
                this.zzcrw.add(new zzkd.zza().zzcs(zzgpVar.zzbuv).zzcr(str).zzl(0L).zzbc(7).zztz());
                return;
            }
            zzkc zza = zza(str, str2, zzgpVar, zzcp);
            this.zzcrt.add((Future) zza.zzrz());
            this.zzcru.add(str);
            this.zzcrv.put(str, zza);
        }
    }

    private static int zzar(int i) {
        switch (i) {
            case 3:
                return 1;
            case 4:
                return 2;
            case 5:
                return 4;
            case 6:
                return 0;
            case 7:
                return 3;
            default:
                return 6;
        }
    }

    private zzko zzua() {
        return zza(3, (String) null, (zzgp) null);
    }

    private String zzub() {
        StringBuilder sb = new StringBuilder("");
        if (this.zzcrw == null) {
            return sb.toString();
        }
        for (zzkd zzkdVar : this.zzcrw) {
            if (zzkdVar != null && !TextUtils.isEmpty(zzkdVar.zzbuv)) {
                sb.append(String.valueOf(zza(zzkdVar)).concat(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR));
            }
        }
        return sb.substring(0, Math.max(0, sb.length() - 1));
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
    }

    protected zzkc zza(String str, String str2, zzgp zzgpVar, zzkj zzkjVar) {
        return new zzkc(this.mContext, str, str2, zzgpVar, this.zzcgf, zzkjVar, this, this.zzcri);
    }

    @Override // com.google.android.gms.internal.zzkh
    public void zza(String str, int i) {
    }

    @Override // com.google.android.gms.internal.zzkh
    public void zzcq(String str) {
        synchronized (this.zzako) {
            this.zzcrx.add(str);
        }
    }

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        zzkc zzkcVar;
        zzkc zzkcVar2;
        zzkc zzkcVar3;
        zzkc zzkcVar4;
        for (zzgp zzgpVar : this.zzcgf.zzcsk.zzbvi) {
            String str = zzgpVar.zzbva;
            for (String str2 : zzgpVar.zzbuu) {
                if ("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter".equals(str2) || "com.google.ads.mediation.customevent.CustomEventAdapter".equals(str2)) {
                    try {
                        str2 = new JSONObject(str).getString("class_name");
                    } catch (JSONException e) {
                        zzkx.zzb("Unable to determine custom event class name, skipping...", e);
                    }
                }
                zza(str2, str, zzgpVar);
            }
        }
        for (int i = 0; i < this.zzcrt.size(); i++) {
            try {
                try {
                    try {
                        this.zzcrt.get(i).get();
                        synchronized (this.zzako) {
                            String str3 = this.zzcru.get(i);
                            if (!TextUtils.isEmpty(str3) && (zzkcVar4 = this.zzcrv.get(str3)) != null) {
                                this.zzcrw.add(zzkcVar4.zztw());
                            }
                        }
                        synchronized (this.zzako) {
                            if (this.zzcrx.contains(this.zzcru.get(i))) {
                                String str4 = this.zzcru.get(i);
                                final zzko zza = zza(str4, this.zzcrv.get(str4) != null ? this.zzcrv.get(str4).zztx() : null);
                                com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzki.1
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        zzki.this.zzcry.zzb(zza);
                                    }
                                });
                                return;
                            }
                        }
                        continue;
                    } catch (Exception e2) {
                        zzkx.zzc("Unable to resolve rewarded adapter.", e2);
                        synchronized (this.zzako) {
                            String str5 = this.zzcru.get(i);
                            if (!TextUtils.isEmpty(str5) && (zzkcVar2 = this.zzcrv.get(str5)) != null) {
                                this.zzcrw.add(zzkcVar2.zztw());
                            }
                            continue;
                        }
                    }
                } catch (InterruptedException e3) {
                    Thread.currentThread().interrupt();
                    synchronized (this.zzako) {
                        String str6 = this.zzcru.get(i);
                        if (!TextUtils.isEmpty(str6) && (zzkcVar = this.zzcrv.get(str6)) != null) {
                            this.zzcrw.add(zzkcVar.zztw());
                        }
                    }
                }
            } catch (Throwable th) {
                synchronized (this.zzako) {
                    String str7 = this.zzcru.get(i);
                    if (!TextUtils.isEmpty(str7) && (zzkcVar3 = this.zzcrv.get(str7)) != null) {
                        this.zzcrw.add(zzkcVar3.zztw());
                    }
                    throw th;
                }
            }
        }
        final zzko zzua = zzua();
        com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzki.2
            @Override // java.lang.Runnable
            public void run() {
                zzki.this.zzcry.zzb(zzua);
            }
        });
    }
}
