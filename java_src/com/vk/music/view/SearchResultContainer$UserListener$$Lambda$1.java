package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.view.SearchResultContainer;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SearchResultContainer$UserListener$$Lambda$1 implements DialogInterface.OnClickListener {
    private final SearchResultContainer.UserListener arg$1;
    private final MusicTrack arg$2;

    private SearchResultContainer$UserListener$$Lambda$1(SearchResultContainer.UserListener userListener, MusicTrack musicTrack) {
        this.arg$1 = userListener;
        this.arg$2 = musicTrack;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(SearchResultContainer.UserListener userListener, MusicTrack musicTrack) {
        return new SearchResultContainer$UserListener$$Lambda$1(userListener, musicTrack);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onActionClick$0(this.arg$2, dialogInterface, i);
    }
}
