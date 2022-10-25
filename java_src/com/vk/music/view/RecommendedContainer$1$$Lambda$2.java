package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.view.RecommendedContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RecommendedContainer$1$$Lambda$2 implements DialogInterface.OnClickListener {
    private static final RecommendedContainer$1$$Lambda$2 instance = new RecommendedContainer$1$$Lambda$2();

    private RecommendedContainer$1$$Lambda$2() {
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        RecommendedContainer.AnonymousClass1.lambda$onActionClick$1(dialogInterface, i);
    }
}
