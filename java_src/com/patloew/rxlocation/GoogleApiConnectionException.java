package com.patloew.rxlocation;

import com.google.android.gms.common.ConnectionResult;
/* loaded from: classes2.dex */
public class GoogleApiConnectionException extends RuntimeException {
    private final ConnectionResult connectionResult;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GoogleApiConnectionException(String detailMessage, ConnectionResult connectionResult) {
        super(detailMessage);
        this.connectionResult = connectionResult;
    }

    public ConnectionResult getConnectionResult() {
        return this.connectionResult;
    }

    public boolean wasResolutionUnsuccessful() {
        if (this.connectionResult != null) {
            return this.connectionResult.hasResolution();
        }
        return false;
    }
}
