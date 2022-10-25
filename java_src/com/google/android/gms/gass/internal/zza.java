package com.google.android.gms.gass.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.HandlerThread;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.internal.zzaf;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class zza {

    /* renamed from: com.google.android.gms.gass.internal.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    static class C0066zza implements zze.zzb, zze.zzc {
        protected zzb agD;
        private final String agE;
        private final LinkedBlockingQueue<zzaf.zza> agF;
        private final HandlerThread agG = new HandlerThread("GassClient");
        private final String packageName;

        public C0066zza(Context context, String str, String str2) {
            this.packageName = str;
            this.agE = str2;
            this.agG.start();
            this.agD = new zzb(context, this.agG.getLooper(), this, this);
            this.agF = new LinkedBlockingQueue<>();
            connect();
        }

        protected void connect() {
            this.agD.zzavd();
        }

        @Override // com.google.android.gms.common.internal.zze.zzb
        public void onConnected(Bundle bundle) {
            zze zzbnl = zzbnl();
            if (zzbnl != null) {
                try {
                    this.agF.put(zzbnl.zza(new GassRequestParcel(this.packageName, this.agE)).zzbno());
                    zztb();
                    this.agG.quit();
                } catch (Throwable th) {
                    zztb();
                    this.agG.quit();
                }
            }
        }

        @Override // com.google.android.gms.common.internal.zze.zzc
        public void onConnectionFailed(ConnectionResult connectionResult) {
            try {
                this.agF.put(new zzaf.zza());
            } catch (InterruptedException e) {
            }
        }

        @Override // com.google.android.gms.common.internal.zze.zzb
        public void onConnectionSuspended(int i) {
            try {
                this.agF.put(new zzaf.zza());
            } catch (InterruptedException e) {
            }
        }

        protected zze zzbnl() {
            try {
                return this.agD.zzbnm();
            } catch (DeadObjectException | IllegalStateException e) {
                return null;
            }
        }

        public zzaf.zza zzcv() {
            return zzti(2000);
        }

        public void zztb() {
            if (this.agD != null) {
                if (!this.agD.isConnected() && !this.agD.isConnecting()) {
                    return;
                }
                this.agD.disconnect();
            }
        }

        public zzaf.zza zzti(int i) {
            zzaf.zza zzaVar;
            try {
                zzaVar = this.agF.poll(i, TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                zzaVar = null;
            }
            return zzaVar == null ? new zzaf.zza() : zzaVar;
        }
    }

    public static zzaf.zza zzi(Context context, String str, String str2) {
        return new C0066zza(context, str, str2).zzcv();
    }
}
