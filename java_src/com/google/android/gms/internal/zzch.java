package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.view.MotionEvent;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.internal.zzcj;
@zzji
/* loaded from: classes.dex */
public final class zzch extends zzcj.zza {
    private final zzau zzakt;
    private final zzav zzaku;
    private final zzas zzakv;
    private boolean zzakw = false;

    public zzch(String str, Context context, boolean z) {
        this.zzakt = zzau.zza(str, context, z);
        this.zzaku = new zzav(this.zzakt);
        this.zzakv = z ? null : zzas.zzc(context);
    }

    private com.google.android.gms.dynamic.zzd zza(com.google.android.gms.dynamic.zzd zzdVar, com.google.android.gms.dynamic.zzd zzdVar2, boolean z) {
        try {
            Uri uri = (Uri) com.google.android.gms.dynamic.zze.zzae(zzdVar);
            Context context = (Context) com.google.android.gms.dynamic.zze.zzae(zzdVar2);
            return com.google.android.gms.dynamic.zze.zzac(z ? this.zzaku.zza(uri, context) : this.zzaku.zzb(uri, context));
        } catch (zzaw e) {
            return null;
        }
    }

    @Override // com.google.android.gms.internal.zzcj
    public com.google.android.gms.dynamic.zzd zza(com.google.android.gms.dynamic.zzd zzdVar, com.google.android.gms.dynamic.zzd zzdVar2) {
        return zza(zzdVar, zzdVar2, true);
    }

    @Override // com.google.android.gms.internal.zzcj
    public String zza(com.google.android.gms.dynamic.zzd zzdVar, String str) {
        return this.zzakt.zzb((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), str);
    }

    @Override // com.google.android.gms.internal.zzcj
    public String zza(com.google.android.gms.dynamic.zzd zzdVar, byte[] bArr) {
        Context context = (Context) com.google.android.gms.dynamic.zze.zzae(zzdVar);
        String zza = this.zzakt.zza(context, bArr);
        if (this.zzakv == null || !this.zzakw) {
            return zza;
        }
        String zza2 = this.zzakv.zza(zza, this.zzakv.zza(context, bArr));
        this.zzakw = false;
        return zza2;
    }

    @Override // com.google.android.gms.internal.zzcj
    public boolean zza(com.google.android.gms.dynamic.zzd zzdVar) {
        return this.zzaku.zza((Uri) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzcj
    public com.google.android.gms.dynamic.zzd zzb(com.google.android.gms.dynamic.zzd zzdVar, com.google.android.gms.dynamic.zzd zzdVar2) {
        return zza(zzdVar, zzdVar2, false);
    }

    @Override // com.google.android.gms.internal.zzcj
    public void zzb(String str, String str2) {
        this.zzaku.zzb(str, str2);
    }

    @Override // com.google.android.gms.internal.zzcj
    public boolean zzb(com.google.android.gms.dynamic.zzd zzdVar) {
        return this.zzaku.zzc((Uri) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzcj
    public boolean zzb(String str, boolean z) {
        if (this.zzakv == null) {
            return false;
        }
        this.zzakv.zza(new AdvertisingIdClient.Info(str, z));
        this.zzakw = true;
        return true;
    }

    @Override // com.google.android.gms.internal.zzcj
    public String zzc(com.google.android.gms.dynamic.zzd zzdVar) {
        return zza(zzdVar, (byte[]) null);
    }

    @Override // com.google.android.gms.internal.zzcj
    public void zzd(com.google.android.gms.dynamic.zzd zzdVar) {
        this.zzaku.zza((MotionEvent) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzcj
    public String zzdx() {
        return "ms";
    }

    @Override // com.google.android.gms.internal.zzcj
    public void zzm(String str) {
        this.zzaku.zzm(str);
    }
}
