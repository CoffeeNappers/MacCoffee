package com.google.android.gms.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzge;
import com.google.android.gms.internal.zzlw;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzgh {
    private final Context mContext;
    private final Object zzako;
    private final VersionInfoParcel zzanu;
    private final String zzbtp;
    private zzlg<zzge> zzbtq;
    private zzlg<zzge> zzbtr;
    @Nullable
    private zzd zzbts;
    private int zzbtt;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.google.android.gms.internal.zzgh$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements Runnable {
        final /* synthetic */ zzav zzbtu;
        final /* synthetic */ zzd zzbtv;

        /* renamed from: com.google.android.gms.internal.zzgh$1$1  reason: invalid class name and collision with other inner class name */
        /* loaded from: classes2.dex */
        class C00971 implements zzge.zza {
            final /* synthetic */ zzge zzbtx;

            C00971(zzge zzgeVar) {
                this.zzbtx = zzgeVar;
            }

            @Override // com.google.android.gms.internal.zzge.zza
            public void zznx() {
                zzlb.zzcvl.postDelayed(new Runnable() { // from class: com.google.android.gms.internal.zzgh.1.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        synchronized (zzgh.this.zzako) {
                            if (AnonymousClass1.this.zzbtv.getStatus() == -1 || AnonymousClass1.this.zzbtv.getStatus() == 1) {
                                return;
                            }
                            AnonymousClass1.this.zzbtv.reject();
                            com.google.android.gms.ads.internal.zzu.zzgm().runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzgh.1.1.1.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    C00971.this.zzbtx.destroy();
                                }
                            });
                            zzkx.v("Could not receive loaded message in a timely manner. Rejecting.");
                        }
                    }
                }, zza.zzbuf);
            }
        }

        AnonymousClass1(zzav zzavVar, zzd zzdVar) {
            this.zzbtu = zzavVar;
            this.zzbtv = zzdVar;
        }

        @Override // java.lang.Runnable
        public void run() {
            final zzge zza = zzgh.this.zza(zzgh.this.mContext, zzgh.this.zzanu, this.zzbtu);
            zza.zza(new C00971(zza));
            zza.zza("/jsLoaded", new zzfe() { // from class: com.google.android.gms.internal.zzgh.1.2
                @Override // com.google.android.gms.internal.zzfe
                public void zza(zzmd zzmdVar, Map<String, String> map) {
                    synchronized (zzgh.this.zzako) {
                        if (AnonymousClass1.this.zzbtv.getStatus() == -1 || AnonymousClass1.this.zzbtv.getStatus() == 1) {
                            return;
                        }
                        zzgh.this.zzbtt = 0;
                        zzgh.this.zzbtq.zzd(zza);
                        AnonymousClass1.this.zzbtv.zzg(zza);
                        zzgh.this.zzbts = AnonymousClass1.this.zzbtv;
                        zzkx.v("Successfully loaded JS Engine.");
                    }
                }
            });
            final zzln zzlnVar = new zzln();
            zzfe zzfeVar = new zzfe() { // from class: com.google.android.gms.internal.zzgh.1.3
                @Override // com.google.android.gms.internal.zzfe
                public void zza(zzmd zzmdVar, Map<String, String> map) {
                    synchronized (zzgh.this.zzako) {
                        zzkx.zzdh("JS Engine is requesting an update");
                        if (zzgh.this.zzbtt == 0) {
                            zzkx.zzdh("Starting reload.");
                            zzgh.this.zzbtt = 2;
                            zzgh.this.zzb(AnonymousClass1.this.zzbtu);
                        }
                        zza.zzb("/requestReload", (zzfe) zzlnVar.get());
                    }
                }
            };
            zzlnVar.set(zzfeVar);
            zza.zza("/requestReload", zzfeVar);
            if (zzgh.this.zzbtp.endsWith(".js")) {
                zza.zzbo(zzgh.this.zzbtp);
            } else if (zzgh.this.zzbtp.startsWith("<html>")) {
                zza.zzbq(zzgh.this.zzbtp);
            } else {
                zza.zzbp(zzgh.this.zzbtp);
            }
            zzlb.zzcvl.postDelayed(new Runnable() { // from class: com.google.android.gms.internal.zzgh.1.4
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (zzgh.this.zzako) {
                        if (AnonymousClass1.this.zzbtv.getStatus() == -1 || AnonymousClass1.this.zzbtv.getStatus() == 1) {
                            return;
                        }
                        AnonymousClass1.this.zzbtv.reject();
                        com.google.android.gms.ads.internal.zzu.zzgm().runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzgh.1.4.1
                            @Override // java.lang.Runnable
                            public void run() {
                                zza.destroy();
                            }
                        });
                        zzkx.v("Could not receive loaded message in a timely manner. Rejecting.");
                    }
                }
            }, zza.zzbue);
        }
    }

    /* loaded from: classes2.dex */
    static class zza {
        static int zzbue = 60000;
        static int zzbuf = 10000;
    }

    /* loaded from: classes2.dex */
    public static class zzb<T> implements zzlg<T> {
        @Override // com.google.android.gms.internal.zzlg
        public void zzd(T t) {
        }
    }

    /* loaded from: classes2.dex */
    public static class zzc extends zzlx<zzgi> {
        private final Object zzako = new Object();
        private final zzd zzbug;
        private boolean zzbuh;

        public zzc(zzd zzdVar) {
            this.zzbug = zzdVar;
        }

        public void release() {
            synchronized (this.zzako) {
                if (this.zzbuh) {
                    return;
                }
                this.zzbuh = true;
                zza(new zzlw.zzc<zzgi>() { // from class: com.google.android.gms.internal.zzgh.zzc.1
                    @Override // com.google.android.gms.internal.zzlw.zzc
                    /* renamed from: zzb */
                    public void zzd(zzgi zzgiVar) {
                        zzkx.v("Ending javascript session.");
                        ((zzgj) zzgiVar).zzod();
                    }
                }, new zzlw.zzb());
                zza(new zzlw.zzc<zzgi>() { // from class: com.google.android.gms.internal.zzgh.zzc.2
                    @Override // com.google.android.gms.internal.zzlw.zzc
                    /* renamed from: zzb */
                    public void zzd(zzgi zzgiVar) {
                        zzkx.v("Releasing engine reference.");
                        zzc.this.zzbug.zzoa();
                    }
                }, new zzlw.zza() { // from class: com.google.android.gms.internal.zzgh.zzc.3
                    @Override // com.google.android.gms.internal.zzlw.zza
                    public void run() {
                        zzc.this.zzbug.zzoa();
                    }
                });
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class zzd extends zzlx<zzge> {
        private zzlg<zzge> zzbtr;
        private final Object zzako = new Object();
        private boolean zzbuj = false;
        private int zzbuk = 0;

        public zzd(zzlg<zzge> zzlgVar) {
            this.zzbtr = zzlgVar;
        }

        public zzc zznz() {
            final zzc zzcVar = new zzc(this);
            synchronized (this.zzako) {
                zza(new zzlw.zzc<zzge>() { // from class: com.google.android.gms.internal.zzgh.zzd.1
                    @Override // com.google.android.gms.internal.zzlw.zzc
                    /* renamed from: zza */
                    public void zzd(zzge zzgeVar) {
                        zzkx.v("Getting a new session for JS Engine.");
                        zzcVar.zzg(zzgeVar.zznw());
                    }
                }, new zzlw.zza() { // from class: com.google.android.gms.internal.zzgh.zzd.2
                    @Override // com.google.android.gms.internal.zzlw.zza
                    public void run() {
                        zzkx.v("Rejecting reference for JS Engine.");
                        zzcVar.reject();
                    }
                });
                com.google.android.gms.common.internal.zzaa.zzbs(this.zzbuk >= 0);
                this.zzbuk++;
            }
            return zzcVar;
        }

        protected void zzoa() {
            boolean z = true;
            synchronized (this.zzako) {
                if (this.zzbuk < 1) {
                    z = false;
                }
                com.google.android.gms.common.internal.zzaa.zzbs(z);
                zzkx.v("Releasing 1 reference for JS Engine");
                this.zzbuk--;
                zzoc();
            }
        }

        public void zzob() {
            boolean z = true;
            synchronized (this.zzako) {
                if (this.zzbuk < 0) {
                    z = false;
                }
                com.google.android.gms.common.internal.zzaa.zzbs(z);
                zzkx.v("Releasing root reference. JS Engine will be destroyed once other references are released.");
                this.zzbuj = true;
                zzoc();
            }
        }

        protected void zzoc() {
            synchronized (this.zzako) {
                com.google.android.gms.common.internal.zzaa.zzbs(this.zzbuk >= 0);
                if (!this.zzbuj || this.zzbuk != 0) {
                    zzkx.v("There are still references to the engine. Not destroying.");
                } else {
                    zzkx.v("No reference is left (including root). Cleaning up engine.");
                    zza(new zzlw.zzc<zzge>() { // from class: com.google.android.gms.internal.zzgh.zzd.3
                        @Override // com.google.android.gms.internal.zzlw.zzc
                        /* renamed from: zza */
                        public void zzd(final zzge zzgeVar) {
                            com.google.android.gms.ads.internal.zzu.zzgm().runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzgh.zzd.3.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    zzd.this.zzbtr.zzd(zzgeVar);
                                    zzgeVar.destroy();
                                }
                            });
                        }
                    }, new zzlw.zzb());
                }
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class zze extends zzlx<zzgi> {
        private zzc zzbup;

        public zze(zzc zzcVar) {
            this.zzbup = zzcVar;
        }

        public void finalize() {
            this.zzbup.release();
            this.zzbup = null;
        }

        @Override // com.google.android.gms.internal.zzlx
        public int getStatus() {
            return this.zzbup.getStatus();
        }

        @Override // com.google.android.gms.internal.zzlx
        public void reject() {
            this.zzbup.reject();
        }

        @Override // com.google.android.gms.internal.zzlx, com.google.android.gms.internal.zzlw
        public void zza(zzlw.zzc<zzgi> zzcVar, zzlw.zza zzaVar) {
            this.zzbup.zza(zzcVar, zzaVar);
        }

        @Override // com.google.android.gms.internal.zzlx, com.google.android.gms.internal.zzlw
        /* renamed from: zzf */
        public void zzg(zzgi zzgiVar) {
            this.zzbup.zzg(zzgiVar);
        }
    }

    public zzgh(Context context, VersionInfoParcel versionInfoParcel, String str) {
        this.zzako = new Object();
        this.zzbtt = 1;
        this.zzbtp = str;
        this.mContext = context.getApplicationContext();
        this.zzanu = versionInfoParcel;
        this.zzbtq = new zzb();
        this.zzbtr = new zzb();
    }

    public zzgh(Context context, VersionInfoParcel versionInfoParcel, String str, zzlg<zzge> zzlgVar, zzlg<zzge> zzlgVar2) {
        this(context, versionInfoParcel, str);
        this.zzbtq = zzlgVar;
        this.zzbtr = zzlgVar2;
    }

    private zzd zza(@Nullable zzav zzavVar) {
        zzd zzdVar = new zzd(this.zzbtr);
        com.google.android.gms.ads.internal.zzu.zzgm().runOnUiThread(new AnonymousClass1(zzavVar, zzdVar));
        return zzdVar;
    }

    protected zzge zza(Context context, VersionInfoParcel versionInfoParcel, @Nullable zzav zzavVar) {
        return new zzgg(context, versionInfoParcel, zzavVar, null);
    }

    protected zzd zzb(@Nullable zzav zzavVar) {
        final zzd zza2 = zza(zzavVar);
        zza2.zza(new zzlw.zzc<zzge>() { // from class: com.google.android.gms.internal.zzgh.2
            @Override // com.google.android.gms.internal.zzlw.zzc
            /* renamed from: zza */
            public void zzd(zzge zzgeVar) {
                synchronized (zzgh.this.zzako) {
                    zzgh.this.zzbtt = 0;
                    if (zzgh.this.zzbts != null && zza2 != zzgh.this.zzbts) {
                        zzkx.v("New JS engine is loaded, marking previous one as destroyable.");
                        zzgh.this.zzbts.zzob();
                    }
                    zzgh.this.zzbts = zza2;
                }
            }
        }, new zzlw.zza() { // from class: com.google.android.gms.internal.zzgh.3
            @Override // com.google.android.gms.internal.zzlw.zza
            public void run() {
                synchronized (zzgh.this.zzako) {
                    zzgh.this.zzbtt = 1;
                    zzkx.v("Failed loading new engine. Marking new engine destroyable.");
                    zza2.zzob();
                }
            }
        });
        return zza2;
    }

    public zzc zzc(@Nullable zzav zzavVar) {
        zzc zznz;
        synchronized (this.zzako) {
            if (this.zzbts == null || this.zzbts.getStatus() == -1) {
                this.zzbtt = 2;
                this.zzbts = zzb(zzavVar);
                zznz = this.zzbts.zznz();
            } else if (this.zzbtt == 0) {
                zznz = this.zzbts.zznz();
            } else if (this.zzbtt == 1) {
                this.zzbtt = 2;
                zzb(zzavVar);
                zznz = this.zzbts.zznz();
            } else {
                zznz = this.zzbtt == 2 ? this.zzbts.zznz() : this.zzbts.zznz();
            }
        }
        return zznz;
    }

    public zzc zzny() {
        return zzc((zzav) null);
    }
}
