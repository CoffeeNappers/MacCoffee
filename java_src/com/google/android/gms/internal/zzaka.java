package com.google.android.gms.internal;

import android.support.v4.media.session.PlaybackStateCompat;
import com.google.android.gms.internal.zzaim;
import com.google.android.gms.internal.zzakz;
import com.google.android.gms.internal.zzalh;
import com.google.firebase.database.DatabaseError;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public class zzaka {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final zzalw aZR;
    private final zzaku bff;
    private final zzd bfl;
    private long bfm = 1;
    private zzakz<zzajz> bfg = zzakz.zzcxe();
    private final zzakh bfh = new zzakh();
    private final Map<zzakb, zzall> bfi = new HashMap();
    private final Map<zzall, zzakb> bfj = new HashMap();
    private final Set<zzall> bfk = new HashSet();

    /* loaded from: classes2.dex */
    public interface zza {
        List<? extends zzalh> zzb(DatabaseError databaseError);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzb extends zzajl {
        private zzall bcY;

        public zzb(zzall zzallVar) {
            this.bcY = zzallVar;
        }

        public boolean equals(Object obj) {
            return (obj instanceof zzb) && ((zzb) obj).bcY.equals(this.bcY);
        }

        public int hashCode() {
            return this.bcY.hashCode();
        }

        @Override // com.google.android.gms.internal.zzajl
        public zzajl zza(zzall zzallVar) {
            return new zzb(zzallVar);
        }

        @Override // com.google.android.gms.internal.zzajl
        public zzalg zza(zzalf zzalfVar, zzall zzallVar) {
            return null;
        }

        @Override // com.google.android.gms.internal.zzajl
        public void zza(zzalg zzalgVar) {
        }

        @Override // com.google.android.gms.internal.zzajl
        public void zza(DatabaseError databaseError) {
        }

        @Override // com.google.android.gms.internal.zzajl
        public boolean zza(zzalh.zza zzaVar) {
            return false;
        }

        @Override // com.google.android.gms.internal.zzajl
        public boolean zzc(zzajl zzajlVar) {
            return zzajlVar instanceof zzb;
        }

        @Override // com.google.android.gms.internal.zzajl
        public zzall zzcud() {
            return this.bcY;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzc implements zzaix, zza {
        private final zzalm bfE;
        private final zzakb bfF;

        public zzc(zzalm zzalmVar) {
            this.bfE = zzalmVar;
            this.bfF = zzaka.this.zze(zzalmVar.zzcyi());
        }

        @Override // com.google.android.gms.internal.zzaka.zza
        public List<? extends zzalh> zzb(DatabaseError databaseError) {
            if (databaseError == null) {
                return this.bfF != null ? zzaka.this.zza(this.bfF) : zzaka.this.zzt(this.bfE.zzcyi().zzcrc());
            }
            zzalw zzalwVar = zzaka.this.aZR;
            String valueOf = String.valueOf(this.bfE.zzcyi().zzcrc());
            String valueOf2 = String.valueOf(databaseError.toString());
            zzalwVar.warn(new StringBuilder(String.valueOf(valueOf).length() + 19 + String.valueOf(valueOf2).length()).append("Listen at ").append(valueOf).append(" failed: ").append(valueOf2).toString());
            return zzaka.this.zza(this.bfE.zzcyi(), databaseError);
        }

        @Override // com.google.android.gms.internal.zzaix
        public String zzcsm() {
            return this.bfE.zzcyj().zzczd();
        }

        @Override // com.google.android.gms.internal.zzaix
        public boolean zzcsn() {
            return zzani.zzt(this.bfE.zzcyj()) > PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID;
        }

        @Override // com.google.android.gms.internal.zzaix
        public zzair zzcso() {
            zzamb zzi = zzamb.zzi(this.bfE.zzcyj());
            List<zzajq> zzcsf = zzi.zzcsf();
            ArrayList arrayList = new ArrayList(zzcsf.size());
            for (zzajq zzajqVar : zzcsf) {
                arrayList.add(zzajqVar.zzcvi());
            }
            return new zzair(arrayList, zzi.zzcsg());
        }
    }

    /* loaded from: classes2.dex */
    public interface zzd {
        void zza(zzall zzallVar, zzakb zzakbVar);

        void zza(zzall zzallVar, zzakb zzakbVar, zzaix zzaixVar, zza zzaVar);
    }

    static {
        $assertionsDisabled = !zzaka.class.desiredAssertionStatus();
    }

    public zzaka(zzajj zzajjVar, zzaku zzakuVar, zzd zzdVar) {
        this.bfl = zzdVar;
        this.bff = zzakuVar;
        this.aZR = zzajjVar.zzss("SyncTree");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<zzalh> zza(zzakn zzaknVar) {
        return zza(zzaknVar, this.bfg, (zzaml) null, this.bfh.zzu(zzajq.zzcvg()));
    }

    private List<zzalh> zza(zzakn zzaknVar, zzakz<zzajz> zzakzVar, zzaml zzamlVar, zzaki zzakiVar) {
        if (zzaknVar.zzcrc().isEmpty()) {
            return zzb(zzaknVar, zzakzVar, zzamlVar, zzakiVar);
        }
        zzajz value = zzakzVar.getValue();
        if (zzamlVar == null && value != null) {
            zzamlVar = value.zzs(zzajq.zzcvg());
        }
        ArrayList arrayList = new ArrayList();
        zzalz zzcvj = zzaknVar.zzcrc().zzcvj();
        zzakn zzc2 = zzaknVar.zzc(zzcvj);
        zzakz<zzajz> zzakzVar2 = zzakzVar.zzcxf().get(zzcvj);
        if (zzakzVar2 != null && zzc2 != null) {
            arrayList.addAll(zza(zzc2, zzakzVar2, zzamlVar != null ? zzamlVar.zzm(zzcvj) : null, zzakiVar.zzb(zzcvj)));
        }
        if (value != null) {
            arrayList.addAll(value.zza(zzaknVar, zzakiVar, zzamlVar));
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<zzalm> zza(zzakz<zzajz> zzakzVar) {
        ArrayList arrayList = new ArrayList();
        zza(zzakzVar, arrayList);
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<? extends zzalh> zza(zzall zzallVar, zzakn zzaknVar) {
        zzajq zzcrc = zzallVar.zzcrc();
        zzajz zzak = this.bfg.zzak(zzcrc);
        if ($assertionsDisabled || zzak != null) {
            return zzak.zza(zzaknVar, this.bfh.zzu(zzcrc), (zzaml) null);
        }
        throw new AssertionError("Missing sync point for query tag that we're tracking");
    }

    private void zza(zzakz<zzajz> zzakzVar, List<zzalm> list) {
        zzajz value = zzakzVar.getValue();
        if (value != null && value.zzcvy()) {
            list.add(value.zzcvz());
            return;
        }
        if (value != null) {
            list.addAll(value.zzcvx());
        }
        Iterator<Map.Entry<zzalz, zzakz<zzajz>>> it = zzakzVar.zzcxf().iterator();
        while (it.hasNext()) {
            zza(it.next().getValue(), list);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(zzall zzallVar, zzalm zzalmVar) {
        zzajq zzcrc = zzallVar.zzcrc();
        zzakb zze = zze(zzallVar);
        zzc zzcVar = new zzc(zzalmVar);
        this.bfl.zza(zzd(zzallVar), zze, zzcVar, zzcVar);
        zzakz<zzajz> zzai = this.bfg.zzai(zzcrc);
        if (zze == null) {
            zzai.zza(new zzakz.zza<zzajz, Void>() { // from class: com.google.android.gms.internal.zzaka.5
                @Override // com.google.android.gms.internal.zzakz.zza
                public Void zza(zzajq zzajqVar, zzajz zzajzVar, Void r8) {
                    if (!zzajqVar.isEmpty() && zzajzVar.zzcvy()) {
                        zzall zzcyi = zzajzVar.zzcvz().zzcyi();
                        zzaka.this.bfl.zza(zzaka.this.zzd(zzcyi), zzaka.this.zze(zzcyi));
                        return null;
                    }
                    for (zzalm zzalmVar2 : zzajzVar.zzcvx()) {
                        zzall zzcyi2 = zzalmVar2.zzcyi();
                        zzaka.this.bfl.zza(zzaka.this.zzd(zzcyi2), zzaka.this.zze(zzcyi2));
                    }
                    return null;
                }
            });
        } else if (!$assertionsDisabled && zzai.getValue().zzcvy()) {
            throw new AssertionError("If we're adding a query, it shouldn't be shadowed");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzaw(List<zzall> list) {
        for (zzall zzallVar : list) {
            if (!zzallVar.zzcye()) {
                zzakb zze = zze(zzallVar);
                if (!$assertionsDisabled && zze == null) {
                    throw new AssertionError();
                }
                this.bfj.remove(zzallVar);
                this.bfi.remove(zze);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public zzall zzb(zzakb zzakbVar) {
        return this.bfi.get(zzakbVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<zzalh> zzb(final zzakn zzaknVar, zzakz<zzajz> zzakzVar, zzaml zzamlVar, final zzaki zzakiVar) {
        zzajz value = zzakzVar.getValue();
        final zzaml zzs = (zzamlVar != null || value == null) ? zzamlVar : value.zzs(zzajq.zzcvg());
        final ArrayList arrayList = new ArrayList();
        zzakzVar.zzcxf().zza(new zzaim.zzb<zzalz, zzakz<zzajz>>() { // from class: com.google.android.gms.internal.zzaka.6
            @Override // com.google.android.gms.internal.zzaim.zzb
            /* renamed from: zza */
            public void zzk(zzalz zzalzVar, zzakz<zzajz> zzakzVar2) {
                zzaml zzamlVar2 = null;
                if (zzs != null) {
                    zzamlVar2 = zzs.zzm(zzalzVar);
                }
                zzaki zzb2 = zzakiVar.zzb(zzalzVar);
                zzakn zzc2 = zzaknVar.zzc(zzalzVar);
                if (zzc2 != null) {
                    arrayList.addAll(zzaka.this.zzb(zzc2, zzakzVar2, zzamlVar2, zzb2));
                }
            }
        });
        if (value != null) {
            arrayList.addAll(value.zza(zzaknVar, zzakiVar, zzs));
        }
        return arrayList;
    }

    private List<zzalh> zzb(final zzall zzallVar, final zzajl zzajlVar, final DatabaseError databaseError) {
        return (List) this.bff.zzf(new Callable<List<zzalh>>() { // from class: com.google.android.gms.internal.zzaka.4
            static final /* synthetic */ boolean $assertionsDisabled;

            static {
                $assertionsDisabled = !zzaka.class.desiredAssertionStatus();
            }

            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<zzalh> call() {
                boolean z;
                zzajq zzcrc = zzallVar.zzcrc();
                zzajz zzajzVar = (zzajz) zzaka.this.bfg.zzak(zzcrc);
                List<zzalh> arrayList = new ArrayList<>();
                if (zzajzVar != null && (zzallVar.isDefault() || zzajzVar.zzc(zzallVar))) {
                    zzank<List<zzall>, List<zzalh>> zza2 = zzajzVar.zza(zzallVar, zzajlVar, databaseError);
                    if (zzajzVar.isEmpty()) {
                        zzaka.this.bfg = zzaka.this.bfg.zzaj(zzcrc);
                    }
                    List<zzall> first = zza2.getFirst();
                    arrayList = zza2.A();
                    boolean z2 = false;
                    for (zzall zzallVar2 : first) {
                        zzaka.this.bff.zzh(zzallVar);
                        z2 = z2 || zzallVar2.zzcye();
                    }
                    zzakz zzakzVar = zzaka.this.bfg;
                    boolean z3 = zzakzVar.getValue() != null && ((zzajz) zzakzVar.getValue()).zzcvy();
                    Iterator<zzalz> it = zzcrc.iterator();
                    zzakz zzakzVar2 = zzakzVar;
                    while (true) {
                        z = z3;
                        if (!it.hasNext()) {
                            break;
                        }
                        zzakzVar2 = zzakzVar2.zze(it.next());
                        z3 = z || (zzakzVar2.getValue() != null && ((zzajz) zzakzVar2.getValue()).zzcvy());
                        if (z3) {
                            z = z3;
                            break;
                        } else if (zzakzVar2.isEmpty()) {
                            z = z3;
                            break;
                        }
                    }
                    if (z2 && !z) {
                        zzakz zzai = zzaka.this.bfg.zzai(zzcrc);
                        if (!zzai.isEmpty()) {
                            for (zzalm zzalmVar : zzaka.this.zza(zzai)) {
                                zzc zzcVar = new zzc(zzalmVar);
                                zzaka.this.bfl.zza(zzaka.this.zzd(zzalmVar.zzcyi()), zzcVar.bfF, zzcVar, zzcVar);
                            }
                        }
                    }
                    if (!z && !first.isEmpty() && databaseError == null) {
                        if (z2) {
                            zzaka.this.bfl.zza(zzaka.this.zzd(zzallVar), null);
                        } else {
                            for (zzall zzallVar3 : first) {
                                zzakb zze = zzaka.this.zze(zzallVar3);
                                if (!$assertionsDisabled && zze == null) {
                                    throw new AssertionError();
                                }
                                zzaka.this.bfl.zza(zzaka.this.zzd(zzallVar3), zze);
                            }
                        }
                    }
                    zzaka.this.zzaw(first);
                }
                return arrayList;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public zzakb zzcwb() {
        long j = this.bfm;
        this.bfm = 1 + j;
        return new zzakb(j);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public zzall zzd(zzall zzallVar) {
        return (!zzallVar.zzcye() || zzallVar.isDefault()) ? zzallVar : zzall.zzan(zzallVar.zzcrc());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public zzakb zze(zzall zzallVar) {
        return this.bfj.get(zzallVar);
    }

    public boolean isEmpty() {
        return this.bfg.isEmpty();
    }

    public List<? extends zzalh> zza(final long j, final boolean z, final boolean z2, final zzanf zzanfVar) {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.8
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() {
                zzakz zzakzVar;
                if (z2) {
                    zzaka.this.bff.zzby(j);
                }
                zzake zzcj = zzaka.this.bfh.zzcj(j);
                boolean zzck = zzaka.this.bfh.zzck(j);
                if (zzcj.isVisible() && !z) {
                    Map<String, Object> zza2 = zzajw.zza(zzanfVar);
                    if (zzcj.zzcwg()) {
                        zzaka.this.bff.zzk(zzcj.zzcrc(), zzajw.zza(zzcj.zzcwe(), zza2));
                    } else {
                        zzaka.this.bff.zzc(zzcj.zzcrc(), zzajw.zza(zzcj.zzcwf(), zza2));
                    }
                }
                if (!zzck) {
                    return Collections.emptyList();
                }
                zzakz zzcxe = zzakz.zzcxe();
                if (!zzcj.zzcwg()) {
                    Iterator<Map.Entry<zzajq, zzaml>> it = zzcj.zzcwf().iterator();
                    while (true) {
                        zzakzVar = zzcxe;
                        if (!it.hasNext()) {
                            break;
                        }
                        zzcxe = zzakzVar.zzb(it.next().getKey(), (zzajq) true);
                    }
                } else {
                    zzakzVar = zzcxe.zzb(zzajq.zzcvg(), (zzajq) true);
                }
                return zzaka.this.zza(new zzakk(zzcj.zzcrc(), zzakzVar, z));
            }
        });
    }

    public List<? extends zzalh> zza(final zzajq zzajqVar, final zzajh zzajhVar, final zzajh zzajhVar2, final long j, final boolean z) {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.7
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() throws Exception {
                if (z) {
                    zzaka.this.bff.zza(zzajqVar, zzajhVar, j);
                }
                zzaka.this.bfh.zza(zzajqVar, zzajhVar2, Long.valueOf(j));
                return zzaka.this.zza(new zzakm(zzako.bgp, zzajqVar, zzajhVar2));
            }
        });
    }

    public List<? extends zzalh> zza(final zzajq zzajqVar, final zzaml zzamlVar, final zzakb zzakbVar) {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.14
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() {
                zzall zzb2 = zzaka.this.zzb(zzakbVar);
                if (zzb2 != null) {
                    zzajq zza2 = zzajq.zza(zzb2.zzcrc(), zzajqVar);
                    zzaka.this.bff.zza(zza2.isEmpty() ? zzb2 : zzall.zzan(zzajqVar), zzamlVar);
                    return zzaka.this.zza(zzb2, new zzakp(zzako.zzc(zzb2.zzcyh()), zza2, zzamlVar));
                }
                return Collections.emptyList();
            }
        });
    }

    public List<? extends zzalh> zza(final zzajq zzajqVar, final zzaml zzamlVar, final zzaml zzamlVar2, final long j, final boolean z, final boolean z2) {
        zzann.zzb(z || !z2, "We shouldn't be persisting non-visible writes.");
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.1
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() {
                if (z2) {
                    zzaka.this.bff.zza(zzajqVar, zzamlVar, j);
                }
                zzaka.this.bfh.zza(zzajqVar, zzamlVar2, Long.valueOf(j), z);
                return !z ? Collections.emptyList() : zzaka.this.zza(new zzakp(zzako.bgp, zzajqVar, zzamlVar2));
            }
        });
    }

    public List<? extends zzalh> zza(zzajq zzajqVar, List<zzamq> list, zzakb zzakbVar) {
        zzall zzb2 = zzb(zzakbVar);
        if (zzb2 != null) {
            if (!$assertionsDisabled && !zzajqVar.equals(zzb2.zzcrc())) {
                throw new AssertionError();
            }
            zzajz zzak = this.bfg.zzak(zzb2.zzcrc());
            if (!$assertionsDisabled && zzak == null) {
                throw new AssertionError("Missing sync point for query tag that we're tracking");
            }
            zzalm zzb3 = zzak.zzb(zzb2);
            if (!$assertionsDisabled && zzb3 == null) {
                throw new AssertionError("Missing view for query tag that we're tracking");
            }
            zzaml zzcyj = zzb3.zzcyj();
            Iterator<zzamq> it = list.iterator();
            while (true) {
                zzaml zzamlVar = zzcyj;
                if (!it.hasNext()) {
                    return zza(zzajqVar, zzamlVar, zzakbVar);
                }
                zzcyj = it.next().zzr(zzamlVar);
            }
        } else {
            return Collections.emptyList();
        }
    }

    public List<? extends zzalh> zza(final zzajq zzajqVar, final Map<zzajq, zzaml> map) {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.11
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() {
                zzajh zzcb = zzajh.zzcb(map);
                zzaka.this.bff.zzd(zzajqVar, zzcb);
                return zzaka.this.zza(new zzakm(zzako.bgq, zzajqVar, zzcb));
            }
        });
    }

    public List<? extends zzalh> zza(final zzajq zzajqVar, final Map<zzajq, zzaml> map, final zzakb zzakbVar) {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.2
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() {
                zzall zzb2 = zzaka.this.zzb(zzakbVar);
                if (zzb2 != null) {
                    zzajq zza2 = zzajq.zza(zzb2.zzcrc(), zzajqVar);
                    zzajh zzcb = zzajh.zzcb(map);
                    zzaka.this.bff.zzd(zzajqVar, zzcb);
                    return zzaka.this.zza(zzb2, new zzakm(zzako.zzc(zzb2.zzcyh()), zza2, zzcb));
                }
                return Collections.emptyList();
            }
        });
    }

    public List<? extends zzalh> zza(final zzakb zzakbVar) {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.13
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() {
                zzall zzb2 = zzaka.this.zzb(zzakbVar);
                if (zzb2 != null) {
                    zzaka.this.bff.zzi(zzb2);
                    return zzaka.this.zza(zzb2, new zzakl(zzako.zzc(zzb2.zzcyh()), zzajq.zzcvg()));
                }
                return Collections.emptyList();
            }
        });
    }

    public List<zzalh> zza(zzall zzallVar, DatabaseError databaseError) {
        return zzb(zzallVar, null, databaseError);
    }

    public void zza(zzall zzallVar, boolean z) {
        if (z && !this.bfk.contains(zzallVar)) {
            zzg(new zzb(zzallVar));
            this.bfk.add(zzallVar);
        } else if (z || !this.bfk.contains(zzallVar)) {
        } else {
            zzh(new zzb(zzallVar));
            this.bfk.remove(zzallVar);
        }
    }

    public List<? extends zzalh> zzb(zzajq zzajqVar, List<zzamq> list) {
        zzalm zzcvz;
        zzajz zzak = this.bfg.zzak(zzajqVar);
        if (zzak != null && (zzcvz = zzak.zzcvz()) != null) {
            zzaml zzcyj = zzcvz.zzcyj();
            Iterator<zzamq> it = list.iterator();
            while (true) {
                zzaml zzamlVar = zzcyj;
                if (!it.hasNext()) {
                    return zzi(zzajqVar, zzamlVar);
                }
                zzcyj = it.next().zzr(zzamlVar);
            }
        }
        return Collections.emptyList();
    }

    public zzaml zzc(zzajq zzajqVar, List<Long> list) {
        zzaml zzs;
        zzakz<zzajz> zzakzVar = this.bfg;
        zzakzVar.getValue();
        zzaml zzamlVar = null;
        zzajq zzcvg = zzajq.zzcvg();
        zzakz<zzajz> zzakzVar2 = zzakzVar;
        zzajq zzajqVar2 = zzajqVar;
        while (true) {
            zzalz zzcvj = zzajqVar2.zzcvj();
            zzajq zzcvk = zzajqVar2.zzcvk();
            zzajq zza2 = zzcvg.zza(zzcvj);
            zzajq zza3 = zzajq.zza(zza2, zzajqVar);
            zzakzVar2 = zzcvj != null ? zzakzVar2.zze(zzcvj) : zzakz.zzcxe();
            zzajz value = zzakzVar2.getValue();
            zzs = value != null ? value.zzs(zza3) : zzamlVar;
            if (zzcvk.isEmpty() || zzs != null) {
                break;
            }
            zzamlVar = zzs;
            zzcvg = zza2;
            zzajqVar2 = zzcvk;
        }
        return this.bfh.zza(zzajqVar, zzs, list, true);
    }

    public List<? extends zzalh> zzcwa() {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.9
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() throws Exception {
                zzaka.this.bff.zzcrh();
                if (zzaka.this.bfh.zzcwj().isEmpty()) {
                    return Collections.emptyList();
                }
                return zzaka.this.zza(new zzakk(zzajq.zzcvg(), new zzakz(true), true));
            }
        });
    }

    public List<? extends zzalh> zzg(final zzajl zzajlVar) {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.3
            static final /* synthetic */ boolean $assertionsDisabled;

            static {
                $assertionsDisabled = !zzaka.class.desiredAssertionStatus();
            }

            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() {
                zzaml zzamlVar;
                boolean z;
                zzajz zzajzVar;
                zzald zzaldVar;
                zzaml zzs;
                boolean z2;
                zzaml zzamlVar2;
                zzall zzcud = zzajlVar.zzcud();
                zzajq zzcrc = zzcud.zzcrc();
                zzaml zzamlVar3 = null;
                zzajq zzajqVar = zzcrc;
                zzakz zzakzVar = zzaka.this.bfg;
                boolean z3 = false;
                while (!zzakzVar.isEmpty()) {
                    zzajz zzajzVar2 = (zzajz) zzakzVar.getValue();
                    if (zzajzVar2 != null) {
                        if (zzamlVar3 == null) {
                            zzamlVar3 = zzajzVar2.zzs(zzajqVar);
                        }
                        z2 = z3 || zzajzVar2.zzcvy();
                        zzamlVar2 = zzamlVar3;
                    } else {
                        z2 = z3;
                        zzamlVar2 = zzamlVar3;
                    }
                    zzakzVar = zzakzVar.zze(zzajqVar.isEmpty() ? zzalz.zzsx("") : zzajqVar.zzcvj());
                    zzajqVar = zzajqVar.zzcvk();
                    zzamlVar3 = zzamlVar2;
                    z3 = z2;
                }
                zzajz zzajzVar3 = (zzajz) zzaka.this.bfg.zzak(zzcrc);
                if (zzajzVar3 == null) {
                    zzajz zzajzVar4 = new zzajz(zzaka.this.bff);
                    zzaka.this.bfg = zzaka.this.bfg.zzb(zzcrc, (zzajq) zzajzVar4);
                    zzamlVar = zzamlVar3;
                    z = z3;
                    zzajzVar = zzajzVar4;
                } else {
                    boolean z4 = z3 || zzajzVar3.zzcvy();
                    if (zzamlVar3 == null) {
                        zzamlVar3 = zzajzVar3.zzs(zzajq.zzcvg());
                    }
                    zzamlVar = zzamlVar3;
                    z = z4;
                    zzajzVar = zzajzVar3;
                }
                zzaka.this.bff.zzg(zzcud);
                if (zzamlVar != null) {
                    zzaldVar = new zzald(zzamg.zza(zzamlVar, zzcud.zzcya()), true, false);
                } else {
                    zzald zzf = zzaka.this.bff.zzf(zzcud);
                    if (zzf.zzcxh()) {
                        zzaldVar = zzf;
                    } else {
                        zzaml zzczq = zzame.zzczq();
                        Iterator it = zzaka.this.bfg.zzai(zzcrc).zzcxf().iterator();
                        while (it.hasNext()) {
                            Map.Entry entry = (Map.Entry) it.next();
                            zzajz zzajzVar5 = (zzajz) ((zzakz) entry.getValue()).getValue();
                            zzczq = (zzajzVar5 == null || (zzs = zzajzVar5.zzs(zzajq.zzcvg())) == null) ? zzczq : zzczq.zze((zzalz) entry.getKey(), zzs);
                        }
                        for (zzamk zzamkVar : zzf.zzcqy()) {
                            if (!zzczq.zzk(zzamkVar.a())) {
                                zzczq = zzczq.zze(zzamkVar.a(), zzamkVar.zzcqy());
                            }
                        }
                        zzaldVar = new zzald(zzamg.zza(zzczq, zzcud.zzcya()), false, false);
                    }
                }
                boolean zzc2 = zzajzVar.zzc(zzcud);
                if (!zzc2 && !zzcud.zzcye()) {
                    if (!$assertionsDisabled && zzaka.this.bfj.containsKey(zzcud)) {
                        throw new AssertionError("View does not exist but we have a tag");
                    }
                    zzakb zzcwb = zzaka.this.zzcwb();
                    zzaka.this.bfj.put(zzcud, zzcwb);
                    zzaka.this.bfi.put(zzcwb, zzcud);
                }
                List<zzalg> zza2 = zzajzVar.zza(zzajlVar, zzaka.this.bfh.zzu(zzcrc), zzaldVar);
                if (!zzc2 && !z) {
                    zzaka.this.zza(zzcud, zzajzVar.zzb(zzcud));
                }
                return zza2;
            }
        });
    }

    public List<zzalh> zzh(zzajl zzajlVar) {
        return zzb(zzajlVar.zzcud(), zzajlVar, null);
    }

    public List<? extends zzalh> zzi(final zzajq zzajqVar, final zzaml zzamlVar) {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.10
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() {
                zzaka.this.bff.zza(zzall.zzan(zzajqVar), zzamlVar);
                return zzaka.this.zza(new zzakp(zzako.bgq, zzajqVar, zzamlVar));
            }
        });
    }

    public List<? extends zzalh> zzt(final zzajq zzajqVar) {
        return (List) this.bff.zzf(new Callable<List<? extends zzalh>>() { // from class: com.google.android.gms.internal.zzaka.12
            @Override // java.util.concurrent.Callable
            /* renamed from: zzbym */
            public List<? extends zzalh> call() {
                zzaka.this.bff.zzi(zzall.zzan(zzajqVar));
                return zzaka.this.zza(new zzakl(zzako.bgq, zzajqVar));
            }
        });
    }
}
