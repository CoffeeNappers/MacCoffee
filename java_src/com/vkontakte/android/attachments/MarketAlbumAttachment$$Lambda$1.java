package com.vkontakte.android.attachments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MarketAlbumAttachment$$Lambda$1 implements View.OnClickListener {
    private final MarketAlbumAttachment arg$1;

    private MarketAlbumAttachment$$Lambda$1(MarketAlbumAttachment marketAlbumAttachment) {
        this.arg$1 = marketAlbumAttachment;
    }

    public static View.OnClickListener lambdaFactory$(MarketAlbumAttachment marketAlbumAttachment) {
        return new MarketAlbumAttachment$$Lambda$1(marketAlbumAttachment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$0(view);
    }
}
