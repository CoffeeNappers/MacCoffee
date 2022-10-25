package com.google.android.gms.dynamic;

import android.content.Context;
import android.os.IBinder;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes.dex */
public abstract class zzg<T> {
    private final String Qe;
    private T Qf;

    /* loaded from: classes.dex */
    public static class zza extends Exception {
        public zza(String str) {
            super(str);
        }

        public zza(String str, Throwable th) {
            super(str, th);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzg(String str) {
        this.Qe = str;
    }

    protected abstract T zzc(IBinder iBinder);

    /* JADX INFO: Access modifiers changed from: protected */
    public final T zzcr(Context context) throws zza {
        if (this.Qf == null) {
            zzaa.zzy(context);
            Context remoteContext = com.google.android.gms.common.zze.getRemoteContext(context);
            if (remoteContext == null) {
                throw new zza("Could not get remote context.");
            }
            try {
                this.Qf = zzc((IBinder) remoteContext.getClassLoader().loadClass(this.Qe).newInstance());
            } catch (ClassNotFoundException e) {
                throw new zza("Could not load creator class.", e);
            } catch (IllegalAccessException e2) {
                throw new zza("Could not access creator.", e2);
            } catch (InstantiationException e3) {
                throw new zza("Could not instantiate creator.", e3);
            }
        }
        return this.Qf;
    }
}
