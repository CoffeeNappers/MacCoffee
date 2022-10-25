package com.google.android.gms.internal;

import com.google.android.gms.auth.api.proxy.ProxyApi;
import com.google.android.gms.auth.api.proxy.ProxyResponse;
import com.google.android.gms.common.api.Status;
/* loaded from: classes2.dex */
class zzod implements ProxyApi.ProxyResult {
    private Status hv;
    private ProxyResponse je;

    public zzod(ProxyResponse proxyResponse) {
        this.je = proxyResponse;
        this.hv = Status.xZ;
    }

    public zzod(Status status) {
        this.hv = status;
    }

    @Override // com.google.android.gms.auth.api.proxy.ProxyApi.ProxyResult
    public ProxyResponse getResponse() {
        return this.je;
    }

    @Override // com.google.android.gms.common.api.Result
    public Status getStatus() {
        return this.hv;
    }
}
