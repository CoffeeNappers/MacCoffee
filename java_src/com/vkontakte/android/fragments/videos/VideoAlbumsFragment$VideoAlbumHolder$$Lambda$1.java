package com.vkontakte.android.fragments.videos;

import android.support.v7.widget.PopupMenu;
import android.view.MenuItem;
import com.vkontakte.android.fragments.videos.VideoAlbumsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoAlbumsFragment$VideoAlbumHolder$$Lambda$1 implements PopupMenu.OnMenuItemClickListener {
    private final VideoAlbumsFragment.VideoAlbumHolder arg$1;

    private VideoAlbumsFragment$VideoAlbumHolder$$Lambda$1(VideoAlbumsFragment.VideoAlbumHolder videoAlbumHolder) {
        this.arg$1 = videoAlbumHolder;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(VideoAlbumsFragment.VideoAlbumHolder videoAlbumHolder) {
        return new VideoAlbumsFragment$VideoAlbumHolder$$Lambda$1(videoAlbumHolder);
    }

    @Override // android.support.v7.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$onClick$0(menuItem);
    }
}
