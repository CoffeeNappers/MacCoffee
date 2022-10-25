package com.vkontakte.android.fragments.videos;

import com.vkontakte.android.dialogs.PromptDialog;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideosFragment$$Lambda$2 implements PromptDialog.Listener {
    private final VideosFragment arg$1;

    private VideosFragment$$Lambda$2(VideosFragment videosFragment) {
        this.arg$1 = videosFragment;
    }

    public static PromptDialog.Listener lambdaFactory$(VideosFragment videosFragment) {
        return new VideosFragment$$Lambda$2(videosFragment);
    }

    @Override // com.vkontakte.android.dialogs.PromptDialog.Listener
    @LambdaForm.Hidden
    public void onFinish(CharSequence charSequence) {
        this.arg$1.lambda$showAddLinkDialog$1(charSequence);
    }
}
