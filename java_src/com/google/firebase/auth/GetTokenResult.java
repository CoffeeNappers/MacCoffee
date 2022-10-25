package com.google.firebase.auth;

import android.support.annotation.Nullable;
/* loaded from: classes2.dex */
public class GetTokenResult {
    private String hN;

    public GetTokenResult(String str) {
        this.hN = str;
    }

    @Nullable
    public String getToken() {
        return this.hN;
    }
}
