package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import com.google.android.gms.internal.zzajf;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.FirebaseApiNotAvailableException;
import com.google.firebase.FirebaseApp;
import com.google.firebase.auth.GetTokenResult;
import java.util.concurrent.ScheduledExecutorService;
/* loaded from: classes2.dex */
public class zzaic implements zzajf {
    private final ScheduledExecutorService aZE;
    private final FirebaseApp aZF;

    public zzaic(@NonNull FirebaseApp firebaseApp, @NonNull ScheduledExecutorService scheduledExecutorService) {
        this.aZF = firebaseApp;
        this.aZE = scheduledExecutorService;
    }

    private FirebaseApp.zza zzb(final zzajf.zzb zzbVar) {
        return new FirebaseApp.zza() { // from class: com.google.android.gms.internal.zzaic.3
            @Override // com.google.firebase.FirebaseApp.zza
            public void zzb(@NonNull final zzant zzantVar) {
                zzaic.this.aZE.execute(new Runnable() { // from class: com.google.android.gms.internal.zzaic.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        zzbVar.zzsr(zzantVar.getToken());
                    }
                });
            }
        };
    }

    @Override // com.google.android.gms.internal.zzajf
    public void zza(zzajf.zzb zzbVar) {
        this.aZF.zza(zzb(zzbVar));
    }

    @Override // com.google.android.gms.internal.zzajf
    public void zza(boolean z, @NonNull final zzajf.zza zzaVar) {
        this.aZF.getToken(z).addOnSuccessListener(this.aZE, new OnSuccessListener<GetTokenResult>() { // from class: com.google.android.gms.internal.zzaic.2
            @Override // com.google.android.gms.tasks.OnSuccessListener
            /* renamed from: zza */
            public void onSuccess(GetTokenResult getTokenResult) {
                zzaVar.zzsi(getTokenResult.getToken());
            }
        }).addOnFailureListener(this.aZE, new OnFailureListener() { // from class: com.google.android.gms.internal.zzaic.1
            private boolean zzb(Exception exc) {
                return (exc instanceof FirebaseApiNotAvailableException) || (exc instanceof zzanu);
            }

            @Override // com.google.android.gms.tasks.OnFailureListener
            public void onFailure(@NonNull Exception exc) {
                if (zzb(exc)) {
                    zzaVar.zzsi(null);
                } else {
                    zzaVar.onError(exc.getMessage());
                }
            }
        });
    }
}
