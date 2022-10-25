package com.google.android.gms.auth.api.credentials.internal;

import com.google.android.gms.auth.api.credentials.Credential;
import com.google.android.gms.auth.api.credentials.CredentialRequestResult;
import com.google.android.gms.common.api.Status;
/* loaded from: classes2.dex */
public final class zzd implements CredentialRequestResult {
    private final Status hv;
    private final Credential iP;

    public zzd(Status status, Credential credential) {
        this.hv = status;
        this.iP = credential;
    }

    public static zzd zzi(Status status) {
        return new zzd(status, null);
    }

    @Override // com.google.android.gms.auth.api.credentials.CredentialRequestResult
    public Credential getCredential() {
        return this.iP;
    }

    @Override // com.google.android.gms.common.api.Result
    public Status getStatus() {
        return this.hv;
    }
}
