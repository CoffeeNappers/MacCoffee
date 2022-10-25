package com.vkontakte.android.fragments.videos;

import android.content.DialogInterface;
import com.vkontakte.android.api.VideoFile;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoAlbumFragment$$Lambda$1 implements DialogInterface.OnClickListener {
    private final VideoAlbumFragment arg$1;
    private final VideoFile arg$2;

    private VideoAlbumFragment$$Lambda$1(VideoAlbumFragment videoAlbumFragment, VideoFile videoFile) {
        this.arg$1 = videoAlbumFragment;
        this.arg$2 = videoFile;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(VideoAlbumFragment videoAlbumFragment, VideoFile videoFile) {
        return new VideoAlbumFragment$$Lambda$1(videoAlbumFragment, videoFile);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showDeleteDialog$0(this.arg$2, dialogInterface, i);
    }
}
