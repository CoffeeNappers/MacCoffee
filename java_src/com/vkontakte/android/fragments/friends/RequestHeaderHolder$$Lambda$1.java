package com.vkontakte.android.fragments.friends;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RequestHeaderHolder$$Lambda$1 implements View.OnClickListener {
    private final RequestHeaderHolder arg$1;

    private RequestHeaderHolder$$Lambda$1(RequestHeaderHolder requestHeaderHolder) {
        this.arg$1 = requestHeaderHolder;
    }

    public static View.OnClickListener lambdaFactory$(RequestHeaderHolder requestHeaderHolder) {
        return new RequestHeaderHolder$$Lambda$1(requestHeaderHolder);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
