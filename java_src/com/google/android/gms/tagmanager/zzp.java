package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzafu;
import com.google.android.gms.internal.zzafv;
import com.google.android.gms.internal.zzafw;
import com.google.android.gms.internal.zzai;
import com.google.android.gms.internal.zzqq;
import com.google.android.gms.tagmanager.zzbn;
import com.google.android.gms.tagmanager.zzcj;
import com.google.android.gms.tagmanager.zzo;
/* loaded from: classes2.dex */
public class zzp extends zzqq<ContainerHolder> {
    private final String aDY;
    private long aEd;
    private final TagManager aEk;
    private final zzd aEn;
    private final zzcl aEo;
    private final int aEp;
    private final zzq aEq;
    private zzf aEr;
    private zzafv aEs;
    private volatile zzo aEt;
    private volatile boolean aEu;
    private zzai.zzj aEv;
    private String aEw;
    private zze aEx;
    private zza aEy;
    private final Context mContext;
    private final Looper zzajy;
    private final com.google.android.gms.common.util.zze zzaql;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.google.android.gms.tagmanager.zzp$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface zza {
        boolean zzb(Container container);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzb implements zzbn<zzafu.zza> {
        private zzb() {
        }

        /* synthetic */ zzb(zzp zzpVar, AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // com.google.android.gms.tagmanager.zzbn
        /* renamed from: zza */
        public void onSuccess(zzafu.zza zzaVar) {
            zzai.zzj zzjVar;
            if (zzaVar.aMv != null) {
                zzjVar = zzaVar.aMv;
            } else {
                zzai.zzf zzfVar = zzaVar.zzxv;
                zzjVar = new zzai.zzj();
                zzjVar.zzxv = zzfVar;
                zzjVar.zzxu = null;
                zzjVar.zzxw = zzfVar.version;
            }
            zzp.this.zza(zzjVar, zzaVar.aMu, true);
        }

        @Override // com.google.android.gms.tagmanager.zzbn
        public void zza(zzbn.zza zzaVar) {
            if (!zzp.this.aEu) {
                zzp.this.zzbt(0L);
            }
        }

        @Override // com.google.android.gms.tagmanager.zzbn
        public void zzcei() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzc implements zzbn<zzai.zzj> {
        private zzc() {
        }

        /* synthetic */ zzc(zzp zzpVar, AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // com.google.android.gms.tagmanager.zzbn
        public void zza(zzbn.zza zzaVar) {
            if (zzaVar == zzbn.zza.SERVER_UNAVAILABLE_ERROR) {
                zzp.this.aEq.zzcem();
            }
            synchronized (zzp.this) {
                if (!zzp.this.isReady()) {
                    if (zzp.this.aEt != null) {
                        zzp.this.zzc((zzp) zzp.this.aEt);
                    } else {
                        zzp.this.zzc((zzp) zzp.this.zzc(Status.yc));
                    }
                }
            }
            zzp.this.zzbt(zzp.this.aEq.zzcel());
        }

        @Override // com.google.android.gms.tagmanager.zzbn
        /* renamed from: zzb */
        public void onSuccess(zzai.zzj zzjVar) {
            zzp.this.aEq.zzcen();
            synchronized (zzp.this) {
                if (zzjVar.zzxv == null) {
                    if (zzp.this.aEv.zzxv == null) {
                        zzbo.e("Current resource is null; network resource is also null");
                        zzp.this.zzbt(zzp.this.aEq.zzcel());
                        return;
                    }
                    zzjVar.zzxv = zzp.this.aEv.zzxv;
                }
                zzp.this.zza(zzjVar, zzp.this.zzaql.currentTimeMillis(), false);
                zzbo.v(new StringBuilder(58).append("setting refresh time to current time: ").append(zzp.this.aEd).toString());
                if (!zzp.this.zzceg()) {
                    zzp.this.zza(zzjVar);
                }
            }
        }

        @Override // com.google.android.gms.tagmanager.zzbn
        public void zzcei() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzd implements zzo.zza {
        private zzd() {
        }

        /* synthetic */ zzd(zzp zzpVar, AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // com.google.android.gms.tagmanager.zzo.zza
        public String zzcea() {
            return zzp.this.zzcea();
        }

        @Override // com.google.android.gms.tagmanager.zzo.zza
        public void zzcec() {
            if (zzp.this.aEo.zzagf()) {
                zzp.this.zzbt(0L);
            }
        }

        @Override // com.google.android.gms.tagmanager.zzo.zza
        public void zzox(String str) {
            zzp.this.zzox(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface zze extends Releasable {
        void zza(zzbn<zzai.zzj> zzbnVar);

        void zzf(long j, String str);

        void zzpa(String str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface zzf extends Releasable {
        void zza(zzbn<zzafu.zza> zzbnVar);

        void zzb(zzafu.zza zzaVar);

        void zzcej();

        zzafw.zzc zzzz(int i);
    }

    zzp(Context context, TagManager tagManager, Looper looper, String str, int i, zzf zzfVar, zze zzeVar, zzafv zzafvVar, com.google.android.gms.common.util.zze zzeVar2, zzcl zzclVar, zzq zzqVar) {
        super(looper == null ? Looper.getMainLooper() : looper);
        this.mContext = context;
        this.aEk = tagManager;
        this.zzajy = looper == null ? Looper.getMainLooper() : looper;
        this.aDY = str;
        this.aEp = i;
        this.aEr = zzfVar;
        this.aEx = zzeVar;
        this.aEs = zzafvVar;
        this.aEn = new zzd(this, null);
        this.aEv = new zzai.zzj();
        this.zzaql = zzeVar2;
        this.aEo = zzclVar;
        this.aEq = zzqVar;
        if (zzceg()) {
            zzox(zzcj.zzcfz().zzcgb());
        }
    }

    public zzp(Context context, TagManager tagManager, Looper looper, String str, int i, zzt zztVar) {
        this(context, tagManager, looper, str, i, new zzcv(context, str), new zzcu(context, str, zztVar), new zzafv(context), com.google.android.gms.common.util.zzh.zzayl(), new zzbm(1, 5, 900000L, 5000L, "refreshing", com.google.android.gms.common.util.zzh.zzayl()), new zzq(context, str));
        this.aEs.zzqy(zztVar.zzcep());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void zza(zzai.zzj zzjVar) {
        if (this.aEr != null) {
            zzafu.zza zzaVar = new zzafu.zza();
            zzaVar.aMu = this.aEd;
            zzaVar.zzxv = new zzai.zzf();
            zzaVar.aMv = zzjVar;
            this.aEr.zzb(zzaVar);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void zza(zzai.zzj zzjVar, long j, boolean z) {
        if (z) {
            boolean z2 = this.aEu;
        }
        if (!isReady() || this.aEt != null) {
            this.aEv = zzjVar;
            this.aEd = j;
            long zzcek = this.aEq.zzcek();
            zzbt(Math.max(0L, Math.min(zzcek, (this.aEd + zzcek) - this.zzaql.currentTimeMillis())));
            Container container = new Container(this.mContext, this.aEk.getDataLayer(), this.aDY, j, zzjVar);
            if (this.aEt == null) {
                this.aEt = new zzo(this.aEk, this.zzajy, container, this.aEn);
            } else {
                this.aEt.zza(container);
            }
            if (!isReady() && this.aEy.zzb(container)) {
                zzc((zzp) this.aEt);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void zzbt(long j) {
        if (this.aEx == null) {
            zzbo.zzdi("Refresh requested, but no network load scheduler.");
        } else {
            this.aEx.zzf(j, this.aEv.zzxw);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean zzceg() {
        zzcj zzcfz = zzcj.zzcfz();
        return (zzcfz.zzcga() == zzcj.zza.CONTAINER || zzcfz.zzcga() == zzcj.zza.CONTAINER_DEBUG) && this.aDY.equals(zzcfz.getContainerId());
    }

    private void zzcm(final boolean z) {
        this.aEr.zza(new zzb(this, null));
        this.aEx.zza(new zzc(this, null));
        zzafw.zzc zzzz = this.aEr.zzzz(this.aEp);
        if (zzzz != null) {
            this.aEt = new zzo(this.aEk, this.zzajy, new Container(this.mContext, this.aEk.getDataLayer(), this.aDY, 0L, zzzz), this.aEn);
        }
        this.aEy = new zza() { // from class: com.google.android.gms.tagmanager.zzp.3
            private Long aEA;

            private long zzceh() {
                if (this.aEA == null) {
                    this.aEA = Long.valueOf(zzp.this.aEq.zzcek());
                }
                return this.aEA.longValue();
            }

            @Override // com.google.android.gms.tagmanager.zzp.zza
            public boolean zzb(Container container) {
                return z ? container.getLastRefreshTime() + zzceh() >= zzp.this.zzaql.currentTimeMillis() : !container.isDefault();
            }
        };
        if (zzceg()) {
            this.aEx.zzf(0L, "");
        } else {
            this.aEr.zzcej();
        }
    }

    synchronized String zzcea() {
        return this.aEw;
    }

    public void zzced() {
        zzafw.zzc zzzz = this.aEr.zzzz(this.aEp);
        if (zzzz != null) {
            zzc((zzp) new zzo(this.aEk, this.zzajy, new Container(this.mContext, this.aEk.getDataLayer(), this.aDY, 0L, zzzz), new zzo.zza() { // from class: com.google.android.gms.tagmanager.zzp.2
                @Override // com.google.android.gms.tagmanager.zzo.zza
                public String zzcea() {
                    return zzp.this.zzcea();
                }

                @Override // com.google.android.gms.tagmanager.zzo.zza
                public void zzcec() {
                    zzbo.zzdi("Refresh ignored: container loaded as default only.");
                }

                @Override // com.google.android.gms.tagmanager.zzo.zza
                public void zzox(String str) {
                    zzp.this.zzox(str);
                }
            }));
        } else {
            zzbo.e("Default was requested, but no default container was found");
            zzc((zzp) zzc(new Status(10, "Default was requested, but no default container was found", null)));
        }
        this.aEx = null;
        this.aEr = null;
    }

    public void zzcee() {
        zzcm(false);
    }

    public void zzcef() {
        zzcm(true);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzqq
    /* renamed from: zzel */
    public ContainerHolder zzc(Status status) {
        if (this.aEt != null) {
            return this.aEt;
        }
        if (status == Status.yc) {
            zzbo.e("timer expired: setting result to failure");
        }
        return new zzo(status);
    }

    synchronized void zzox(String str) {
        this.aEw = str;
        if (this.aEx != null) {
            this.aEx.zzpa(str);
        }
    }
}
