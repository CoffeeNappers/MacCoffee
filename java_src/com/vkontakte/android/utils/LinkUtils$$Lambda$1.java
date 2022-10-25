package com.vkontakte.android.utils;

import android.app.ProgressDialog;
import android.content.Context;
import android.webkit.WebView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class LinkUtils$$Lambda$1 implements Runnable {
    private final WebView arg$1;
    private final ProgressDialog arg$2;
    private final Context arg$3;

    private LinkUtils$$Lambda$1(WebView webView, ProgressDialog progressDialog, Context context) {
        this.arg$1 = webView;
        this.arg$2 = progressDialog;
        this.arg$3 = context;
    }

    public static Runnable lambdaFactory$(WebView webView, ProgressDialog progressDialog, Context context) {
        return new LinkUtils$$Lambda$1(webView, progressDialog, context);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        LinkUtils.lambda$processInternalHiddenLink$0(this.arg$1, this.arg$2, this.arg$3);
    }
}
