package com.google.android.gms.common;

import android.content.Intent;
/* loaded from: classes2.dex */
public class GooglePlayServicesRepairableException extends UserRecoverableException {
    private final int hM;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GooglePlayServicesRepairableException(int i, String str, Intent intent) {
        super(str, intent);
        this.hM = i;
    }

    public int getConnectionStatusCode() {
        return this.hM;
    }
}
