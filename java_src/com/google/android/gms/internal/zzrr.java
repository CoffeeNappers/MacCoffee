package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public final class zzrr<L> {
    private final zza Bl;
    private final zzb<L> Bm;
    private volatile L mListener;

    /* loaded from: classes2.dex */
    private final class zza extends Handler {
        public zza(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            boolean z = true;
            if (message.what != 1) {
                z = false;
            }
            com.google.android.gms.common.internal.zzaa.zzbt(z);
            zzrr.this.zzb((zzc) message.obj);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb<L> {
        private final String Bo;
        private final L mListener;

        private zzb(L l, String str) {
            this.mListener = l;
            this.Bo = str;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            zzb zzbVar = (zzb) obj;
            return this.mListener == zzbVar.mListener && this.Bo.equals(zzbVar.Bo);
        }

        public int hashCode() {
            return (System.identityHashCode(this.mListener) * 31) + this.Bo.hashCode();
        }
    }

    /* loaded from: classes2.dex */
    public interface zzc<L> {
        void zzasm();

        void zzt(L l);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzrr(@NonNull Looper looper, @NonNull L l, @NonNull String str) {
        this.Bl = new zza(looper);
        this.mListener = (L) com.google.android.gms.common.internal.zzaa.zzb(l, "Listener must not be null");
        this.Bm = new zzb<>(l, com.google.android.gms.common.internal.zzaa.zzib(str));
    }

    public void clear() {
        this.mListener = null;
    }

    public void zza(zzc<? super L> zzcVar) {
        com.google.android.gms.common.internal.zzaa.zzb(zzcVar, "Notifier must not be null");
        this.Bl.sendMessage(this.Bl.obtainMessage(1, zzcVar));
    }

    @NonNull
    public zzb<L> zzatz() {
        return this.Bm;
    }

    void zzb(zzc<? super L> zzcVar) {
        Object obj = (L) this.mListener;
        if (obj == null) {
            zzcVar.zzasm();
            return;
        }
        try {
            zzcVar.zzt(obj);
        } catch (RuntimeException e) {
            zzcVar.zzasm();
            throw e;
        }
    }
}
