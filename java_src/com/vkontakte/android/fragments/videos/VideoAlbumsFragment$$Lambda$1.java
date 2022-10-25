package com.vkontakte.android.fragments.videos;

import android.content.DialogInterface;
import com.vkontakte.android.api.VideoAlbum;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoAlbumsFragment$$Lambda$1 implements DialogInterface.OnClickListener {
    private final VideoAlbumsFragment arg$1;
    private final VideoAlbum arg$2;
    private final int arg$3;

    private VideoAlbumsFragment$$Lambda$1(VideoAlbumsFragment videoAlbumsFragment, VideoAlbum videoAlbum, int i) {
        this.arg$1 = videoAlbumsFragment;
        this.arg$2 = videoAlbum;
        this.arg$3 = i;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(VideoAlbumsFragment videoAlbumsFragment, VideoAlbum videoAlbum, int i) {
        return new VideoAlbumsFragment$$Lambda$1(videoAlbumsFragment, videoAlbum, i);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showDeleteDialog$0(this.arg$2, this.arg$3, dialogInterface, i);
    }
}
