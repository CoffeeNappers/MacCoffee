package com.vkontakte.android.ui.holder.messages;

import android.content.DialogInterface;
import com.vkontakte.android.DialogEntry;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogHolder$$Lambda$1 implements DialogInterface.OnClickListener {
    private final DialogHolder arg$1;
    private final boolean arg$2;
    private final boolean arg$3;
    private final DialogEntry arg$4;

    private DialogHolder$$Lambda$1(DialogHolder dialogHolder, boolean z, boolean z2, DialogEntry dialogEntry) {
        this.arg$1 = dialogHolder;
        this.arg$2 = z;
        this.arg$3 = z2;
        this.arg$4 = dialogEntry;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(DialogHolder dialogHolder, boolean z, boolean z2, DialogEntry dialogEntry) {
        return new DialogHolder$$Lambda$1(dialogHolder, z, z2, dialogEntry);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onLongClick$0(this.arg$2, this.arg$3, this.arg$4, dialogInterface, i);
    }
}
