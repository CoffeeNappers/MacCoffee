package com.google.android.gms.internal;

import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.util.Log;
import com.google.android.gms.internal.zzaiy;
import com.google.android.gms.internal.zzalx;
import com.google.firebase.FirebaseApp;
import com.google.firebase.database.DatabaseException;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.connection.idl.ConnectionConfig;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ScheduledExecutorService;
/* loaded from: classes2.dex */
public class zzaie implements zzajr {
    private final FirebaseApp aZF;
    private final Set<String> aZK = new HashSet();
    private final Context zzaht;

    public zzaie(FirebaseApp firebaseApp) {
        this.aZF = firebaseApp;
        if (this.aZF != null) {
            this.zzaht = this.aZF.getApplicationContext();
            return;
        }
        Log.e("FirebaseDatabase", "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        Log.e("FirebaseDatabase", "ERROR: You must call FirebaseApp.initializeApp() before using Firebase Database.");
        Log.e("FirebaseDatabase", "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        throw new RuntimeException("You need to call FirebaseApp.initializeApp() before using Firebase Database.");
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzaiy zza(zzajj zzajjVar, zzaiu zzaiuVar, zzaiw zzaiwVar, zzaiy.zza zzaVar) {
        final com.google.firebase.database.connection.idl.zzc zza = com.google.firebase.database.connection.idl.zzc.zza(this.zzaht, new ConnectionConfig(zzaiwVar, zzajjVar.zzctu(), zzajjVar.zzcuo(), zzajjVar.zzcsk(), FirebaseDatabase.getSdkVersion(), zzajjVar.zzux()), zzaiuVar, zzaVar);
        this.aZF.zza(new FirebaseApp.zzb() { // from class: com.google.android.gms.internal.zzaie.2
            @Override // com.google.firebase.FirebaseApp.zzb
            public void zzcr(boolean z) {
                if (z) {
                    zza.interrupt("app_in_background");
                } else {
                    zza.resume("app_in_background");
                }
            }
        });
        return zza;
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzajf zza(ScheduledExecutorService scheduledExecutorService) {
        return new zzaic(this.aZF, scheduledExecutorService);
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzajn zza(zzajj zzajjVar) {
        return new zzaid();
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzaku zza(zzajj zzajjVar, String str) {
        String zzcut = zzajjVar.zzcut();
        String sb = new StringBuilder(String.valueOf(str).length() + 1 + String.valueOf(zzcut).length()).append(str).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(zzcut).toString();
        if (this.aZK.contains(sb)) {
            throw new DatabaseException(new StringBuilder(String.valueOf(zzcut).length() + 47).append("SessionPersistenceKey '").append(zzcut).append("' has already been used.").toString());
        }
        this.aZK.add(sb);
        return new zzakr(zzajjVar, new zzaif(this.zzaht, zzajjVar, sb), new zzaks(zzajjVar.zzcuq()));
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzalx zza(zzajj zzajjVar, zzalx.zza zzaVar, List<String> list) {
        return new zzalu(zzaVar, list);
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzajv zzb(zzajj zzajjVar) {
        final zzalw zzss = zzajjVar.zzss("RunLoop");
        return new zzanh() { // from class: com.google.android.gms.internal.zzaie.1
            @Override // com.google.android.gms.internal.zzanh
            public void zzj(final Throwable th) {
                final String zzl = zzanh.zzl(th);
                zzss.zzd(zzl, th);
                new Handler(zzaie.this.zzaht.getMainLooper()).post(new Runnable() { // from class: com.google.android.gms.internal.zzaie.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        throw new RuntimeException(zzl, th);
                    }
                });
                zzcsj().shutdownNow();
            }
        };
    }

    @Override // com.google.android.gms.internal.zzajr
    public String zzc(zzajj zzajjVar) {
        return new StringBuilder(19).append(Build.VERSION.SDK_INT).append("/Android").toString();
    }
}
