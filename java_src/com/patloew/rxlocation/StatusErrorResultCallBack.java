package com.patloew.rxlocation;

import android.support.annotation.NonNull;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import io.reactivex.FlowableEmitter;
/* loaded from: classes2.dex */
class StatusErrorResultCallBack implements ResultCallback<Status> {
    private final FlowableEmitter emitter;

    /* JADX INFO: Access modifiers changed from: package-private */
    public StatusErrorResultCallBack(@NonNull FlowableEmitter emitter) {
        this.emitter = emitter;
    }

    @Override // com.google.android.gms.common.api.ResultCallback
    public void onResult(@NonNull Status status) {
        if (!status.isSuccess()) {
            this.emitter.onError(new StatusException(status));
        }
    }
}
