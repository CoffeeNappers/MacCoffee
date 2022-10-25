package com.google.android.gms.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import android.view.View;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzcp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;
@zzji
/* loaded from: classes.dex */
public class zzco implements zzcq {
    private final VersionInfoParcel zzanu;
    private final Context zzatc;
    private final zzgh zzatd;
    private final Object zzako = new Object();
    private final WeakHashMap<zzko, zzcp> zzata = new WeakHashMap<>();
    private final ArrayList<zzcp> zzatb = new ArrayList<>();

    public zzco(Context context, VersionInfoParcel versionInfoParcel, zzgh zzghVar) {
        this.zzatc = context.getApplicationContext();
        this.zzanu = versionInfoParcel;
        this.zzatd = zzghVar;
    }

    public void zza(AdSizeParcel adSizeParcel, zzko zzkoVar) {
        zza(adSizeParcel, zzkoVar, zzkoVar.zzcbm.getView());
    }

    public void zza(AdSizeParcel adSizeParcel, zzko zzkoVar, View view) {
        zza(adSizeParcel, zzkoVar, new zzcp.zzd(view, zzkoVar), (zzgi) null);
    }

    public void zza(AdSizeParcel adSizeParcel, zzko zzkoVar, View view, zzgi zzgiVar) {
        zza(adSizeParcel, zzkoVar, new zzcp.zzd(view, zzkoVar), zzgiVar);
    }

    public void zza(AdSizeParcel adSizeParcel, zzko zzkoVar, com.google.android.gms.ads.internal.formats.zzi zziVar) {
        zza(adSizeParcel, zzkoVar, new zzcp.zza(zziVar), (zzgi) null);
    }

    public void zza(AdSizeParcel adSizeParcel, zzko zzkoVar, zzcw zzcwVar, @Nullable zzgi zzgiVar) {
        zzcp zzcpVar;
        synchronized (this.zzako) {
            if (zzi(zzkoVar)) {
                zzcpVar = this.zzata.get(zzkoVar);
            } else {
                zzcpVar = new zzcp(this.zzatc, adSizeParcel, zzkoVar, this.zzanu, zzcwVar);
                zzcpVar.zza(this);
                this.zzata.put(zzkoVar, zzcpVar);
                this.zzatb.add(zzcpVar);
            }
            if (zzgiVar != null) {
                zzcpVar.zza(new zzcr(zzcpVar, zzgiVar));
            } else {
                zzcpVar.zza(new zzcs(zzcpVar, this.zzatd));
            }
        }
    }

    @Override // com.google.android.gms.internal.zzcq
    public void zza(zzcp zzcpVar) {
        synchronized (this.zzako) {
            if (!zzcpVar.zzii()) {
                this.zzatb.remove(zzcpVar);
                Iterator<Map.Entry<zzko, zzcp>> it = this.zzata.entrySet().iterator();
                while (it.hasNext()) {
                    if (it.next().getValue() == zzcpVar) {
                        it.remove();
                    }
                }
            }
        }
    }

    public boolean zzi(zzko zzkoVar) {
        boolean z;
        synchronized (this.zzako) {
            zzcp zzcpVar = this.zzata.get(zzkoVar);
            z = zzcpVar != null && zzcpVar.zzii();
        }
        return z;
    }

    public void zzj(zzko zzkoVar) {
        synchronized (this.zzako) {
            zzcp zzcpVar = this.zzata.get(zzkoVar);
            if (zzcpVar != null) {
                zzcpVar.zzig();
            }
        }
    }

    public void zzk(zzko zzkoVar) {
        synchronized (this.zzako) {
            zzcp zzcpVar = this.zzata.get(zzkoVar);
            if (zzcpVar != null) {
                zzcpVar.stop();
            }
        }
    }

    public void zzl(zzko zzkoVar) {
        synchronized (this.zzako) {
            zzcp zzcpVar = this.zzata.get(zzkoVar);
            if (zzcpVar != null) {
                zzcpVar.pause();
            }
        }
    }

    public void zzm(zzko zzkoVar) {
        synchronized (this.zzako) {
            zzcp zzcpVar = this.zzata.get(zzkoVar);
            if (zzcpVar != null) {
                zzcpVar.resume();
            }
        }
    }
}
