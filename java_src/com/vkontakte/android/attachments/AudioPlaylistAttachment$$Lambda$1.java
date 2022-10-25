package com.vkontakte.android.attachments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioPlaylistAttachment$$Lambda$1 implements View.OnClickListener {
    private final AudioPlaylistAttachment arg$1;
    private final View arg$2;

    private AudioPlaylistAttachment$$Lambda$1(AudioPlaylistAttachment audioPlaylistAttachment, View view) {
        this.arg$1 = audioPlaylistAttachment;
        this.arg$2 = view;
    }

    public static View.OnClickListener lambdaFactory$(AudioPlaylistAttachment audioPlaylistAttachment, View view) {
        return new AudioPlaylistAttachment$$Lambda$1(audioPlaylistAttachment, view);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$0(this.arg$2, view);
    }
}
