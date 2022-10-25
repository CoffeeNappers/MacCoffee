package com.vkontakte.android.fragments.messages;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.messages.MessagesGetHistoryAttachments;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.videos.AbsVideoListFragment;
import java.util.List;
/* loaded from: classes3.dex */
public class ChatVideoAttachmentHistoryFragment extends AbsVideoListFragment {
    private String nextFrom = null;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    public int getOwnerID() {
        return 0;
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    protected String getReferer() {
        return "news";
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    @NonNull
    protected VKAPIRequest<VKList<VideoFile>> getRequest(int offset, int count) {
        return MessagesGetHistoryAttachments.create(VideoFile.class, getArguments().getInt("peer_id"), offset == 0 ? null : this.nextFrom, count);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(List<VideoFile> d, boolean more) {
        this.nextFrom = MessagesGetHistoryAttachments.nextFrom(d);
        super.onDataLoaded(d, !TextUtils.isEmpty(this.nextFrom));
    }
}
