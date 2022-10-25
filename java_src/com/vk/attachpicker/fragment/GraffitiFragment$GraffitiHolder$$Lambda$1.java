package com.vk.attachpicker.fragment;

import android.app.Activity;
import android.content.DialogInterface;
import com.vk.attachpicker.fragment.GraffitiFragment;
import com.vkontakte.android.api.Document;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GraffitiFragment$GraffitiHolder$$Lambda$1 implements DialogInterface.OnClickListener {
    private final GraffitiFragment.GraffitiHolder arg$1;
    private final Document arg$2;
    private final Activity arg$3;

    private GraffitiFragment$GraffitiHolder$$Lambda$1(GraffitiFragment.GraffitiHolder graffitiHolder, Document document, Activity activity) {
        this.arg$1 = graffitiHolder;
        this.arg$2 = document;
        this.arg$3 = activity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(GraffitiFragment.GraffitiHolder graffitiHolder, Document document, Activity activity) {
        return new GraffitiFragment$GraffitiHolder$$Lambda$1(graffitiHolder, document, activity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onLongClick$0(this.arg$2, this.arg$3, dialogInterface, i);
    }
}
