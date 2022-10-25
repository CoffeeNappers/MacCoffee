package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public interface Continuation<TResult, TContinuationResult> {
    TContinuationResult then(@NonNull Task<TResult> task) throws Exception;
}
