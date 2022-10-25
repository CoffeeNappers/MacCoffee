package com.google.android.gms.internal;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.internal.zzaiy;
import com.google.android.gms.internal.zzajf;
import com.google.android.gms.internal.zzajy;
import com.google.android.gms.internal.zzaka;
import com.google.android.gms.internal.zzalb;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseException;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.Transaction;
import com.google.firebase.database.ValueEventListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzajs implements zzaiy.zza {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final zzajt aZh;
    private final zzaiy bcu;
    private zzajx bdJ;
    private zzajy bdK;
    private zzalb<List<zza>> bdL;
    private final zzalj bdN;
    private final zzajj bdO;
    private final zzalw bdP;
    private final zzalw bdQ;
    private final zzalw bdR;
    private zzaka bdU;
    private zzaka bdV;
    private FirebaseDatabase bdW;
    private final zzanj bdI = new zzanj(new zzang(), 0);
    private boolean bdM = false;
    public long bdS = 0;
    private long bdT = 1;
    private boolean bdX = false;
    private long bdY = 0;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza implements Comparable<zza> {
        private zzajq aZr;
        private ValueEventListener beA;
        private zzb beB;
        private long beC;
        private boolean beD;
        private DatabaseError beE;
        private long beF;
        private zzaml beG;
        private zzaml beH;
        private zzaml beI;
        private Transaction.Handler bez;
        private int retryCount;

        private zza(zzajq zzajqVar, Transaction.Handler handler, ValueEventListener valueEventListener, zzb zzbVar, boolean z, long j) {
            this.aZr = zzajqVar;
            this.bez = handler;
            this.beA = valueEventListener;
            this.beB = zzbVar;
            this.retryCount = 0;
            this.beD = z;
            this.beC = j;
            this.beE = null;
            this.beG = null;
            this.beH = null;
            this.beI = null;
        }

        static /* synthetic */ int zze(zza zzaVar) {
            int i = zzaVar.retryCount;
            zzaVar.retryCount = i + 1;
            return i;
        }

        @Override // java.lang.Comparable
        /* renamed from: zza */
        public int compareTo(zza zzaVar) {
            if (this.beC < zzaVar.beC) {
                return -1;
            }
            return this.beC == zzaVar.beC ? 0 : 1;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum zzb {
        INITIALIZING,
        RUN,
        SENT,
        COMPLETED,
        SENT_NEEDS_ABORT,
        NEEDS_ABORT
    }

    static {
        $assertionsDisabled = !zzajs.class.desiredAssertionStatus();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzajs(zzajt zzajtVar, zzajj zzajjVar, FirebaseDatabase firebaseDatabase) {
        this.aZh = zzajtVar;
        this.bdO = zzajjVar;
        this.bdW = firebaseDatabase;
        this.bdP = this.bdO.zzss("RepoOperation");
        this.bdQ = this.bdO.zzss("Transaction");
        this.bdR = this.bdO.zzss("DataOperation");
        this.bdN = new zzalj(this.bdO);
        this.bcu = zzajjVar.zza(new zzaiw(zzajtVar.baV, zzajtVar.EY, zzajtVar.baW), this);
        zzs(new Runnable() { // from class: com.google.android.gms.internal.zzajs.1
            @Override // java.lang.Runnable
            public void run() {
                zzajs.this.zzcvo();
            }
        });
    }

    private zzaml zza(zzajq zzajqVar, List<Long> list) {
        zzaml zzc = this.bdV.zzc(zzajqVar, list);
        return zzc == null ? zzame.zzczq() : zzc;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(long j, zzajq zzajqVar, DatabaseError databaseError) {
        if (databaseError == null || databaseError.getCode() != -25) {
            List<? extends zzalh> zza2 = this.bdV.zza(j, !(databaseError == null), true, (zzanf) this.bdI);
            if (zza2.size() > 0) {
                zzo(zzajqVar);
            }
            zzav(zza2);
        }
    }

    private void zza(zzaku zzakuVar) {
        List<zzake> zzcre = zzakuVar.zzcre();
        Map<String, Object> zza2 = zzajw.zza(this.bdI);
        long j = Long.MIN_VALUE;
        for (final zzake zzakeVar : zzcre) {
            zzajb zzajbVar = new zzajb() { // from class: com.google.android.gms.internal.zzajs.19
                @Override // com.google.android.gms.internal.zzajb
                public void zzbn(String str, String str2) {
                    DatabaseError zzbo = zzajs.zzbo(str, str2);
                    zzajs.this.zza("Persisted write", zzakeVar.zzcrc(), zzbo);
                    zzajs.this.zza(zzakeVar.zzcwd(), zzakeVar.zzcrc(), zzbo);
                }
            };
            if (j >= zzakeVar.zzcwd()) {
                throw new IllegalStateException("Write ids were not in order.");
            }
            long zzcwd = zzakeVar.zzcwd();
            this.bdT = zzakeVar.zzcwd() + 1;
            if (zzakeVar.zzcwg()) {
                if (this.bdP.zzcyu()) {
                    this.bdP.zzi(new StringBuilder(48).append("Restoring overwrite with id ").append(zzakeVar.zzcwd()).toString(), new Object[0]);
                }
                this.bcu.zza(zzakeVar.zzcrc().zzcvi(), zzakeVar.zzcwe().getValue(true), zzajbVar);
                this.bdV.zza(zzakeVar.zzcrc(), zzakeVar.zzcwe(), zzajw.zza(zzakeVar.zzcwe(), zza2), zzakeVar.zzcwd(), true, false);
            } else {
                if (this.bdP.zzcyu()) {
                    this.bdP.zzi(new StringBuilder(44).append("Restoring merge with id ").append(zzakeVar.zzcwd()).toString(), new Object[0]);
                }
                this.bcu.zza(zzakeVar.zzcrc().zzcvi(), zzakeVar.zzcwf().zzda(true), zzajbVar);
                this.bdV.zza(zzakeVar.zzcrc(), zzakeVar.zzcwf(), zzajw.zza(zzakeVar.zzcwf(), zza2), zzakeVar.zzcwd(), false);
            }
            j = zzcwd;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(zzalb<List<zza>> zzalbVar) {
        Boolean bool;
        if (zzalbVar.getValue() == null) {
            if (!zzalbVar.hasChildren()) {
                return;
            }
            zzalbVar.zzb(new zzalb.zzb<List<zza>>() { // from class: com.google.android.gms.internal.zzajs.7
                @Override // com.google.android.gms.internal.zzalb.zzb
                public void zzd(zzalb<List<zza>> zzalbVar2) {
                    zzajs.this.zza(zzalbVar2);
                }
            });
            return;
        }
        List<zza> zzc = zzc(zzalbVar);
        if (!$assertionsDisabled && zzc.size() <= 0) {
            throw new AssertionError();
        }
        Iterator<zza> it = zzc.iterator();
        while (true) {
            if (!it.hasNext()) {
                bool = true;
                break;
            } else if (it.next().beB != zzb.RUN) {
                bool = false;
                break;
            }
        }
        if (!bool.booleanValue()) {
            return;
        }
        zza(zzc, zzalbVar.zzcrc());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(zzalb<List<zza>> zzalbVar, int i) {
        final DatabaseError zzafs;
        List<zza> value = zzalbVar.getValue();
        ArrayList arrayList = new ArrayList();
        if (value != null) {
            ArrayList<Runnable> arrayList2 = new ArrayList();
            if (i == -9) {
                zzafs = DatabaseError.zzsa("overriddenBySet");
            } else {
                zzann.zzb(i == -25, new StringBuilder(45).append("Unknown transaction abort reason: ").append(i).toString());
                zzafs = DatabaseError.zzafs(-25);
            }
            int i2 = -1;
            int i3 = 0;
            while (true) {
                int i4 = i3;
                int i5 = i2;
                if (i4 >= value.size()) {
                    if (i5 == -1) {
                        zzalbVar.setValue(null);
                    } else {
                        zzalbVar.setValue(value.subList(0, i5 + 1));
                    }
                    zzav(arrayList);
                    for (Runnable runnable : arrayList2) {
                        zzq(runnable);
                    }
                    return;
                }
                final zza zzaVar = value.get(i4);
                if (zzaVar.beB == zzb.SENT_NEEDS_ABORT) {
                    i2 = i5;
                } else if (zzaVar.beB == zzb.SENT) {
                    if (!$assertionsDisabled && i5 != i4 - 1) {
                        throw new AssertionError();
                    }
                    zzaVar.beB = zzb.SENT_NEEDS_ABORT;
                    zzaVar.beE = zzafs;
                    i2 = i4;
                } else if (!$assertionsDisabled && zzaVar.beB != zzb.RUN) {
                    throw new AssertionError();
                } else {
                    zze(new zzakg(this, zzaVar.beA, zzall.zzan(zzaVar.aZr)));
                    if (i == -9) {
                        arrayList.addAll(this.bdV.zza(zzaVar.beF, true, false, (zzanf) this.bdI));
                    } else {
                        zzann.zzb(i == -25, new StringBuilder(45).append("Unknown transaction abort reason: ").append(i).toString());
                    }
                    arrayList2.add(new Runnable() { // from class: com.google.android.gms.internal.zzajs.16
                        @Override // java.lang.Runnable
                        public void run() {
                            zzaVar.bez.onComplete(zzafs, false, null);
                        }
                    });
                    i2 = i5;
                }
                i3 = i4 + 1;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(String str, zzajq zzajqVar, DatabaseError databaseError) {
        if (databaseError == null || databaseError.getCode() == -1 || databaseError.getCode() == -25) {
            return;
        }
        zzalw zzalwVar = this.bdP;
        String valueOf = String.valueOf(zzajqVar.toString());
        String valueOf2 = String.valueOf(databaseError.toString());
        zzalwVar.warn(new StringBuilder(String.valueOf(str).length() + 13 + String.valueOf(valueOf).length() + String.valueOf(valueOf2).length()).append(str).append(" at ").append(valueOf).append(" failed: ").append(valueOf2).toString());
    }

    private void zza(final List<zza> list, final zzajq zzajqVar) {
        ArrayList arrayList = new ArrayList();
        for (zza zzaVar : list) {
            arrayList.add(Long.valueOf(zzaVar.beF));
        }
        zzaml zza2 = zza(zzajqVar, arrayList);
        String zzczd = zza2.zzczd();
        for (zza zzaVar2 : list) {
            if (!$assertionsDisabled && zzaVar2.beB != zzb.RUN) {
                throw new AssertionError();
            }
            zzaVar2.beB = zzb.SENT;
            zza.zze(zzaVar2);
            zza2 = zza2.zzl(zzajq.zza(zzajqVar, zzaVar2.aZr), zzaVar2.beH);
        }
        Object value = zza2.getValue(true);
        zzcvs();
        this.bcu.zza(zzajqVar.zzcvi(), value, zzczd, new zzajb() { // from class: com.google.android.gms.internal.zzajs.8
            @Override // com.google.android.gms.internal.zzajb
            public void zzbn(String str, String str2) {
                DatabaseError zzbo = zzajs.zzbo(str, str2);
                zzajs.this.zza("Transaction", zzajqVar, zzbo);
                ArrayList arrayList2 = new ArrayList();
                if (zzbo != null) {
                    if (zzbo.getCode() == -1) {
                        for (zza zzaVar3 : list) {
                            if (zzaVar3.beB == zzb.SENT_NEEDS_ABORT) {
                                zzaVar3.beB = zzb.NEEDS_ABORT;
                            } else {
                                zzaVar3.beB = zzb.RUN;
                            }
                        }
                    } else {
                        for (zza zzaVar4 : list) {
                            zzaVar4.beB = zzb.NEEDS_ABORT;
                            zzaVar4.beE = zzbo;
                        }
                    }
                    zzajs.this.zzo(zzajqVar);
                    return;
                }
                ArrayList arrayList3 = new ArrayList();
                for (final zza zzaVar5 : list) {
                    zzaVar5.beB = zzb.COMPLETED;
                    arrayList2.addAll(zzajs.this.bdV.zza(zzaVar5.beF, false, false, (zzanf) zzajs.this.bdI));
                    final DataSnapshot zza3 = com.google.firebase.database.zza.zza(com.google.firebase.database.zza.zza(this, zzaVar5.aZr), zzamg.zzn(zzaVar5.beI));
                    arrayList3.add(new Runnable() { // from class: com.google.android.gms.internal.zzajs.8.1
                        @Override // java.lang.Runnable
                        public void run() {
                            zzaVar5.bez.onComplete(null, true, zza3);
                        }
                    });
                    zzajs.this.zze(new zzakg(zzajs.this, zzaVar5.beA, zzall.zzan(zzaVar5.aZr)));
                }
                zzajs.this.zzb(zzajs.this.bdL.zzal(zzajqVar));
                zzajs.this.zzcvu();
                this.zzav(arrayList2);
                for (int i = 0; i < arrayList3.size(); i++) {
                    zzajs.this.zzq((Runnable) arrayList3.get(i));
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(final List<zza> list, zzalb<List<zza>> zzalbVar) {
        List<zza> value = zzalbVar.getValue();
        if (value != null) {
            list.addAll(value);
        }
        zzalbVar.zzb(new zzalb.zzb<List<zza>>() { // from class: com.google.android.gms.internal.zzajs.13
            @Override // com.google.android.gms.internal.zzalb.zzb
            public void zzd(zzalb<List<zza>> zzalbVar2) {
                zzajs.this.zza(list, zzalbVar2);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzav(List<? extends zzalh> list) {
        if (!list.isEmpty()) {
            this.bdN.zzax(list);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public zzajq zzb(zzajq zzajqVar, final int i) {
        zzajq zzcrc = zzp(zzajqVar).zzcrc();
        if (this.bdQ.zzcyu()) {
            zzalw zzalwVar = this.bdP;
            String valueOf = String.valueOf(zzajqVar);
            String valueOf2 = String.valueOf(zzcrc);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 44 + String.valueOf(valueOf2).length()).append("Aborting transactions for path: ").append(valueOf).append(". Affected: ").append(valueOf2).toString(), new Object[0]);
        }
        zzalb<List<zza>> zzal = this.bdL.zzal(zzajqVar);
        zzal.zza(new zzalb.zza<List<zza>>() { // from class: com.google.android.gms.internal.zzajs.14
            @Override // com.google.android.gms.internal.zzalb.zza
            public boolean zze(zzalb<List<zza>> zzalbVar) {
                zzajs.this.zza(zzalbVar, i);
                return false;
            }
        });
        zza(zzal, i);
        zzal.zza(new zzalb.zzb<List<zza>>() { // from class: com.google.android.gms.internal.zzajs.15
            @Override // com.google.android.gms.internal.zzalb.zzb
            public void zzd(zzalb<List<zza>> zzalbVar) {
                zzajs.this.zza(zzalbVar, i);
            }
        });
        return zzcrc;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzb(zzalb<List<zza>> zzalbVar) {
        List<zza> value = zzalbVar.getValue();
        if (value != null) {
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= value.size()) {
                    break;
                } else if (value.get(i2).beB == zzb.COMPLETED) {
                    value.remove(i2);
                    i = i2;
                } else {
                    i = i2 + 1;
                }
            }
            if (value.size() > 0) {
                zzalbVar.setValue(value);
            } else {
                zzalbVar.setValue(null);
            }
        }
        zzalbVar.zzb(new zzalb.zzb<List<zza>>() { // from class: com.google.android.gms.internal.zzajs.9
            @Override // com.google.android.gms.internal.zzalb.zzb
            public void zzd(zzalb<List<zza>> zzalbVar2) {
                zzajs.this.zzb(zzalbVar2);
            }
        });
    }

    private void zzb(zzalz zzalzVar, Object obj) {
        if (zzalzVar.equals(zzaji.bdh)) {
            this.bdI.zzcn(((Long) obj).longValue());
        }
        zzajq zzajqVar = new zzajq(zzaji.bdg, zzalzVar);
        try {
            zzaml zzbt = zzamm.zzbt(obj);
            this.bdJ.zzg(zzajqVar, zzbt);
            zzav(this.bdU.zzi(zzajqVar, zzbt));
        } catch (DatabaseException e) {
            this.bdP.zzd("Failed to parse info update", e);
        }
    }

    private void zzb(List<zza> list, zzajq zzajqVar) {
        final DatabaseError databaseError;
        boolean z;
        Transaction.Result abort;
        if (list.isEmpty()) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        List<Long> arrayList2 = new ArrayList<>();
        for (zza zzaVar : list) {
            arrayList2.add(Long.valueOf(zzaVar.beF));
        }
        for (final zza zzaVar2 : list) {
            zzajq zza2 = zzajq.zza(zzajqVar, zzaVar2.aZr);
            ArrayList arrayList3 = new ArrayList();
            if (!$assertionsDisabled && zza2 == null) {
                throw new AssertionError();
            }
            if (zzaVar2.beB == zzb.NEEDS_ABORT) {
                z = true;
                databaseError = zzaVar2.beE;
                if (databaseError.getCode() != -25) {
                    arrayList3.addAll(this.bdV.zza(zzaVar2.beF, true, false, (zzanf) this.bdI));
                }
            } else if (zzaVar2.beB != zzb.RUN) {
                databaseError = null;
                z = false;
            } else if (zzaVar2.retryCount >= 25) {
                z = true;
                databaseError = DatabaseError.zzsa("maxretries");
                arrayList3.addAll(this.bdV.zza(zzaVar2.beF, true, false, (zzanf) this.bdI));
            } else {
                zzaml zza3 = zza(zzaVar2.aZr, arrayList2);
                zzaVar2.beG = zza3;
                try {
                    abort = zzaVar2.bez.doTransaction(com.google.firebase.database.zza.zza(zza3));
                    databaseError = null;
                } catch (Throwable th) {
                    DatabaseError fromException = DatabaseError.fromException(th);
                    abort = Transaction.abort();
                    databaseError = fromException;
                }
                if (abort.isSuccess()) {
                    Long valueOf = Long.valueOf(zzaVar2.beF);
                    Map<String, Object> zza4 = zzajw.zza(this.bdI);
                    zzaml zzcqy = abort.zzcqy();
                    zzaml zza5 = zzajw.zza(zzcqy, zza4);
                    zzaVar2.beH = zzcqy;
                    zzaVar2.beI = zza5;
                    zzaVar2.beF = zzcvs();
                    arrayList2.remove(valueOf);
                    arrayList3.addAll(this.bdV.zza(zzaVar2.aZr, zzcqy, zza5, zzaVar2.beF, zzaVar2.beD, false));
                    arrayList3.addAll(this.bdV.zza(valueOf.longValue(), true, false, (zzanf) this.bdI));
                    databaseError = null;
                    z = false;
                } else {
                    z = true;
                    arrayList3.addAll(this.bdV.zza(zzaVar2.beF, true, false, (zzanf) this.bdI));
                }
            }
            zzav(arrayList3);
            if (z) {
                zzaVar2.beB = zzb.COMPLETED;
                final DataSnapshot zza6 = com.google.firebase.database.zza.zza(com.google.firebase.database.zza.zza(this, zzaVar2.aZr), zzamg.zzn(zzaVar2.beG));
                zzs(new Runnable() { // from class: com.google.android.gms.internal.zzajs.10
                    @Override // java.lang.Runnable
                    public void run() {
                        zzajs.this.zze(new zzakg(zzajs.this, zzaVar2.beA, zzall.zzan(zzaVar2.aZr)));
                    }
                });
                arrayList.add(new Runnable() { // from class: com.google.android.gms.internal.zzajs.11
                    @Override // java.lang.Runnable
                    public void run() {
                        zzaVar2.bez.onComplete(databaseError, false, zza6);
                    }
                });
            }
        }
        zzb(this.bdL);
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= arrayList.size()) {
                zzcvu();
                return;
            } else {
                zzq((Runnable) arrayList.get(i2));
                i = i2 + 1;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static DatabaseError zzbo(String str, String str2) {
        if (str != null) {
            return DatabaseError.zzbl(str, str2);
        }
        return null;
    }

    private List<zza> zzc(zzalb<List<zza>> zzalbVar) {
        ArrayList arrayList = new ArrayList();
        zza(arrayList, zzalbVar);
        Collections.sort(arrayList);
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzcvo() {
        this.bdO.zzcuu().zza(new zzajf.zzb() { // from class: com.google.android.gms.internal.zzajs.12
            @Override // com.google.android.gms.internal.zzajf.zzb
            public void zzsr(String str) {
                zzajs.this.bdP.zzi("Auth token changed, triggering auth token refresh", new Object[0]);
                zzajs.this.bcu.zzsk(str);
            }
        });
        this.bcu.initialize();
        zzaku zzst = this.bdO.zzst(this.aZh.baV);
        this.bdJ = new zzajx();
        this.bdK = new zzajy();
        this.bdL = new zzalb<>();
        this.bdU = new zzaka(this.bdO, new zzakt(), new zzaka.zzd() { // from class: com.google.android.gms.internal.zzajs.17
            @Override // com.google.android.gms.internal.zzaka.zzd
            public void zza(zzall zzallVar, zzakb zzakbVar) {
            }

            @Override // com.google.android.gms.internal.zzaka.zzd
            public void zza(final zzall zzallVar, zzakb zzakbVar, zzaix zzaixVar, final zzaka.zza zzaVar) {
                zzajs.this.zzs(new Runnable() { // from class: com.google.android.gms.internal.zzajs.17.1
                    @Override // java.lang.Runnable
                    public void run() {
                        zzaml zzq = zzajs.this.bdJ.zzq(zzallVar.zzcrc());
                        if (!zzq.isEmpty()) {
                            zzajs.this.zzav(zzajs.this.bdU.zzi(zzallVar.zzcrc(), zzq));
                            zzaVar.zzb(null);
                        }
                    }
                });
            }
        });
        this.bdV = new zzaka(this.bdO, zzst, new zzaka.zzd() { // from class: com.google.android.gms.internal.zzajs.18
            @Override // com.google.android.gms.internal.zzaka.zzd
            public void zza(zzall zzallVar, zzakb zzakbVar) {
                zzajs.this.bcu.zza(zzallVar.zzcrc().zzcvi(), zzallVar.zzcyh().zzcyd());
            }

            @Override // com.google.android.gms.internal.zzaka.zzd
            public void zza(zzall zzallVar, zzakb zzakbVar, zzaix zzaixVar, final zzaka.zza zzaVar) {
                zzajs.this.bcu.zza(zzallVar.zzcrc().zzcvi(), zzallVar.zzcyh().zzcyd(), zzaixVar, zzakbVar != null ? Long.valueOf(zzakbVar.zzcwc()) : null, new zzajb() { // from class: com.google.android.gms.internal.zzajs.18.1
                    @Override // com.google.android.gms.internal.zzajb
                    public void zzbn(String str, String str2) {
                        zzajs.this.zzav(zzaVar.zzb(zzajs.zzbo(str, str2)));
                    }
                });
            }
        });
        zza(zzst);
        zzb(zzaji.bdi, (Object) false);
        zzb(zzaji.bdj, (Object) false);
    }

    private long zzcvs() {
        long j = this.bdT;
        this.bdT = 1 + j;
        return j;
    }

    private void zzcvt() {
        zzajy zza2 = zzajw.zza(this.bdK, zzajw.zza(this.bdI));
        final ArrayList arrayList = new ArrayList();
        zza2.zza(zzajq.zzcvg(), new zzajy.zzb() { // from class: com.google.android.gms.internal.zzajs.4
            @Override // com.google.android.gms.internal.zzajy.zzb
            public void zzf(zzajq zzajqVar, zzaml zzamlVar) {
                arrayList.addAll(zzajs.this.bdV.zzi(zzajqVar, zzamlVar));
                zzajs.this.zzo(zzajs.this.zzb(zzajqVar, -9));
            }
        });
        this.bdK = new zzajy();
        zzav(arrayList);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzcvu() {
        zzalb<List<zza>> zzalbVar = this.bdL;
        zzb(zzalbVar);
        zza(zzalbVar);
    }

    private long zzcvv() {
        long j = this.bdY;
        this.bdY = 1 + j;
        return j;
    }

    private zzaml zzn(zzajq zzajqVar) {
        return zza(zzajqVar, new ArrayList());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public zzajq zzo(zzajq zzajqVar) {
        zzalb<List<zza>> zzp = zzp(zzajqVar);
        zzajq zzcrc = zzp.zzcrc();
        zzb(zzc(zzp), zzcrc);
        return zzcrc;
    }

    private zzalb<List<zza>> zzp(zzajq zzajqVar) {
        zzalb<List<zza>> zzalbVar = this.bdL;
        while (!zzajqVar.isEmpty() && zzalbVar.getValue() == null) {
            zzalbVar = zzalbVar.zzal(new zzajq(zzajqVar.zzcvj()));
            zzajqVar = zzajqVar.zzcvk();
        }
        return zzalbVar;
    }

    public FirebaseDatabase getDatabase() {
        return this.bdW;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void interrupt() {
        this.bcu.interrupt("repo_interrupt");
    }

    @Override // com.google.android.gms.internal.zzaiy.zza
    public void onDisconnect() {
        zza(zzaji.bdj, (Object) false);
        zzcvt();
    }

    public void purgeOutstandingWrites() {
        if (this.bdP.zzcyu()) {
            this.bdP.zzi("Purging writes", new Object[0]);
        }
        zzav(this.bdV.zzcwa());
        zzb(zzajq.zzcvg(), -25);
        this.bcu.purgeOutstandingWrites();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void resume() {
        this.bcu.resume("repo_interrupt");
    }

    public String toString() {
        return this.aZh.toString();
    }

    public void zza(final zzajq zzajqVar, zzajh zzajhVar, final DatabaseReference.CompletionListener completionListener, Map<String, Object> map) {
        if (this.bdP.zzcyu()) {
            zzalw zzalwVar = this.bdP;
            String valueOf = String.valueOf(zzajqVar);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 8).append("update: ").append(valueOf).toString(), new Object[0]);
        }
        if (this.bdR.zzcyu()) {
            zzalw zzalwVar2 = this.bdR;
            String valueOf2 = String.valueOf(zzajqVar);
            String valueOf3 = String.valueOf(map);
            zzalwVar2.zzi(new StringBuilder(String.valueOf(valueOf2).length() + 9 + String.valueOf(valueOf3).length()).append("update: ").append(valueOf2).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf3).toString(), new Object[0]);
        }
        if (zzajhVar.isEmpty()) {
            if (this.bdP.zzcyu()) {
                this.bdP.zzi("update called with no changes. No-op", new Object[0]);
            }
            zza(completionListener, (DatabaseError) null, zzajqVar);
            return;
        }
        zzajh zza2 = zzajw.zza(zzajhVar, zzajw.zza(this.bdI));
        final long zzcvs = zzcvs();
        zzav(this.bdV.zza(zzajqVar, zzajhVar, zza2, zzcvs, true));
        this.bcu.zza(zzajqVar.zzcvi(), map, new zzajb() { // from class: com.google.android.gms.internal.zzajs.22
            @Override // com.google.android.gms.internal.zzajb
            public void zzbn(String str, String str2) {
                DatabaseError zzbo = zzajs.zzbo(str, str2);
                zzajs.this.zza("updateChildren", zzajqVar, zzbo);
                zzajs.this.zza(zzcvs, zzajqVar, zzbo);
                zzajs.this.zza(completionListener, zzbo, zzajqVar);
            }
        });
        zzo(zzb(zzajqVar, -9));
    }

    public void zza(final zzajq zzajqVar, zzaml zzamlVar, final DatabaseReference.CompletionListener completionListener) {
        if (this.bdP.zzcyu()) {
            zzalw zzalwVar = this.bdP;
            String valueOf = String.valueOf(zzajqVar);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 5).append("set: ").append(valueOf).toString(), new Object[0]);
        }
        if (this.bdR.zzcyu()) {
            zzalw zzalwVar2 = this.bdR;
            String valueOf2 = String.valueOf(zzajqVar);
            String valueOf3 = String.valueOf(zzamlVar);
            zzalwVar2.zzi(new StringBuilder(String.valueOf(valueOf2).length() + 6 + String.valueOf(valueOf3).length()).append("set: ").append(valueOf2).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf3).toString(), new Object[0]);
        }
        zzaml zza2 = zzajw.zza(zzamlVar, zzajw.zza(this.bdI));
        final long zzcvs = zzcvs();
        zzav(this.bdV.zza(zzajqVar, zzamlVar, zza2, zzcvs, true, true));
        this.bcu.zza(zzajqVar.zzcvi(), zzamlVar.getValue(true), new zzajb() { // from class: com.google.android.gms.internal.zzajs.21
            @Override // com.google.android.gms.internal.zzajb
            public void zzbn(String str, String str2) {
                DatabaseError zzbo = zzajs.zzbo(str, str2);
                zzajs.this.zza("setValue", zzajqVar, zzbo);
                zzajs.this.zza(zzcvs, zzajqVar, zzbo);
                zzajs.this.zza(completionListener, zzbo, zzajqVar);
            }
        });
        zzo(zzb(zzajqVar, -9));
    }

    public void zza(final zzajq zzajqVar, final DatabaseReference.CompletionListener completionListener) {
        this.bcu.zza(zzajqVar.zzcvi(), new zzajb() { // from class: com.google.android.gms.internal.zzajs.3
            @Override // com.google.android.gms.internal.zzajb
            public void zzbn(String str, String str2) {
                DatabaseError zzbo = zzajs.zzbo(str, str2);
                if (zzbo == null) {
                    zzajs.this.bdK.zzr(zzajqVar);
                }
                zzajs.this.zza(completionListener, zzbo, zzajqVar);
            }
        });
    }

    public void zza(zzajq zzajqVar, final Transaction.Handler handler, boolean z) {
        final DatabaseError fromException;
        Transaction.Result abort;
        Transaction.Result doTransaction;
        if (this.bdP.zzcyu()) {
            zzalw zzalwVar = this.bdP;
            String valueOf = String.valueOf(zzajqVar);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 13).append("transaction: ").append(valueOf).toString(), new Object[0]);
        }
        if (this.bdR.zzcyu()) {
            zzalw zzalwVar2 = this.bdP;
            String valueOf2 = String.valueOf(zzajqVar);
            zzalwVar2.zzi(new StringBuilder(String.valueOf(valueOf2).length() + 13).append("transaction: ").append(valueOf2).toString(), new Object[0]);
        }
        if (this.bdO.zzcsk() && !this.bdX) {
            this.bdX = true;
            this.bdQ.info("runTransaction() usage detected while persistence is enabled. Please be aware that transactions *will not* be persisted across database restarts.  See https://www.firebase.com/docs/android/guide/offline-capabilities.html#section-handling-transactions-offline for more details.");
        }
        DatabaseReference zza2 = com.google.firebase.database.zza.zza(this, zzajqVar);
        ValueEventListener valueEventListener = new ValueEventListener() { // from class: com.google.android.gms.internal.zzajs.5
            @Override // com.google.firebase.database.ValueEventListener
            public void onCancelled(DatabaseError databaseError) {
            }

            @Override // com.google.firebase.database.ValueEventListener
            public void onDataChange(DataSnapshot dataSnapshot) {
            }
        };
        zzf(new zzakg(this, valueEventListener, zza2.zzcrd()));
        zza zzaVar = new zza(zzajqVar, handler, valueEventListener, zzb.INITIALIZING, z, zzcvv());
        zzaml zzn = zzn(zzajqVar);
        zzaVar.beG = zzn;
        try {
            doTransaction = handler.doTransaction(com.google.firebase.database.zza.zza(zzn));
        } catch (Throwable th) {
            fromException = DatabaseError.fromException(th);
            abort = Transaction.abort();
        }
        if (doTransaction == null) {
            throw new NullPointerException("Transaction returned null as result");
        }
        abort = doTransaction;
        fromException = null;
        if (!abort.isSuccess()) {
            zzaVar.beH = null;
            zzaVar.beI = null;
            final DataSnapshot zza3 = com.google.firebase.database.zza.zza(zza2, zzamg.zzn(zzaVar.beG));
            zzq(new Runnable() { // from class: com.google.android.gms.internal.zzajs.6
                @Override // java.lang.Runnable
                public void run() {
                    handler.onComplete(fromException, false, zza3);
                }
            });
            return;
        }
        zzaVar.beB = zzb.RUN;
        zzalb<List<zza>> zzal = this.bdL.zzal(zzajqVar);
        List<zza> value = zzal.getValue();
        if (value == null) {
            value = new ArrayList<>();
        }
        value.add(zzaVar);
        zzal.setValue(value);
        Map<String, Object> zza4 = zzajw.zza(this.bdI);
        zzaml zzcqy = abort.zzcqy();
        zzaml zza5 = zzajw.zza(zzcqy, zza4);
        zzaVar.beH = zzcqy;
        zzaVar.beI = zza5;
        zzaVar.beF = zzcvs();
        zzav(this.bdV.zza(zzajqVar, zzcqy, zza5, zzaVar.beF, z, false));
        zzcvu();
    }

    public void zza(final zzajq zzajqVar, final Map<zzajq, zzaml> map, final DatabaseReference.CompletionListener completionListener, Map<String, Object> map2) {
        this.bcu.zzb(zzajqVar.zzcvi(), map2, new zzajb() { // from class: com.google.android.gms.internal.zzajs.2
            @Override // com.google.android.gms.internal.zzajb
            public void zzbn(String str, String str2) {
                DatabaseError zzbo = zzajs.zzbo(str, str2);
                zzajs.this.zza("onDisconnect().updateChildren", zzajqVar, zzbo);
                if (zzbo == null) {
                    for (Map.Entry entry : map.entrySet()) {
                        zzajs.this.bdK.zzh(zzajqVar.zzh((zzajq) entry.getKey()), (zzaml) entry.getValue());
                    }
                }
                zzajs.this.zza(completionListener, zzbo, zzajqVar);
            }
        });
    }

    public void zza(zzall zzallVar, boolean z) {
        if ($assertionsDisabled || zzallVar.zzcrc().isEmpty() || !zzallVar.zzcrc().zzcvj().equals(zzaji.bdg)) {
            this.bdV.zza(zzallVar, z);
            return;
        }
        throw new AssertionError();
    }

    public void zza(zzalz zzalzVar, Object obj) {
        zzb(zzalzVar, obj);
    }

    void zza(final DatabaseReference.CompletionListener completionListener, final DatabaseError databaseError, zzajq zzajqVar) {
        if (completionListener != null) {
            zzalz zzcvm = zzajqVar.zzcvm();
            final DatabaseReference zza2 = (zzcvm == null || !zzcvm.zzczb()) ? com.google.firebase.database.zza.zza(this, zzajqVar) : com.google.firebase.database.zza.zza(this, zzajqVar.zzcvl());
            zzq(new Runnable() { // from class: com.google.android.gms.internal.zzajs.20
                @Override // java.lang.Runnable
                public void run() {
                    completionListener.onComplete(databaseError, zza2);
                }
            });
        }
    }

    @Override // com.google.android.gms.internal.zzaiy.zza
    public void zza(List<String> list, Object obj, boolean z, Long l) {
        List<? extends zzalh> zzi;
        zzajq zzajqVar = new zzajq(list);
        if (this.bdP.zzcyu()) {
            zzalw zzalwVar = this.bdP;
            String valueOf = String.valueOf(zzajqVar);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 14).append("onDataUpdate: ").append(valueOf).toString(), new Object[0]);
        }
        if (this.bdR.zzcyu()) {
            zzalw zzalwVar2 = this.bdP;
            String valueOf2 = String.valueOf(zzajqVar);
            String valueOf3 = String.valueOf(obj);
            zzalwVar2.zzi(new StringBuilder(String.valueOf(valueOf2).length() + 15 + String.valueOf(valueOf3).length()).append("onDataUpdate: ").append(valueOf2).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf3).toString(), new Object[0]);
        }
        this.bdS++;
        try {
            if (l != null) {
                zzakb zzakbVar = new zzakb(l.longValue());
                if (z) {
                    HashMap hashMap = new HashMap();
                    for (Map.Entry entry : ((Map) obj).entrySet()) {
                        hashMap.put(new zzajq((String) entry.getKey()), zzamm.zzbt(entry.getValue()));
                    }
                    zzi = this.bdV.zza(zzajqVar, hashMap, zzakbVar);
                } else {
                    zzi = this.bdV.zza(zzajqVar, zzamm.zzbt(obj), zzakbVar);
                }
            } else if (z) {
                HashMap hashMap2 = new HashMap();
                for (Map.Entry entry2 : ((Map) obj).entrySet()) {
                    hashMap2.put(new zzajq((String) entry2.getKey()), zzamm.zzbt(entry2.getValue()));
                }
                zzi = this.bdV.zza(zzajqVar, hashMap2);
            } else {
                zzi = this.bdV.zzi(zzajqVar, zzamm.zzbt(obj));
            }
            if (zzi.size() > 0) {
                zzo(zzajqVar);
            }
            zzav(zzi);
        } catch (DatabaseException e) {
            this.bdP.zzd("FIREBASE INTERNAL ERROR", e);
        }
    }

    @Override // com.google.android.gms.internal.zzaiy.zza
    public void zza(List<String> list, List<zzaja> list2, Long l) {
        zzajq zzajqVar = new zzajq(list);
        if (this.bdP.zzcyu()) {
            zzalw zzalwVar = this.bdP;
            String valueOf = String.valueOf(zzajqVar);
            zzalwVar.zzi(new StringBuilder(String.valueOf(valueOf).length() + 20).append("onRangeMergeUpdate: ").append(valueOf).toString(), new Object[0]);
        }
        if (this.bdR.zzcyu()) {
            zzalw zzalwVar2 = this.bdP;
            String valueOf2 = String.valueOf(zzajqVar);
            String valueOf3 = String.valueOf(list2);
            zzalwVar2.zzi(new StringBuilder(String.valueOf(valueOf2).length() + 21 + String.valueOf(valueOf3).length()).append("onRangeMergeUpdate: ").append(valueOf2).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf3).toString(), new Object[0]);
        }
        this.bdS++;
        ArrayList arrayList = new ArrayList(list2.size());
        for (zzaja zzajaVar : list2) {
            arrayList.add(new zzamq(zzajaVar));
        }
        List<? extends zzalh> zza2 = l != null ? this.bdV.zza(zzajqVar, arrayList, new zzakb(l.longValue())) : this.bdV.zzb(zzajqVar, arrayList);
        if (zza2.size() > 0) {
            zzo(zzajqVar);
        }
        zzav(zza2);
    }

    public void zzb(final zzajq zzajqVar, final zzaml zzamlVar, final DatabaseReference.CompletionListener completionListener) {
        this.bcu.zzb(zzajqVar.zzcvi(), zzamlVar.getValue(true), new zzajb() { // from class: com.google.android.gms.internal.zzajs.23
            @Override // com.google.android.gms.internal.zzajb
            public void zzbn(String str, String str2) {
                DatabaseError zzbo = zzajs.zzbo(str, str2);
                zzajs.this.zza("onDisconnect().setValue", zzajqVar, zzbo);
                if (zzbo == null) {
                    zzajs.this.bdK.zzh(zzajqVar, zzamlVar);
                }
                zzajs.this.zza(completionListener, zzbo, zzajqVar);
            }
        });
    }

    @Override // com.google.android.gms.internal.zzaiy.zza
    public void zzbw(Map<String, Object> map) {
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            zzb(zzalz.zzsx(entry.getKey()), entry.getValue());
        }
    }

    @Override // com.google.android.gms.internal.zzaiy.zza
    public void zzcsp() {
        zza(zzaji.bdj, (Object) true);
    }

    public zzajt zzcvp() {
        return this.aZh;
    }

    public long zzcvq() {
        return this.bdI.z();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzcvr() {
        return !this.bdU.isEmpty() || !this.bdV.isEmpty();
    }

    @Override // com.google.android.gms.internal.zzaiy.zza
    public void zzcy(boolean z) {
        zza(zzaji.bdi, Boolean.valueOf(z));
    }

    public void zze(zzajl zzajlVar) {
        zzav(zzaji.bdg.equals(zzajlVar.zzcud().zzcrc().zzcvj()) ? this.bdU.zzh(zzajlVar) : this.bdV.zzh(zzajlVar));
    }

    public void zzf(zzajl zzajlVar) {
        zzalz zzcvj = zzajlVar.zzcud().zzcrc().zzcvj();
        zzav((zzcvj == null || !zzcvj.equals(zzaji.bdg)) ? this.bdV.zzg(zzajlVar) : this.bdU.zzg(zzajlVar));
    }

    public void zzq(Runnable runnable) {
        this.bdO.zzcuk();
        this.bdO.zzcur().zzq(runnable);
    }

    public void zzs(Runnable runnable) {
        this.bdO.zzcuk();
        this.bdO.zzcus().zzs(runnable);
    }
}
