package com.vkontakte.android.ui;

import android.content.Context;
import android.content.DialogInterface;
import com.vkontakte.android.LinkSpan;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class ClickableLinksDelegate$$Lambda$1 implements DialogInterface.OnClickListener {
    private final ArrayList arg$1;
    private final LinkSpan arg$2;
    private final Context arg$3;

    private ClickableLinksDelegate$$Lambda$1(ArrayList arrayList, LinkSpan linkSpan, Context context) {
        this.arg$1 = arrayList;
        this.arg$2 = linkSpan;
        this.arg$3 = context;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ArrayList arrayList, LinkSpan linkSpan, Context context) {
        return new ClickableLinksDelegate$$Lambda$1(arrayList, linkSpan, context);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        ClickableLinksDelegate.lambda$showMessageOptions$0(this.arg$1, this.arg$2, this.arg$3, dialogInterface, i);
    }
}
