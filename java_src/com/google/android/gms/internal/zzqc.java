package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.util.Log;
import com.google.android.gms.clearcut.LogEventParcelable;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqf;
import com.google.android.gms.internal.zzqo;
/* loaded from: classes2.dex */
public class zzqc extends com.google.android.gms.common.api.zzc<Api.ApiOptions.NoOptions> implements com.google.android.gms.clearcut.zzb {

    /* loaded from: classes2.dex */
    static final class zza extends zzqo.zza<Status, zzqd> {
        private final LogEventParcelable wF;

        zza(LogEventParcelable logEventParcelable, GoogleApiClient googleApiClient) {
            super(com.google.android.gms.clearcut.zza.API, googleApiClient);
            this.wF = logEventParcelable;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof zza)) {
                return false;
            }
            return this.wF.equals(((zza) obj).wF);
        }

        public String toString() {
            String valueOf = String.valueOf(this.wF);
            return new StringBuilder(String.valueOf(valueOf).length() + 20).append("LogEventMethodImpl(").append(valueOf).append(")").toString();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqo.zza
        public void zza(zzqd zzqdVar) throws RemoteException {
            zzqf.zza zzaVar = new zzqf.zza() { // from class: com.google.android.gms.internal.zzqc.zza.1
                @Override // com.google.android.gms.internal.zzqf
                public void zzv(Status status) {
                    zza.this.zzc((zza) status);
                }

                @Override // com.google.android.gms.internal.zzqf
                public void zzw(Status status) {
                    throw new UnsupportedOperationException();
                }
            };
            try {
                zzqc.zzb(this.wF);
                zzqdVar.zza(zzaVar, this.wF);
            } catch (RuntimeException e) {
                Log.e("ClearcutLoggerApiImpl", "derived ClearcutLogger.MessageProducer ", e);
                zzaa(new Status(10, "MessageProducer"));
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzb */
        public Status zzc(Status status) {
            return status;
        }
    }

    zzqc(@NonNull Context context) {
        super(context, com.google.android.gms.clearcut.zza.API, (Api.ApiOptions) null, new zzqk());
    }

    static void zzb(LogEventParcelable logEventParcelable) {
        if (logEventParcelable.wD != null && logEventParcelable.wC.buo.length == 0) {
            logEventParcelable.wC.buo = logEventParcelable.wD.zzaqi();
        }
        if (logEventParcelable.wE != null && logEventParcelable.wC.buu.length == 0) {
            logEventParcelable.wC.buu = logEventParcelable.wE.zzaqi();
        }
        logEventParcelable.ww = zzasa.zzf(logEventParcelable.wC);
    }

    public static com.google.android.gms.clearcut.zzb zzbi(@NonNull Context context) {
        return new zzqc(context);
    }

    @Override // com.google.android.gms.clearcut.zzb
    public PendingResult<Status> zza(LogEventParcelable logEventParcelable) {
        return doBestEffortWrite((zzqc) new zza(logEventParcelable, asGoogleApiClient()));
    }
}
