package com.google.android.gms.internal;

import com.google.android.gms.internal.zzait;
import com.google.android.gms.internal.zzaiy;
import com.google.android.gms.internal.zzajf;
import com.google.android.gms.internal.zzalx;
import com.google.firebase.FirebaseApp;
import com.google.firebase.database.DatabaseException;
import com.google.firebase.database.FirebaseDatabase;
import com.vk.media.camera.CameraUtilsEffects;
import java.util.List;
import java.util.concurrent.ScheduledExecutorService;
/* loaded from: classes2.dex */
public class zzajj {
    protected FirebaseApp aZF;
    protected zzalx baR;
    protected boolean baS;
    protected String baU;
    protected zzajn bdk;
    protected zzajf bdl;
    protected zzajv bdm;
    protected String bdn;
    private zzajr bdq;
    protected zzalx.zza bdo = zzalx.zza.INFO;
    protected long cacheSize = 10485760;
    private boolean bcW = false;
    private boolean bdp = false;

    private static zzait zza(final zzajf zzajfVar) {
        return new zzait() { // from class: com.google.android.gms.internal.zzajj.1
            @Override // com.google.android.gms.internal.zzait
            public void zza(boolean z, final zzait.zza zzaVar) {
                zzajf.this.zza(z, new zzajf.zza() { // from class: com.google.android.gms.internal.zzajj.1.1
                    @Override // com.google.android.gms.internal.zzajf.zza
                    public void onError(String str) {
                        zzaVar.onError(str);
                    }

                    @Override // com.google.android.gms.internal.zzajf.zza
                    public void zzsi(String str) {
                        zzaVar.zzsi(str);
                    }
                });
            }
        };
    }

    private ScheduledExecutorService zzcsj() {
        zzajv zzcus = zzcus();
        if (!(zzcus instanceof zzanh)) {
            throw new RuntimeException("Custom run loops are not supported!");
        }
        return ((zzanh) zzcus).zzcsj();
    }

    private zzajr zzcui() {
        if (this.bdq == null) {
            if (zzanc.x()) {
                zzcuj();
            } else if (zzajo.isActive()) {
                zzajo zzajoVar = zzajo.INSTANCE;
                zzajoVar.initialize();
                this.bdq = zzajoVar;
            } else {
                this.bdq = zzajp.INSTANCE;
            }
        }
        return this.bdq;
    }

    private synchronized void zzcuj() {
        this.bdq = new zzaie(this.aZF);
    }

    private void zzcul() {
        zzcuv();
        zzcui();
        zzcuy();
        zzcux();
        zzcuw();
        zzcva();
        zzcuz();
    }

    private void zzcum() {
        this.bdk.restart();
        this.bdm.restart();
    }

    private void zzcuv() {
        if (this.baR == null) {
            this.baR = zzcui().zza(this, this.bdo, null);
        }
    }

    private void zzcuw() {
        if (this.bdm == null) {
            this.bdm = this.bdq.zzb(this);
        }
    }

    private void zzcux() {
        if (this.bdk == null) {
            this.bdk = zzcui().zza(this);
        }
    }

    private void zzcuy() {
        if (this.baU == null) {
            this.baU = zzsu(zzcui().zzc(this));
        }
    }

    private void zzcuz() {
        if (this.bdl == null) {
            this.bdl = zzcui().zza(zzcsj());
        }
    }

    private void zzcva() {
        if (this.bdn == null) {
            this.bdn = "default";
        }
    }

    private String zzsu(String str) {
        return "Firebase/5" + CameraUtilsEffects.FILE_DELIM + FirebaseDatabase.getSdkVersion() + CameraUtilsEffects.FILE_DELIM + str;
    }

    public boolean isFrozen() {
        return this.bcW;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void stop() {
        this.bdp = true;
        this.bdk.shutdown();
        this.bdm.shutdown();
    }

    public zzaiy zza(zzaiw zzaiwVar, zzaiy.zza zzaVar) {
        return zzcui().zza(this, zzcup(), zzaiwVar, zzaVar);
    }

    public zzalx zzcsh() {
        return this.baR;
    }

    public boolean zzcsk() {
        return this.baS;
    }

    public zzalx.zza zzctu() {
        return this.bdo;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized void zzctz() {
        if (!this.bcW) {
            this.bcW = true;
            zzcul();
        }
    }

    public void zzcuk() {
        if (this.bdp) {
            zzcum();
            this.bdp = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzcun() {
        if (isFrozen()) {
            throw new DatabaseException("Modifications to DatabaseConfig objects must occur before they are in use");
        }
    }

    public List<String> zzcuo() {
        return null;
    }

    public zzaiu zzcup() {
        return new zzaiu(zzcsh(), zza(zzcuu()), zzcsj(), zzcsk(), FirebaseDatabase.getSdkVersion(), zzux());
    }

    public long zzcuq() {
        return this.cacheSize;
    }

    public zzajn zzcur() {
        return this.bdk;
    }

    public zzajv zzcus() {
        return this.bdm;
    }

    public String zzcut() {
        return this.bdn;
    }

    public zzajf zzcuu() {
        return this.bdl;
    }

    public zzalw zzss(String str) {
        return new zzalw(this.baR, str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzaku zzst(String str) {
        if (this.baS) {
            zzaku zza = this.bdq.zza(this, str);
            if (zza != null) {
                return zza;
            }
            throw new IllegalArgumentException("You have enabled persistence, but persistence is not supported on this platform.");
        }
        return new zzakt();
    }

    public String zzux() {
        return this.baU;
    }
}
