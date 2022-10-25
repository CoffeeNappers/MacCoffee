package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.atomic.AtomicInteger;
@zzji
/* loaded from: classes.dex */
public class zzls {

    /* loaded from: classes2.dex */
    public interface zza<D, R> {
        R apply(D d);
    }

    public static <A, B> zzlt<B> zza(final zzlt<A> zzltVar, final zza<A, B> zzaVar) {
        final zzlq zzlqVar = new zzlq();
        zzltVar.zzc(new Runnable() { // from class: com.google.android.gms.internal.zzls.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    zzlq.this.zzh(zzaVar.apply(zzltVar.get()));
                } catch (InterruptedException | CancellationException | ExecutionException e) {
                    zzlq.this.cancel(true);
                }
            }
        });
        return zzlqVar;
    }

    public static <V> zzlt<List<V>> zzo(final List<zzlt<V>> list) {
        final zzlq zzlqVar = new zzlq();
        final int size = list.size();
        final AtomicInteger atomicInteger = new AtomicInteger(0);
        for (zzlt<V> zzltVar : list) {
            zzltVar.zzc(new Runnable() { // from class: com.google.android.gms.internal.zzls.2
                @Override // java.lang.Runnable
                public void run() {
                    if (atomicInteger.incrementAndGet() >= size) {
                        try {
                            zzlqVar.zzh(zzls.zzp(list));
                        } catch (InterruptedException | ExecutionException e) {
                            zzkx.zzc("Unable to convert list of futures to a future of list", e);
                        }
                    }
                }
            });
        }
        return zzlqVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <V> List<V> zzp(List<zzlt<V>> list) throws ExecutionException, InterruptedException {
        ArrayList arrayList = new ArrayList();
        for (zzlt<V> zzltVar : list) {
            V v = zzltVar.get();
            if (v != null) {
                arrayList.add(v);
            }
        }
        return arrayList;
    }
}
