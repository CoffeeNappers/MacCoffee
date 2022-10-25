package com.vkontakte.android.attachments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MarketAttachment$$Lambda$1 implements View.OnClickListener {
    private final MarketAttachment arg$1;
    private final View arg$2;

    private MarketAttachment$$Lambda$1(MarketAttachment marketAttachment, View view) {
        this.arg$1 = marketAttachment;
        this.arg$2 = view;
    }

    public static View.OnClickListener lambdaFactory$(MarketAttachment marketAttachment, View view) {
        return new MarketAttachment$$Lambda$1(marketAttachment, view);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$0(this.arg$2, view);
    }
}
