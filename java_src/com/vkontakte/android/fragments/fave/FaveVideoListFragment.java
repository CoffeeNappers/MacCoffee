package com.vkontakte.android.fragments.fave;

import android.support.annotation.NonNull;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoGet;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.videos.AbsVideoListFragment;
/* loaded from: classes2.dex */
public class FaveVideoListFragment extends AbsVideoListFragment {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    public int getOwnerID() {
        return 0;
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    protected String getReferer() {
        return "fave";
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    @NonNull
    protected VKAPIRequest<VKList<VideoFile>> getRequest(int offset, int count) {
        return VideoGet.getBookmarks(offset, count);
    }
}
