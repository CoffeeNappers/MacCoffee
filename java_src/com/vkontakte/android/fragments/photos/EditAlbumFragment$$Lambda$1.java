package com.vkontakte.android.fragments.photos;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditAlbumFragment$$Lambda$1 implements View.OnClickListener {
    private final EditAlbumFragment arg$1;

    private EditAlbumFragment$$Lambda$1(EditAlbumFragment editAlbumFragment) {
        this.arg$1 = editAlbumFragment;
    }

    public static View.OnClickListener lambdaFactory$(EditAlbumFragment editAlbumFragment) {
        return new EditAlbumFragment$$Lambda$1(editAlbumFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$0(view);
    }
}
