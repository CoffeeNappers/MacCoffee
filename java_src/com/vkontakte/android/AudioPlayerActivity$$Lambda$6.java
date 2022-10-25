package com.vkontakte.android;

import android.view.View;
import android.widget.PopupMenu;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioPlayerActivity$$Lambda$6 implements PopupMenu.OnDismissListener {
    private final AudioPlayerActivity arg$1;
    private final View arg$2;

    private AudioPlayerActivity$$Lambda$6(AudioPlayerActivity audioPlayerActivity, View view) {
        this.arg$1 = audioPlayerActivity;
        this.arg$2 = view;
    }

    public static PopupMenu.OnDismissListener lambdaFactory$(AudioPlayerActivity audioPlayerActivity, View view) {
        return new AudioPlayerActivity$$Lambda$6(audioPlayerActivity, view);
    }

    @Override // android.widget.PopupMenu.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(PopupMenu popupMenu) {
        this.arg$1.lambda$onClick$4(this.arg$2, popupMenu);
    }
}
