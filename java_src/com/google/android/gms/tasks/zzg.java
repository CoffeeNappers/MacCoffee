package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
import java.util.ArrayDeque;
import java.util.Queue;
/* loaded from: classes2.dex */
class zzg<TResult> {
    private Queue<zzf<TResult>> aMQ;
    private boolean aMR;
    private final Object zzako = new Object();

    public void zza(@NonNull Task<TResult> task) {
        zzf<TResult> poll;
        synchronized (this.zzako) {
            if (this.aMQ == null || this.aMR) {
                return;
            }
            this.aMR = true;
            while (true) {
                synchronized (this.zzako) {
                    poll = this.aMQ.poll();
                    if (poll == null) {
                        this.aMR = false;
                        return;
                    }
                }
                poll.onComplete(task);
            }
        }
    }

    public void zza(@NonNull zzf<TResult> zzfVar) {
        synchronized (this.zzako) {
            if (this.aMQ == null) {
                this.aMQ = new ArrayDeque();
            }
            this.aMQ.add(zzfVar);
        }
    }
}
