package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.tasks.TaskCompletionSource;
/* loaded from: classes2.dex */
public abstract class zzse<A extends Api.zzb, TResult> {
    /* JADX INFO: Access modifiers changed from: protected */
    public abstract void zzb(A a, TaskCompletionSource<TResult> taskCompletionSource) throws RemoteException;
}
