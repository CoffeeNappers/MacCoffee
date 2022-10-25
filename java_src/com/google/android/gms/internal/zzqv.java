package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;
/* loaded from: classes2.dex */
public class zzqv {
    private final Map<zzqq<?>, Boolean> zs = Collections.synchronizedMap(new WeakHashMap());
    private final Map<TaskCompletionSource<?>, Boolean> zt = Collections.synchronizedMap(new WeakHashMap());

    private void zza(boolean z, Status status) {
        HashMap hashMap;
        HashMap hashMap2;
        synchronized (this.zs) {
            hashMap = new HashMap(this.zs);
        }
        synchronized (this.zt) {
            hashMap2 = new HashMap(this.zt);
        }
        for (Map.Entry entry : hashMap.entrySet()) {
            if (z || ((Boolean) entry.getValue()).booleanValue()) {
                ((zzqq) entry.getKey()).zzab(status);
            }
        }
        for (Map.Entry entry2 : hashMap2.entrySet()) {
            if (z || ((Boolean) entry2.getValue()).booleanValue()) {
                ((TaskCompletionSource) entry2.getKey()).trySetException(new com.google.android.gms.common.api.zza(status));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(final zzqq<? extends Result> zzqqVar, boolean z) {
        this.zs.put(zzqqVar, Boolean.valueOf(z));
        zzqqVar.zza(new PendingResult.zza() { // from class: com.google.android.gms.internal.zzqv.1
            @Override // com.google.android.gms.common.api.PendingResult.zza
            public void zzx(Status status) {
                zzqv.this.zs.remove(zzqqVar);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <TResult> void zza(final TaskCompletionSource<TResult> taskCompletionSource, boolean z) {
        this.zt.put(taskCompletionSource, Boolean.valueOf(z));
        taskCompletionSource.getTask().addOnCompleteListener(new OnCompleteListener<TResult>() { // from class: com.google.android.gms.internal.zzqv.2
            @Override // com.google.android.gms.tasks.OnCompleteListener
            public void onComplete(@NonNull Task<TResult> task) {
                zzqv.this.zt.remove(taskCompletionSource);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzasi() {
        return !this.zs.isEmpty() || !this.zt.isEmpty();
    }

    public void zzasj() {
        zza(false, zzrh.AG);
    }

    public void zzask() {
        zza(true, zzsg.ym);
    }
}
