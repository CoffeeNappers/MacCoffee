package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import android.webkit.WebView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PostListFragment$$Lambda$7 implements DialogInterface.OnDismissListener {
    private final WebView arg$1;

    private PostListFragment$$Lambda$7(WebView webView) {
        this.arg$1 = webView;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(WebView webView) {
        return new PostListFragment$$Lambda$7(webView);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        PostListFragment.lambda$performPostAction$5(this.arg$1, dialogInterface);
    }
}
