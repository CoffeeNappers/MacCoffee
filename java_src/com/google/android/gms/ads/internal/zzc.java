package com.google.android.gms.ads.internal;

import android.content.Context;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.view.MotionEvent;
import android.view.View;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzea;
import com.google.android.gms.internal.zzed;
import com.google.android.gms.internal.zzfe;
import com.google.android.gms.internal.zzgi;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzhw;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzmd;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public abstract class zzc extends zzb implements zzh, zzhw {
    public zzc(Context context, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, VersionInfoParcel versionInfoParcel, zzd zzdVar) {
        super(context, adSizeParcel, str, zzgzVar, versionInfoParcel, zzdVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzmd zza(zzko.zza zzaVar, @Nullable zze zzeVar, @Nullable com.google.android.gms.ads.internal.safebrowsing.zzc zzcVar) {
        zzmd zzmdVar = null;
        View nextView = this.zzaly.zzarj.getNextView();
        if (nextView instanceof zzmd) {
            zzmdVar = (zzmd) nextView;
            if (zzdr.zzbft.get().booleanValue()) {
                zzkx.zzdg("Reusing webview...");
                zzmdVar.zza(this.zzaly.zzahs, this.zzaly.zzarm, this.zzalt);
            } else {
                zzmdVar.destroy();
                zzmdVar = null;
            }
        }
        if (zzmdVar == null) {
            if (nextView != null) {
                this.zzaly.zzarj.removeView(nextView);
            }
            zzmdVar = zzu.zzgn().zza(this.zzaly.zzahs, this.zzaly.zzarm, false, false, this.zzaly.zzarh, this.zzaly.zzari, this.zzalt, this, this.zzamb);
            if (this.zzaly.zzarm.zzazs == null) {
                zzb(zzmdVar.getView());
            }
        }
        zzmd zzmdVar2 = zzmdVar;
        zzmdVar2.zzxc().zza(this, this, this, this, false, this, null, zzeVar, this, zzcVar);
        zza(zzmdVar2);
        zzmdVar2.zzdk(zzaVar.zzcmx.zzcki);
        return zzmdVar2;
    }

    @Override // com.google.android.gms.internal.zzhw
    public void zza(int i, int i2, int i3, int i4) {
        zzem();
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void zza(zzed zzedVar) {
        zzaa.zzhs("setOnCustomRenderedAdLoadedListener must be called on the main UI thread.");
        this.zzaly.zzasc = zzedVar;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zza(zzgi zzgiVar) {
        zzgiVar.zza("/trackActiveViewUnit", new zzfe() { // from class: com.google.android.gms.ads.internal.zzc.1
            @Override // com.google.android.gms.internal.zzfe
            public void zza(zzmd zzmdVar, Map<String, String> map) {
                if (zzc.this.zzaly.zzarn != null) {
                    zzc.this.zzama.zza(zzc.this.zzaly.zzarm, zzc.this.zzaly.zzarn, zzmdVar.getView(), zzmdVar);
                } else {
                    zzkx.zzdi("Request to enable ActiveView before adState is available.");
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.ads.internal.zza
    public void zza(final zzko.zza zzaVar, final zzdz zzdzVar) {
        if (zzaVar.errorCode != -2) {
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.zzc.2
                @Override // java.lang.Runnable
                public void run() {
                    zzc.this.zzb(new zzko(zzaVar, null, null, null, null, null, null, null));
                }
            });
            return;
        }
        if (zzaVar.zzarm != null) {
            this.zzaly.zzarm = zzaVar.zzarm;
        }
        if (zzaVar.zzcsu.zzclb && !zzaVar.zzcsu.zzazv) {
            this.zzaly.zzasi = 0;
            this.zzaly.zzarl = zzu.zzgl().zza(this.zzaly.zzahs, this, zzaVar, this.zzaly.zzarh, null, this.zzamf, this, zzdzVar);
            return;
        }
        com.google.android.gms.ads.internal.safebrowsing.zzd zzdVar = this.zzamb.zzams;
        Context context = this.zzaly.zzahs;
        AdResponseParcel adResponseParcel = zzaVar.zzcsu;
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.zzc.3
            @Override // java.lang.Runnable
            public void run() {
                if (zzaVar.zzcsu.zzclk && zzc.this.zzaly.zzasc != null) {
                    String str = null;
                    if (zzaVar.zzcsu.zzcbo != null) {
                        str = zzu.zzgm().zzcz(zzaVar.zzcsu.zzcbo);
                    }
                    zzea zzeaVar = new zzea(zzc.this, str, zzaVar.zzcsu.body);
                    zzc.this.zzaly.zzasi = 1;
                    try {
                        zzc.this.zzalw = false;
                        zzc.this.zzaly.zzasc.zza(zzeaVar);
                        return;
                    } catch (RemoteException e) {
                        zzkx.zzc("Could not call the onCustomRenderedAdLoadedListener.", e);
                        zzc.this.zzalw = true;
                    }
                }
                final zze zzeVar = new zze(zzc.this.zzaly.zzahs, zzaVar);
                zzmd zza = zzc.this.zza(zzaVar, zzeVar, r3);
                zza.setOnTouchListener(new View.OnTouchListener() { // from class: com.google.android.gms.ads.internal.zzc.3.1
                    @Override // android.view.View.OnTouchListener
                    public boolean onTouch(View view, MotionEvent motionEvent) {
                        zzeVar.recordClick();
                        return false;
                    }
                });
                zza.setOnClickListener(new View.OnClickListener() { // from class: com.google.android.gms.ads.internal.zzc.3.2
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        zzeVar.recordClick();
                    }
                });
                zzc.this.zzaly.zzasi = 0;
                zzc.this.zzaly.zzarl = zzu.zzgl().zza(zzc.this.zzaly.zzahs, zzc.this, zzaVar, zzc.this.zzaly.zzarh, zza, zzc.this.zzamf, zzc.this, zzdzVar);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza
    public boolean zza(@Nullable zzko zzkoVar, zzko zzkoVar2) {
        if (this.zzaly.zzhp() && this.zzaly.zzarj != null) {
            this.zzaly.zzarj.zzhv().zzdc(zzkoVar2.zzclg);
        }
        return super.zza(zzkoVar, zzkoVar2);
    }

    @Override // com.google.android.gms.ads.internal.zzh
    public void zzc(View view) {
        this.zzaly.zzash = view;
        zzb(new zzko(this.zzaly.zzaro, null, null, null, null, null, null, null));
    }

    @Override // com.google.android.gms.ads.internal.zzh
    public void zzfa() {
        onAdClicked();
    }

    @Override // com.google.android.gms.ads.internal.zzh
    public void zzfb() {
        recordImpression();
        zzei();
    }

    @Override // com.google.android.gms.internal.zzhw
    public void zzfc() {
        zzek();
    }
}
