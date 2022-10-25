package com.vkontakte.android;

import android.content.DialogInterface;
import com.vkontakte.android.audio.player.PlayerTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AudioPlayerActivity$$Lambda$1 implements DialogInterface.OnClickListener {
    private final AudioPlayerActivity arg$1;
    private final PlayerTrack arg$2;

    private AudioPlayerActivity$$Lambda$1(AudioPlayerActivity audioPlayerActivity, PlayerTrack playerTrack) {
        this.arg$1 = audioPlayerActivity;
        this.arg$2 = playerTrack;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(AudioPlayerActivity audioPlayerActivity, PlayerTrack playerTrack) {
        return new AudioPlayerActivity$$Lambda$1(audioPlayerActivity, playerTrack);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$confirmAndDelete$0(this.arg$2, dialogInterface, i);
    }
}
