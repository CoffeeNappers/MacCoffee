package com.vkontakte.android.fragments.videos;

import android.os.Bundle;
import android.support.annotation.NonNull;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoGet;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes3.dex */
public class TaggedVideosFragment extends AbsVideoListFragment {
    public static TaggedVideosFragment newInstance(int ownerId, boolean select) {
        Bundle args = new Bundle();
        args.putInt("album_id", VideoAlbum.ALBUM_ID_TAGGED);
        args.putInt(ArgKeys.UID, ownerId);
        args.putBoolean(ArgKeys.SELECT, select);
        TaggedVideosFragment result = new TaggedVideosFragment();
        result.setArguments(args);
        return result;
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    @NonNull
    protected VKAPIRequest<VKList<VideoFile>> getRequest(int offset, int count) {
        return VideoGet.getUserVideos(super.getOwnerID(), offset, count);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    public int getOwnerID() {
        return 0;
    }

    public void disableRefresh() {
        setRefreshEnabled(false);
    }
}
