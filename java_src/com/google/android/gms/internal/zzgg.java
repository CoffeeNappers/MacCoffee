package com.google.android.gms.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzge;
import com.google.android.gms.internal.zzme;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzgg implements zzge {
    private final zzmd zzbnz;

    public zzgg(Context context, VersionInfoParcel versionInfoParcel, @Nullable zzav zzavVar, com.google.android.gms.ads.internal.zzd zzdVar) {
        this.zzbnz = com.google.android.gms.ads.internal.zzu.zzgn().zza(context, new AdSizeParcel(), false, false, zzavVar, versionInfoParcel, null, null, zzdVar);
        this.zzbnz.getWebView().setWillNotDraw(true);
    }

    private void runOnUiThread(Runnable runnable) {
        if (com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            runnable.run();
        } else {
            zzlb.zzcvl.post(runnable);
        }
    }

    @Override // com.google.android.gms.internal.zzge
    public void destroy() {
        this.zzbnz.destroy();
    }

    @Override // com.google.android.gms.internal.zzge
    public void zza(com.google.android.gms.ads.internal.client.zza zzaVar, com.google.android.gms.ads.internal.overlay.zzg zzgVar, zzfa zzfaVar, com.google.android.gms.ads.internal.overlay.zzp zzpVar, boolean z, zzfg zzfgVar, zzfi zzfiVar, com.google.android.gms.ads.internal.zze zzeVar, zzhw zzhwVar) {
        this.zzbnz.zzxc().zza(zzaVar, zzgVar, zzfaVar, zzpVar, z, zzfgVar, zzfiVar, new com.google.android.gms.ads.internal.zze(this.zzbnz.getContext(), false), zzhwVar, null);
    }

    @Override // com.google.android.gms.internal.zzge
    public void zza(final zzge.zza zzaVar) {
        this.zzbnz.zzxc().zza(new zzme.zza() { // from class: com.google.android.gms.internal.zzgg.6
            @Override // com.google.android.gms.internal.zzme.zza
            public void zza(zzmd zzmdVar, boolean z) {
                zzaVar.zznx();
            }
        });
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zza(String str, zzfe zzfeVar) {
        this.zzbnz.zzxc().zza(str, zzfeVar);
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zza(final String str, final JSONObject jSONObject) {
        runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzgg.1
            @Override // java.lang.Runnable
            public void run() {
                zzgg.this.zzbnz.zza(str, jSONObject);
            }
        });
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzb(String str, zzfe zzfeVar) {
        this.zzbnz.zzxc().zzb(str, zzfeVar);
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzb(String str, JSONObject jSONObject) {
        this.zzbnz.zzb(str, jSONObject);
    }

    @Override // com.google.android.gms.internal.zzge
    public void zzbo(String str) {
        final String format = String.format("<!DOCTYPE html><html><head><script src=\"%s\"></script></head><body></body></html>", str);
        runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzgg.3
            @Override // java.lang.Runnable
            public void run() {
                zzgg.this.zzbnz.loadData(format, "text/html", "UTF-8");
            }
        });
    }

    @Override // com.google.android.gms.internal.zzge
    public void zzbp(final String str) {
        runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzgg.5
            @Override // java.lang.Runnable
            public void run() {
                zzgg.this.zzbnz.loadUrl(str);
            }
        });
    }

    @Override // com.google.android.gms.internal.zzge
    public void zzbq(final String str) {
        runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzgg.4
            @Override // java.lang.Runnable
            public void run() {
                zzgg.this.zzbnz.loadData(str, "text/html", "UTF-8");
            }
        });
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzi(final String str, final String str2) {
        runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzgg.2
            @Override // java.lang.Runnable
            public void run() {
                zzgg.this.zzbnz.zzi(str, str2);
            }
        });
    }

    @Override // com.google.android.gms.internal.zzge
    public zzgj zznw() {
        return new zzgk(this);
    }
}
