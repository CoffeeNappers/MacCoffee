package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioPlayerActivity$$Lambda$3 implements DialogInterface.OnMultiChoiceClickListener {
    private final boolean[] arg$1;

    private AudioPlayerActivity$$Lambda$3(boolean[] zArr) {
        this.arg$1 = zArr;
    }

    public static DialogInterface.OnMultiChoiceClickListener lambdaFactory$(boolean[] zArr) {
        return new AudioPlayerActivity$$Lambda$3(zArr);
    }

    @Override // android.content.DialogInterface.OnMultiChoiceClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i, boolean z) {
        AudioPlayerActivity.lambda$showBroadcastDialog$2(this.arg$1, dialogInterface, i, z);
    }
}
