package com.google.android.gms.internal;

import com.facebook.internal.AnalyticsEvents;
import com.google.android.gms.internal.zzaiy;
import com.google.android.gms.internal.zzalx;
import com.vk.media.camera.CameraUtilsEffects;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public enum zzajp implements zzajr {
    INSTANCE;

    @Override // com.google.android.gms.internal.zzajr
    public zzaiy zza(zzajj zzajjVar, zzaiu zzaiuVar, zzaiw zzaiwVar, zzaiy.zza zzaVar) {
        return new zzaiz(zzajjVar.zzcup(), zzaiwVar, zzaVar);
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzajf zza(ScheduledExecutorService scheduledExecutorService) {
        throw new RuntimeException("Authentication is not implemented yet");
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzajn zza(zzajj zzajjVar) {
        return new zzakd(Executors.defaultThreadFactory(), zzakc.bfH);
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzaku zza(zzajj zzajjVar, String str) {
        return null;
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzalx zza(zzajj zzajjVar, zzalx.zza zzaVar, List<String> list) {
        return new zzalv(zzaVar, list);
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzajv zzb(zzajj zzajjVar) {
        final zzalw zzss = zzajjVar.zzss("RunLoop");
        return new zzanh() { // from class: com.google.android.gms.internal.zzajp.1
            @Override // com.google.android.gms.internal.zzanh
            public void zzj(Throwable th) {
                zzss.zzd(zzanh.zzl(th), th);
            }
        };
    }

    @Override // com.google.android.gms.internal.zzajr
    public String zzc(zzajj zzajjVar) {
        String property = System.getProperty("java.vm.name", "Unknown JVM");
        String property2 = System.getProperty("java.specification.version", AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN);
        return new StringBuilder(String.valueOf(property2).length() + 1 + String.valueOf(property).length()).append(property2).append(CameraUtilsEffects.FILE_DELIM).append(property).toString();
    }
}
