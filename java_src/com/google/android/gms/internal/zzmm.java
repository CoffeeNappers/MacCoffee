package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.view.View;
import android.webkit.WebChromeClient;
@zzji
@TargetApi(14)
/* loaded from: classes.dex */
public final class zzmm extends zzmk {
    public zzmm(zzmd zzmdVar) {
        super(zzmdVar);
    }

    @Override // android.webkit.WebChromeClient
    public void onShowCustomView(View view, int i, WebChromeClient.CustomViewCallback customViewCallback) {
        zza(view, i, customViewCallback);
    }
}
