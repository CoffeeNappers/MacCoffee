package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AudioPlayerActivity$$Lambda$4 implements DialogInterface.OnClickListener {
    private final AudioPlayerActivity arg$1;
    private final boolean[] arg$2;
    private final ArrayList arg$3;

    private AudioPlayerActivity$$Lambda$4(AudioPlayerActivity audioPlayerActivity, boolean[] zArr, ArrayList arrayList) {
        this.arg$1 = audioPlayerActivity;
        this.arg$2 = zArr;
        this.arg$3 = arrayList;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(AudioPlayerActivity audioPlayerActivity, boolean[] zArr, ArrayList arrayList) {
        return new AudioPlayerActivity$$Lambda$4(audioPlayerActivity, zArr, arrayList);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showBroadcastDialog$3(this.arg$2, this.arg$3, dialogInterface, i);
    }
}
