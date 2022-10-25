package com.vk.music.view;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SearchResultContainer$$Lambda$4 implements ItemViewHolder.ClickListener {
    private final SearchResultContainer arg$1;

    private SearchResultContainer$$Lambda$4(SearchResultContainer searchResultContainer) {
        this.arg$1 = searchResultContainer;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(SearchResultContainer searchResultContainer) {
        return new SearchResultContainer$$Lambda$4(searchResultContainer);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$new$3(view, (MusicTrack) obj, i);
    }
}
