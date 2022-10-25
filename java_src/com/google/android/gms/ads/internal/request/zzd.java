package com.google.android.gms.ads.internal.request;

import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Looper;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import com.facebook.internal.NativeProtocol;
import com.google.android.gms.ads.internal.request.zzc;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.internal.zzdk;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzjk;
import com.google.android.gms.internal.zzjl;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzld;
import com.google.android.gms.internal.zzlw;
@zzji
/* loaded from: classes.dex */
public abstract class zzd implements zzc.zza, zzld<Void> {
    private final Object zzako = new Object();
    private final zzlw<AdRequestInfoParcel> zzcjm;
    private final zzc.zza zzcjn;

    @zzji
    /* loaded from: classes.dex */
    public static final class zza extends zzd {
        private final Context mContext;

        public zza(Context context, zzlw<AdRequestInfoParcel> zzlwVar, zzc.zza zzaVar) {
            super(zzlwVar, zzaVar);
            this.mContext = context;
        }

        @Override // com.google.android.gms.ads.internal.request.zzd, com.google.android.gms.internal.zzld
        public /* synthetic */ Void zzrz() {
            return super.zzrz();
        }

        @Override // com.google.android.gms.ads.internal.request.zzd
        public void zztb() {
        }

        @Override // com.google.android.gms.ads.internal.request.zzd
        public zzk zztc() {
            return zzjl.zza(this.mContext, new zzdk(zzdr.zzbcx.get()), zzjk.zzti());
        }
    }

    @zzji
    /* loaded from: classes.dex */
    public static class zzb extends zzd implements zze.zzb, zze.zzc {
        private Context mContext;
        private final Object zzako;
        private VersionInfoParcel zzanu;
        private zzlw<AdRequestInfoParcel> zzcjm;
        private final zzc.zza zzcjn;
        protected zze zzcjq;
        private boolean zzcjr;

        public zzb(Context context, VersionInfoParcel versionInfoParcel, zzlw<AdRequestInfoParcel> zzlwVar, zzc.zza zzaVar) {
            super(zzlwVar, zzaVar);
            Looper mainLooper;
            this.zzako = new Object();
            this.mContext = context;
            this.zzanu = versionInfoParcel;
            this.zzcjm = zzlwVar;
            this.zzcjn = zzaVar;
            if (zzdr.zzbek.get().booleanValue()) {
                this.zzcjr = true;
                mainLooper = zzu.zzhc().zzwj();
            } else {
                mainLooper = context.getMainLooper();
            }
            this.zzcjq = new zze(context, mainLooper, this, this, this.zzanu.zzcyb);
            connect();
        }

        protected void connect() {
            this.zzcjq.zzavd();
        }

        @Override // com.google.android.gms.common.internal.zze.zzb
        public void onConnected(Bundle bundle) {
            Void r0 = (Void) zzrz();
        }

        @Override // com.google.android.gms.common.internal.zze.zzc
        public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
            zzkx.zzdg("Cannot connect to remote service, fallback to local instance.");
            zztd().zzrz();
            Bundle bundle = new Bundle();
            bundle.putString(NativeProtocol.WEB_DIALOG_ACTION, "gms_connection_failed_fallback_to_local");
            zzu.zzgm().zzb(this.mContext, this.zzanu.zzda, "gmob-apps", bundle, true);
        }

        @Override // com.google.android.gms.common.internal.zze.zzb
        public void onConnectionSuspended(int i) {
            zzkx.zzdg("Disconnected from remote ad request service.");
        }

        @Override // com.google.android.gms.ads.internal.request.zzd, com.google.android.gms.internal.zzld
        public /* synthetic */ Void zzrz() {
            return super.zzrz();
        }

        @Override // com.google.android.gms.ads.internal.request.zzd
        public void zztb() {
            synchronized (this.zzako) {
                if (this.zzcjq.isConnected() || this.zzcjq.isConnecting()) {
                    this.zzcjq.disconnect();
                }
                Binder.flushPendingCommands();
                if (this.zzcjr) {
                    zzu.zzhc().zzwk();
                    this.zzcjr = false;
                }
            }
        }

        @Override // com.google.android.gms.ads.internal.request.zzd
        public zzk zztc() {
            zzk zzkVar;
            synchronized (this.zzako) {
                try {
                    zzkVar = this.zzcjq.zzte();
                } catch (DeadObjectException | IllegalStateException e) {
                    zzkVar = null;
                }
            }
            return zzkVar;
        }

        zzld zztd() {
            return new zza(this.mContext, this.zzcjm, this.zzcjn);
        }
    }

    public zzd(zzlw<AdRequestInfoParcel> zzlwVar, zzc.zza zzaVar) {
        this.zzcjm = zzlwVar;
        this.zzcjn = zzaVar;
    }

    @Override // com.google.android.gms.internal.zzld
    public void cancel() {
        zztb();
    }

    boolean zza(zzk zzkVar, AdRequestInfoParcel adRequestInfoParcel) {
        try {
            zzkVar.zza(adRequestInfoParcel, new zzg(this));
            return true;
        } catch (RemoteException e) {
            zzkx.zzc("Could not fetch ad response from ad request service.", e);
            zzu.zzgq().zza(e, "AdRequestClientTask.getAdResponseFromService");
            this.zzcjn.zzb(new AdResponseParcel(0));
            return false;
        } catch (NullPointerException e2) {
            zzkx.zzc("Could not fetch ad response from ad request service due to an Exception.", e2);
            zzu.zzgq().zza(e2, "AdRequestClientTask.getAdResponseFromService");
            this.zzcjn.zzb(new AdResponseParcel(0));
            return false;
        } catch (SecurityException e3) {
            zzkx.zzc("Could not fetch ad response from ad request service due to an Exception.", e3);
            zzu.zzgq().zza(e3, "AdRequestClientTask.getAdResponseFromService");
            this.zzcjn.zzb(new AdResponseParcel(0));
            return false;
        } catch (Throwable th) {
            zzkx.zzc("Could not fetch ad response from ad request service due to an Exception.", th);
            zzu.zzgq().zza(th, "AdRequestClientTask.getAdResponseFromService");
            this.zzcjn.zzb(new AdResponseParcel(0));
            return false;
        }
    }

    @Override // com.google.android.gms.ads.internal.request.zzc.zza
    public void zzb(AdResponseParcel adResponseParcel) {
        synchronized (this.zzako) {
            this.zzcjn.zzb(adResponseParcel);
            zztb();
        }
    }

    @Override // com.google.android.gms.internal.zzld
    /* renamed from: zzrw */
    public Void zzrz() {
        final zzk zztc = zztc();
        if (zztc == null) {
            this.zzcjn.zzb(new AdResponseParcel(0));
            zztb();
        } else {
            this.zzcjm.zza(new zzlw.zzc<AdRequestInfoParcel>() { // from class: com.google.android.gms.ads.internal.request.zzd.1
                @Override // com.google.android.gms.internal.zzlw.zzc
                /* renamed from: zzc */
                public void zzd(AdRequestInfoParcel adRequestInfoParcel) {
                    if (!zzd.this.zza(zztc, adRequestInfoParcel)) {
                        zzd.this.zztb();
                    }
                }
            }, new zzlw.zza() { // from class: com.google.android.gms.ads.internal.request.zzd.2
                @Override // com.google.android.gms.internal.zzlw.zza
                public void run() {
                    zzd.this.zztb();
                }
            });
        }
        return null;
    }

    public abstract void zztb();

    public abstract zzk zztc();
}
