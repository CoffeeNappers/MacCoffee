package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.view.RecommendedContainer;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class RecommendedContainer$1$$Lambda$1 implements DialogInterface.OnClickListener {
    private final RecommendedContainer.AnonymousClass1 arg$1;
    private final MusicTrack arg$2;

    private RecommendedContainer$1$$Lambda$1(RecommendedContainer.AnonymousClass1 anonymousClass1, MusicTrack musicTrack) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = musicTrack;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(RecommendedContainer.AnonymousClass1 anonymousClass1, MusicTrack musicTrack) {
        return new RecommendedContainer$1$$Lambda$1(anonymousClass1, musicTrack);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onActionClick$0(this.arg$2, dialogInterface, i);
    }
}
