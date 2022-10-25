package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public abstract class zzat extends zzar {
    protected boolean zzagy;
    protected String zzagz;
    protected boolean zzaha;
    protected boolean zzahb;
    protected static final Object zzagw = new Object();
    private static final String TAG = zzat.class.getSimpleName();
    protected static volatile zzbc zzagd = null;
    static boolean zzagx = false;
    private static long startTime = 0;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzat(Context context, String str) {
        super(context);
        this.zzagy = false;
        this.zzaha = false;
        this.zzahb = false;
        this.zzagz = str;
        this.zzagy = false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzat(Context context, String str, boolean z) {
        super(context);
        this.zzagy = false;
        this.zzaha = false;
        this.zzahb = false;
        this.zzagz = str;
        this.zzagy = z;
    }

    static zzbd zza(zzbc zzbcVar, MotionEvent motionEvent, DisplayMetrics displayMetrics) throws zzaz {
        Method zzc = zzbcVar.zzc(zzay.zzcg(), zzay.zzch());
        if (zzc == null || motionEvent == null) {
            throw new zzaz();
        }
        try {
            return new zzbd((String) zzc.invoke(null, motionEvent, displayMetrics));
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new zzaz(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static synchronized void zza(Context context, boolean z) {
        synchronized (zzat.class) {
            if (!zzagx) {
                startTime = zzbe.zzdf().longValue() / 1000;
                zzagd = zzb(context, z);
                zzagx = true;
            }
        }
    }

    private static void zza(zzbc zzbcVar) {
        List<Class> singletonList = Collections.singletonList(Context.class);
        zzbcVar.zza(zzay.zzbm(), zzay.zzbn(), singletonList);
        zzbcVar.zza(zzay.zzbw(), zzay.zzbx(), singletonList);
        zzbcVar.zza(zzay.zzbu(), zzay.zzbv(), singletonList);
        zzbcVar.zza(zzay.zzbg(), zzay.zzbh(), singletonList);
        zzbcVar.zza(zzay.zzbq(), zzay.zzbr(), singletonList);
        zzbcVar.zza(zzay.zzbc(), zzay.zzbd(), singletonList);
        zzbcVar.zza(zzay.zzci(), zzay.zzcj(), singletonList);
        List<Class> asList = Arrays.asList(MotionEvent.class, DisplayMetrics.class);
        zzbcVar.zza(zzay.zzcg(), zzay.zzch(), asList);
        zzbcVar.zza(zzay.zzce(), zzay.zzcf(), asList);
        zzbcVar.zza(zzay.zzbk(), zzay.zzbl(), Collections.emptyList());
        zzbcVar.zza(zzay.zzcc(), zzay.zzcd(), Collections.emptyList());
        zzbcVar.zza(zzay.zzbs(), zzay.zzbt(), Collections.emptyList());
        zzbcVar.zza(zzay.zzbi(), zzay.zzbj(), Collections.emptyList());
        zzbcVar.zza(zzay.zzbo(), zzay.zzbp(), Collections.emptyList());
        zzbcVar.zza(zzay.zzca(), zzay.zzcb(), Collections.emptyList());
        zzbcVar.zza(zzay.zzbe(), zzay.zzbf(), Arrays.asList(Context.class, Boolean.TYPE, Boolean.TYPE));
        zzbcVar.zza(zzay.zzby(), zzay.zzbz(), Arrays.asList(StackTraceElement[].class));
        zzbcVar.zza(zzay.zzck(), zzay.zzcl(), Arrays.asList(View.class));
    }

    private void zza(zzbc zzbcVar, zzaf.zza zzaVar) {
        try {
            zzbd zza = zza(zzbcVar, this.zzagj, this.zzagu);
            zzaVar.zzdn = zza.zzain;
            zzaVar.zzdo = zza.zzaio;
            zzaVar.zzdp = zza.zzaip;
            if (this.zzagt) {
                zzaVar.zzeb = zza.zzff;
                zzaVar.zzec = zza.zzfd;
            }
            if (zzdr.zzbhw.get().booleanValue() || zzdr.zzbhr.get().booleanValue()) {
                zzaf.zza.C0071zza c0071zza = new zzaf.zza.C0071zza();
                zzbd zzb = zzb(this.zzagj);
                c0071zza.zzdn = zzb.zzain;
                c0071zza.zzdo = zzb.zzaio;
                c0071zza.zzfi = zzb.zzaip;
                if (this.zzagt) {
                    c0071zza.zzfd = zzb.zzfd;
                    c0071zza.zzff = zzb.zzff;
                    c0071zza.zzfh = Integer.valueOf(zzb.zzaiq.longValue() != 0 ? 1 : 0);
                    if (this.zzagm > 0) {
                        c0071zza.zzfe = this.zzagu != null ? Long.valueOf(Math.round(this.zzagr / this.zzagm)) : null;
                        c0071zza.zzfg = Long.valueOf(Math.round(this.zzagq / this.zzagm));
                    }
                    c0071zza.zzfk = zzb.zzfk;
                    c0071zza.zzfj = zzb.zzfj;
                    c0071zza.zzfl = Integer.valueOf(zzb.zzait.longValue() != 0 ? 1 : 0);
                    if (this.zzagp > 0) {
                        c0071zza.zzfm = Long.valueOf(this.zzagp);
                    }
                }
                zzaVar.zzes = c0071zza;
            }
        } catch (zzaz e) {
        }
        if (this.zzagl > 0) {
            zzaVar.zzeg = Long.valueOf(this.zzagl);
        }
        if (this.zzagm > 0) {
            zzaVar.zzef = Long.valueOf(this.zzagm);
        }
        if (this.zzagn > 0) {
            zzaVar.zzee = Long.valueOf(this.zzagn);
        }
        if (this.zzago > 0) {
            zzaVar.zzeh = Long.valueOf(this.zzago);
        }
        try {
            int size = this.zzagk.size() - 1;
            if (size <= 0) {
                return;
            }
            zzaVar.zzet = new zzaf.zza.C0071zza[size];
            for (int i = 0; i < size; i++) {
                zzbd zza2 = zza(zzbcVar, this.zzagk.get(i), this.zzagu);
                zzaf.zza.C0071zza c0071zza2 = new zzaf.zza.C0071zza();
                c0071zza2.zzdn = zza2.zzain;
                c0071zza2.zzdo = zza2.zzaio;
                zzaVar.zzet[i] = c0071zza2;
            }
        } catch (zzaz e2) {
            zzaVar.zzet = null;
        }
    }

    protected static zzbc zzb(Context context, boolean z) {
        if (zzagd == null) {
            synchronized (zzagw) {
                if (zzagd == null) {
                    zzbc zza = zzbc.zza(context, zzay.getKey(), zzay.zzbb(), z);
                    zza(zza);
                    zzagd = zza;
                }
            }
        }
        return zzagd;
    }

    @Override // com.google.android.gms.internal.zzar
    protected long zza(StackTraceElement[] stackTraceElementArr) throws zzaz {
        Method zzc = zzagd.zzc(zzay.zzby(), zzay.zzbz());
        if (zzc == null || stackTraceElementArr == null) {
            throw new zzaz();
        }
        try {
            return new zzba((String) zzc.invoke(null, stackTraceElementArr)).zzahn.longValue();
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new zzaz(e);
        }
    }

    @Override // com.google.android.gms.internal.zzar
    protected zzaf.zza zza(Context context, View view) {
        zzaf.zza zzaVar = new zzaf.zza();
        if (!TextUtils.isEmpty(this.zzagz)) {
            zzaVar.zzda = this.zzagz;
        }
        zzbc zzb = zzb(context, this.zzagy);
        zzb.zzdd();
        zzb(zzb, zzaVar, view);
        zzb.zzde();
        return zzaVar;
    }

    @Override // com.google.android.gms.internal.zzar
    protected zzaf.zza zza(Context context, zzad.zza zzaVar) {
        zzaf.zza zzaVar2 = new zzaf.zza();
        if (!TextUtils.isEmpty(this.zzagz)) {
            zzaVar2.zzda = this.zzagz;
        }
        zzbc zzb = zzb(context, this.zzagy);
        zzb.zzdd();
        zza(zzb, zzaVar2, zzaVar);
        zzb.zzde();
        return zzaVar2;
    }

    protected List<Callable<Void>> zza(zzbc zzbcVar, zzaf.zza zzaVar, View view) {
        ArrayList arrayList = new ArrayList();
        if (zzbcVar.zzcm() == null) {
            return arrayList;
        }
        int zzaw = zzbcVar.zzaw();
        arrayList.add(new zzbn(zzbcVar, zzaVar));
        arrayList.add(new zzbq(zzbcVar, zzay.zzbs(), zzay.zzbt(), zzaVar, zzaw, 1));
        arrayList.add(new zzbl(zzbcVar, zzay.zzbk(), zzay.zzbl(), zzaVar, startTime, zzaw, 25));
        arrayList.add(new zzbk(zzbcVar, zzay.zzbi(), zzay.zzbj(), zzaVar, zzaw, 44));
        arrayList.add(new zzbg(zzbcVar, zzay.zzbc(), zzay.zzbd(), zzaVar, zzaw, 3));
        arrayList.add(new zzbo(zzbcVar, zzay.zzbo(), zzay.zzbp(), zzaVar, zzaw, 22));
        if (zzdr.zzbic.get().booleanValue() || zzdr.zzbhr.get().booleanValue()) {
            arrayList.add(new zzbj(zzbcVar, zzay.zzbg(), zzay.zzbh(), zzaVar, zzaw, 5));
        }
        if (zzdr.zzbhv.get().booleanValue() || zzdr.zzbhr.get().booleanValue()) {
            arrayList.add(new zzbv(zzbcVar, zzay.zzci(), zzay.zzcj(), zzaVar, zzaw, 48));
        }
        if (zzdr.zzbia.get().booleanValue() || zzdr.zzbhr.get().booleanValue()) {
            arrayList.add(new zzbt(zzbcVar, zzay.zzca(), zzay.zzcb(), zzaVar, zzaw, 51));
        }
        if (zzdr.zzbif.get().booleanValue() || zzdr.zzbhr.get().booleanValue()) {
            arrayList.add(new zzbs(zzbcVar, zzay.zzby(), zzay.zzbz(), zzaVar, zzaw, 45, new Throwable().getStackTrace()));
        }
        if (zzdr.zzbig.get().booleanValue()) {
            arrayList.add(new zzbw(zzbcVar, zzay.zzck(), zzay.zzcl(), zzaVar, zzaw, 57, view));
        }
        return arrayList;
    }

    protected void zza(zzbc zzbcVar, zzaf.zza zzaVar, zzad.zza zzaVar2) {
        if (zzbcVar.zzcm() == null) {
            return;
        }
        zza(zzb(zzbcVar, zzaVar, zzaVar2));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zza(List<Callable<Void>> list) {
        ExecutorService zzcm;
        if (zzagd == null || (zzcm = zzagd.zzcm()) == null || list.isEmpty()) {
            return;
        }
        try {
            zzcm.invokeAll(list, zzdr.zzbhm.get().longValue(), TimeUnit.MILLISECONDS);
        } catch (InterruptedException e) {
            Log.d(TAG, String.format("class methods got exception: %s", zzbe.zza(e)));
        }
    }

    @Override // com.google.android.gms.internal.zzar
    protected zzbd zzb(MotionEvent motionEvent) throws zzaz {
        Method zzc = zzagd.zzc(zzay.zzce(), zzay.zzcf());
        if (zzc == null || motionEvent == null) {
            throw new zzaz();
        }
        try {
            return new zzbd((String) zzc.invoke(null, motionEvent, this.zzagu));
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new zzaz(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public List<Callable<Void>> zzb(zzbc zzbcVar, zzaf.zza zzaVar, zzad.zza zzaVar2) {
        int zzaw = zzbcVar.zzaw();
        ArrayList arrayList = new ArrayList();
        arrayList.add(new zzbi(zzbcVar, zzay.zzbe(), zzay.zzbf(), zzaVar, zzaw, 27, zzdr.zzbhq.get().booleanValue() || zzdr.zzbhr.get().booleanValue(), zzaVar2));
        arrayList.add(new zzbl(zzbcVar, zzay.zzbk(), zzay.zzbl(), zzaVar, startTime, zzaw, 25));
        arrayList.add(new zzbq(zzbcVar, zzay.zzbs(), zzay.zzbt(), zzaVar, zzaw, 1));
        arrayList.add(new zzbr(zzbcVar, zzay.zzbu(), zzay.zzbv(), zzaVar, zzaw, 31));
        arrayList.add(new zzbu(zzbcVar, zzay.zzcc(), zzay.zzcd(), zzaVar, zzaw, 33));
        arrayList.add(new zzbh(zzbcVar, zzay.zzbw(), zzay.zzbx(), zzaVar, zzaw, 29));
        arrayList.add(new zzbj(zzbcVar, zzay.zzbg(), zzay.zzbh(), zzaVar, zzaw, 5));
        arrayList.add(new zzbp(zzbcVar, zzay.zzbq(), zzay.zzbr(), zzaVar, zzaw, 12));
        arrayList.add(new zzbg(zzbcVar, zzay.zzbc(), zzay.zzbd(), zzaVar, zzaw, 3));
        arrayList.add(new zzbk(zzbcVar, zzay.zzbi(), zzay.zzbj(), zzaVar, zzaw, 44));
        arrayList.add(new zzbo(zzbcVar, zzay.zzbo(), zzay.zzbp(), zzaVar, zzaw, 22));
        if (zzdr.zzbht.get().booleanValue() || zzdr.zzbhr.get().booleanValue()) {
            arrayList.add(new zzbv(zzbcVar, zzay.zzci(), zzay.zzcj(), zzaVar, zzaw, 48));
        }
        if (zzdr.zzbhy.get().booleanValue() || zzdr.zzbhr.get().booleanValue()) {
            arrayList.add(new zzbt(zzbcVar, zzay.zzca(), zzay.zzcb(), zzaVar, zzaw, 51));
        }
        return arrayList;
    }

    protected void zzb(zzbc zzbcVar, zzaf.zza zzaVar, View view) {
        zza(zzbcVar, zzaVar);
        zza(zza(zzbcVar, zzaVar, view));
    }
}
