package com.google.android.gms.internal;

import com.google.firebase.database.DatabaseException;
import com.google.firebase.database.FirebaseDatabase;
import com.vk.media.camera.CameraUtilsEffects;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzaju {
    private static final zzaju beR = new zzaju();
    private final Map<zzajj, Map<String, zzajs>> beS = new HashMap();

    public static zzajs zza(zzajj zzajjVar, zzajt zzajtVar, FirebaseDatabase firebaseDatabase) throws DatabaseException {
        return beR.zzb(zzajjVar, zzajtVar, firebaseDatabase);
    }

    private zzajs zzb(zzajj zzajjVar, zzajt zzajtVar, FirebaseDatabase firebaseDatabase) throws DatabaseException {
        zzajs zzajsVar;
        zzajjVar.zzctz();
        String str = zzajtVar.baV;
        String str2 = zzajtVar.EY;
        String sb = new StringBuilder(String.valueOf(str).length() + 9 + String.valueOf(str2).length()).append("https://").append(str).append(CameraUtilsEffects.FILE_DELIM).append(str2).toString();
        synchronized (this.beS) {
            if (!this.beS.containsKey(zzajjVar)) {
                this.beS.put(zzajjVar, new HashMap());
            }
            Map<String, zzajs> map = this.beS.get(zzajjVar);
            if (map.containsKey(sb)) {
                throw new IllegalStateException("createLocalRepo() called for existing repo.");
            }
            zzajsVar = new zzajs(zzajtVar, zzajjVar, firebaseDatabase);
            map.put(sb, zzajsVar);
        }
        return zzajsVar;
    }

    public static void zzd(zzajj zzajjVar) {
        beR.zzf(zzajjVar);
    }

    public static void zze(zzajj zzajjVar) {
        beR.zzg(zzajjVar);
    }

    private void zzf(final zzajj zzajjVar) {
        zzajv zzcus = zzajjVar.zzcus();
        if (zzcus != null) {
            zzcus.zzs(new Runnable() { // from class: com.google.android.gms.internal.zzaju.3
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (zzaju.this.beS) {
                        if (zzaju.this.beS.containsKey(zzajjVar)) {
                            boolean z = true;
                            for (zzajs zzajsVar : ((Map) zzaju.this.beS.get(zzajjVar)).values()) {
                                zzajsVar.interrupt();
                                z = z && !zzajsVar.zzcvr();
                            }
                            if (z) {
                                zzajjVar.stop();
                            }
                        }
                    }
                }
            });
        }
    }

    private void zzg(final zzajj zzajjVar) {
        zzajv zzcus = zzajjVar.zzcus();
        if (zzcus != null) {
            zzcus.zzs(new Runnable() { // from class: com.google.android.gms.internal.zzaju.4
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (zzaju.this.beS) {
                        if (zzaju.this.beS.containsKey(zzajjVar)) {
                            for (zzajs zzajsVar : ((Map) zzaju.this.beS.get(zzajjVar)).values()) {
                                zzajsVar.resume();
                            }
                        }
                    }
                }
            });
        }
    }

    public static void zzk(final zzajs zzajsVar) {
        zzajsVar.zzs(new Runnable() { // from class: com.google.android.gms.internal.zzaju.1
            @Override // java.lang.Runnable
            public void run() {
                zzajs.this.interrupt();
            }
        });
    }

    public static void zzl(final zzajs zzajsVar) {
        zzajsVar.zzs(new Runnable() { // from class: com.google.android.gms.internal.zzaju.2
            @Override // java.lang.Runnable
            public void run() {
                zzajs.this.resume();
            }
        });
    }
}
