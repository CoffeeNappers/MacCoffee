package com.vkontakte.android.ui.holder.audio;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioViewHolderAttach$$Lambda$1 implements View.OnClickListener {
    private final AudioViewHolderAttach arg$1;

    private AudioViewHolderAttach$$Lambda$1(AudioViewHolderAttach audioViewHolderAttach) {
        this.arg$1 = audioViewHolderAttach;
    }

    public static View.OnClickListener lambdaFactory$(AudioViewHolderAttach audioViewHolderAttach) {
        return new AudioViewHolderAttach$$Lambda$1(audioViewHolderAttach);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
