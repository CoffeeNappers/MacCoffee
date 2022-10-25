package com.google.android.gms.internal;

import com.google.android.gms.internal.zzalx;
import com.google.firebase.FirebaseApp;
import com.google.firebase.database.Logger;
/* loaded from: classes2.dex */
public class zzajk extends zzajj {
    public synchronized void setLogLevel(Logger.Level level) {
        zzcun();
        switch (level) {
            case DEBUG:
                this.bdo = zzalx.zza.DEBUG;
                break;
            case INFO:
                this.bdo = zzalx.zza.INFO;
                break;
            case WARN:
                this.bdo = zzalx.zza.WARN;
                break;
            case ERROR:
                this.bdo = zzalx.zza.ERROR;
                break;
            case NONE:
                this.bdo = zzalx.zza.NONE;
                break;
            default:
                String valueOf = String.valueOf(level);
                throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 19).append("Unknown log level: ").append(valueOf).toString());
        }
    }

    public synchronized void setPersistenceEnabled(boolean z) {
        zzcun();
        this.baS = z;
    }

    public synchronized void zzf(FirebaseApp firebaseApp) {
        this.aZF = firebaseApp;
    }

    public synchronized void zzsv(String str) {
        zzcun();
        if (str == null || str.isEmpty()) {
            throw new IllegalArgumentException("Session identifier is not allowed to be empty or null!");
        }
        this.bdn = str;
    }
}
