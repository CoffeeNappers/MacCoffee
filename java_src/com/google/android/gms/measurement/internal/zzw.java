package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.os.Looper;
import android.support.annotation.NonNull;
import java.lang.Thread;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicLong;
/* loaded from: classes2.dex */
public class zzw extends zzaa {
    private static final AtomicLong atP = new AtomicLong(Long.MIN_VALUE);
    private zzd atG;
    private zzd atH;
    private final PriorityBlockingQueue<FutureTask<?>> atI;
    private final BlockingQueue<FutureTask<?>> atJ;
    private final Thread.UncaughtExceptionHandler atK;
    private final Thread.UncaughtExceptionHandler atL;
    private final Object atM;
    private final Semaphore atN;
    private volatile boolean atO;

    /* loaded from: classes2.dex */
    static class zza extends RuntimeException {
    }

    /* loaded from: classes2.dex */
    private final class zzb implements Thread.UncaughtExceptionHandler {
        private final String atQ;

        public zzb(String str) {
            com.google.android.gms.common.internal.zzaa.zzy(str);
            this.atQ = str;
        }

        @Override // java.lang.Thread.UncaughtExceptionHandler
        public synchronized void uncaughtException(Thread thread, Throwable th) {
            zzw.this.zzbwb().zzbwy().zzj(this.atQ, th);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class zzc<V> extends FutureTask<V> implements Comparable<zzc> {
        private final String atQ;
        private final long atS;
        private final boolean atT;

        zzc(Runnable runnable, boolean z, String str) {
            super(runnable, null);
            com.google.android.gms.common.internal.zzaa.zzy(str);
            this.atS = zzw.atP.getAndIncrement();
            this.atQ = str;
            this.atT = z;
            if (this.atS == Long.MAX_VALUE) {
                zzw.this.zzbwb().zzbwy().log("Tasks index overflow");
            }
        }

        zzc(Callable<V> callable, boolean z, String str) {
            super(callable);
            com.google.android.gms.common.internal.zzaa.zzy(str);
            this.atS = zzw.atP.getAndIncrement();
            this.atQ = str;
            this.atT = z;
            if (this.atS == Long.MAX_VALUE) {
                zzw.this.zzbwb().zzbwy().log("Tasks index overflow");
            }
        }

        @Override // java.util.concurrent.FutureTask
        protected void setException(Throwable th) {
            zzw.this.zzbwb().zzbwy().zzj(this.atQ, th);
            if (th instanceof zza) {
                Thread.getDefaultUncaughtExceptionHandler().uncaughtException(Thread.currentThread(), th);
            }
            super.setException(th);
        }

        @Override // java.lang.Comparable
        /* renamed from: zzb */
        public int compareTo(@NonNull zzc zzcVar) {
            if (this.atT != zzcVar.atT) {
                return this.atT ? -1 : 1;
            } else if (this.atS < zzcVar.atS) {
                return -1;
            } else {
                if (this.atS > zzcVar.atS) {
                    return 1;
                }
                zzw.this.zzbwb().zzbwz().zzj("Two tasks share the same index. index", Long.valueOf(this.atS));
                return 0;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class zzd extends Thread {
        private final Object atU;
        private final BlockingQueue<FutureTask<?>> atV;

        public zzd(String str, BlockingQueue<FutureTask<?>> blockingQueue) {
            com.google.android.gms.common.internal.zzaa.zzy(str);
            com.google.android.gms.common.internal.zzaa.zzy(blockingQueue);
            this.atU = new Object();
            this.atV = blockingQueue;
            setName(str);
        }

        private void zza(InterruptedException interruptedException) {
            zzw.this.zzbwb().zzbxa().zzj(String.valueOf(getName()).concat(" was interrupted"), interruptedException);
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            boolean z = false;
            while (!z) {
                try {
                    zzw.this.atN.acquire();
                    z = true;
                } catch (InterruptedException e) {
                    zza(e);
                }
            }
            while (true) {
                try {
                    FutureTask<?> poll = this.atV.poll();
                    if (poll == null) {
                        synchronized (this.atU) {
                            if (this.atV.peek() == null && !zzw.this.atO) {
                                try {
                                    this.atU.wait(30000L);
                                } catch (InterruptedException e2) {
                                    zza(e2);
                                }
                            }
                        }
                        synchronized (zzw.this.atM) {
                            if (this.atV.peek() == null) {
                                break;
                            }
                        }
                    } else {
                        poll.run();
                    }
                } catch (Throwable th) {
                    synchronized (zzw.this.atM) {
                        zzw.this.atN.release();
                        zzw.this.atM.notifyAll();
                        if (this == zzw.this.atG) {
                            zzw.this.atG = null;
                        } else if (this == zzw.this.atH) {
                            zzw.this.atH = null;
                        } else {
                            zzw.this.zzbwb().zzbwy().log("Current scheduler thread is neither worker nor network");
                        }
                        throw th;
                    }
                }
            }
            synchronized (zzw.this.atM) {
                zzw.this.atN.release();
                zzw.this.atM.notifyAll();
                if (this == zzw.this.atG) {
                    zzw.this.atG = null;
                } else if (this == zzw.this.atH) {
                    zzw.this.atH = null;
                } else {
                    zzw.this.zzbwb().zzbwy().log("Current scheduler thread is neither worker nor network");
                }
            }
        }

        public void zzpi() {
            synchronized (this.atU) {
                this.atU.notifyAll();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzw(zzx zzxVar) {
        super(zzxVar);
        this.atM = new Object();
        this.atN = new Semaphore(2);
        this.atI = new PriorityBlockingQueue<>();
        this.atJ = new LinkedBlockingQueue();
        this.atK = new zzb("Thread death: Uncaught exception on worker thread");
        this.atL = new zzb("Thread death: Uncaught exception on network thread");
    }

    private void zza(zzc<?> zzcVar) {
        synchronized (this.atM) {
            this.atI.add(zzcVar);
            if (this.atG == null) {
                this.atG = new zzd("Measurement Worker", this.atI);
                this.atG.setUncaughtExceptionHandler(this.atK);
                this.atG.start();
            } else {
                this.atG.zzpi();
            }
        }
    }

    private void zza(FutureTask<?> futureTask) {
        synchronized (this.atM) {
            this.atJ.add(futureTask);
            if (this.atH == null) {
                this.atH = new zzd("Measurement Network", this.atJ);
                this.atH.setUncaughtExceptionHandler(this.atL);
                this.atH.start();
            } else {
                this.atH.zzpi();
            }
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public void zzbvo() {
        if (Thread.currentThread() != this.atH) {
            throw new IllegalStateException("Call expected from network thread");
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.measurement.internal.zzc zzbvp() {
        return super.zzbvp();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzac zzbvq() {
        return super.zzbvq();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzn zzbvr() {
        return super.zzbvr();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzg zzbvs() {
        return super.zzbvs();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzae zzbvt() {
        return super.zzbvt();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzad zzbvu() {
        return super.zzbvu();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzo zzbvv() {
        return super.zzbvv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zze zzbvw() {
        return super.zzbvw();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzal zzbvx() {
        return super.zzbvx();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzv zzbvy() {
        return super.zzbvy();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzag zzbvz() {
        return super.zzbvz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzw zzbwa() {
        return super.zzbwa();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzq zzbwb() {
        return super.zzbwb();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzt zzbwc() {
        return super.zzbwc();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.measurement.internal.zzd zzbwd() {
        return super.zzbwd();
    }

    public <V> Future<V> zzd(Callable<V> callable) throws IllegalStateException {
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(callable);
        zzc<?> zzcVar = new zzc<>((Callable<?>) callable, false, "Task exception on worker thread");
        if (Thread.currentThread() == this.atG) {
            zzcVar.run();
        } else {
            zza(zzcVar);
        }
        return zzcVar;
    }

    public boolean zzdg() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    public <V> Future<V> zze(Callable<V> callable) throws IllegalStateException {
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(callable);
        zzc<?> zzcVar = new zzc<>((Callable<?>) callable, true, "Task exception on worker thread");
        if (Thread.currentThread() == this.atG) {
            zzcVar.run();
        } else {
            zza(zzcVar);
        }
        return zzcVar;
    }

    public void zzm(Runnable runnable) throws IllegalStateException {
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(runnable);
        zza(new zzc<>(runnable, false, "Task exception on worker thread"));
    }

    public void zzn(Runnable runnable) throws IllegalStateException {
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(runnable);
        zza((FutureTask<?>) new zzc(runnable, false, "Task exception on network thread"));
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public void zzzx() {
        if (Thread.currentThread() != this.atG) {
            throw new IllegalStateException("Call expected from worker thread");
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
