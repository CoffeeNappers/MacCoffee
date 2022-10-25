package com.vkontakte.android;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GameCardActivity$$Lambda$2 implements DialogInterface.OnClickListener {
    private final GameCardActivity arg$1;

    private GameCardActivity$$Lambda$2(GameCardActivity gameCardActivity) {
        this.arg$1 = gameCardActivity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(GameCardActivity gameCardActivity) {
        return new GameCardActivity$$Lambda$2(gameCardActivity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$null$0(dialogInterface, i);
    }
}
