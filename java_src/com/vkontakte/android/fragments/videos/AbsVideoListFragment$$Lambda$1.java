package com.vkontakte.android.fragments.videos;

import android.content.DialogInterface;
import com.vkontakte.android.api.VideoFile;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AbsVideoListFragment$$Lambda$1 implements DialogInterface.OnClickListener {
    private final AbsVideoListFragment arg$1;
    private final VideoFile arg$2;

    private AbsVideoListFragment$$Lambda$1(AbsVideoListFragment absVideoListFragment, VideoFile videoFile) {
        this.arg$1 = absVideoListFragment;
        this.arg$2 = videoFile;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(AbsVideoListFragment absVideoListFragment, VideoFile videoFile) {
        return new AbsVideoListFragment$$Lambda$1(absVideoListFragment, videoFile);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showVideoFileDeleteDialog$0(this.arg$2, dialogInterface, i);
    }
}
