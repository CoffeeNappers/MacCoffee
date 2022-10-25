package com.google.android.gms.ads.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.client.zzz;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzle;
@zzji
/* loaded from: classes.dex */
public class zzo extends zzz.zza {
    private static final Object zzaox = new Object();
    @Nullable
    private static zzo zzaoy;
    private final Context mContext;
    private boolean zzapa;
    private VersionInfoParcel zzapc;
    private final Object zzako = new Object();
    private float zzapb = -1.0f;
    private boolean zzaoz = false;

    zzo(Context context, VersionInfoParcel versionInfoParcel) {
        this.mContext = context;
        this.zzapc = versionInfoParcel;
    }

    public static zzo zza(Context context, VersionInfoParcel versionInfoParcel) {
        zzo zzoVar;
        synchronized (zzaox) {
            if (zzaoy == null) {
                zzaoy = new zzo(context.getApplicationContext(), versionInfoParcel);
            }
            zzoVar = zzaoy;
        }
        return zzoVar;
    }

    @Nullable
    public static zzo zzfq() {
        zzo zzoVar;
        synchronized (zzaox) {
            zzoVar = zzaoy;
        }
        return zzoVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzz
    public void initialize() {
        synchronized (zzaox) {
            if (this.zzaoz) {
                zzkx.zzdi("Mobile ads is initialized already.");
                return;
            }
            this.zzaoz = true;
            zzdr.initialize(this.mContext);
            zzu.zzgq().zzc(this.mContext, this.zzapc);
            zzu.zzgr().initialize(this.mContext);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzz
    public void setAppMuted(boolean z) {
        synchronized (this.zzako) {
            this.zzapa = z;
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzz
    public void setAppVolume(float f) {
        synchronized (this.zzako) {
            this.zzapb = f;
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzz
    public void zzb(com.google.android.gms.dynamic.zzd zzdVar, String str) {
        zzle zzc = zzc(zzdVar, str);
        if (zzc == null) {
            zzkx.e("Context is null. Failed to open debug menu.");
        } else {
            zzc.showDialog();
        }
    }

    @Nullable
    protected zzle zzc(com.google.android.gms.dynamic.zzd zzdVar, String str) {
        Context context;
        if (zzdVar != null && (context = (Context) com.google.android.gms.dynamic.zze.zzae(zzdVar)) != null) {
            zzle zzleVar = new zzle(context);
            zzleVar.setAdUnitId(str);
            return zzleVar;
        }
        return null;
    }

    public float zzfr() {
        float f;
        synchronized (this.zzako) {
            f = this.zzapb;
        }
        return f;
    }

    public boolean zzfs() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzapb >= 0.0f;
        }
        return z;
    }

    public boolean zzft() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzapa;
        }
        return z;
    }

    @Override // com.google.android.gms.ads.internal.client.zzz
    public void zzz(String str) {
        zzdr.initialize(this.mContext);
        if (TextUtils.isEmpty(str) || !zzdr.zzbjv.get().booleanValue()) {
            return;
        }
        zzu.zzhi().zza(this.mContext, this.zzapc, true, null, str, null);
    }
}
