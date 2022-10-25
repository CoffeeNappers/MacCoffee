package com.vkontakte.android.fragments.fave;

import android.content.Context;
import android.os.Bundle;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.fave.FaveGetPosts;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.PostListFragment;
/* loaded from: classes2.dex */
public class FavePostListFragment extends PostListFragment {
    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle s) {
        super.onCreate(s);
        setRefreshEnabled(false);
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, final int count) {
        if (offset != 0) {
            offset = this.offset;
        } else {
            this.offset = 0;
        }
        this.currentRequest = new FaveGetPosts(offset, count).setCallback(new SimpleCallback<VKList<NewsEntry>>(this) { // from class: com.vkontakte.android.fragments.fave.FavePostListFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<NewsEntry> news) {
                FavePostListFragment.this.offset += count;
                FavePostListFragment.this.onDataLoaded(news, news.size() > 0);
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getReferer() {
        return "fave";
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getListReferrer() {
        return "fave";
    }
}
