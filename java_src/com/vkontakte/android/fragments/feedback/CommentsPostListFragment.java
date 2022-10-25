package com.vkontakte.android.fragments.feedback;

import android.content.Context;
import android.os.Bundle;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.newsfeed.NewsfeedGetComments;
import com.vkontakte.android.data.VKFromList;
import com.vkontakte.android.fragments.PostListFragment;
/* loaded from: classes2.dex */
public class CommentsPostListFragment extends PostListFragment {
    private String from = "";

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle state) {
        super.onCreate(state);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getReferer() {
        return "news";
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getListReferrer() {
        return "comments";
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new NewsfeedGetComments(offset == 0 ? "" : this.from, count).setCallback(new SimpleCallback<VKFromList<NewsEntry>>(this) { // from class: com.vkontakte.android.fragments.feedback.CommentsPostListFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKFromList<NewsEntry> news) {
                CommentsPostListFragment.this.from = news.from();
                CommentsPostListFragment.this.onDataLoaded(news, CommentsPostListFragment.this.from != null && CommentsPostListFragment.this.from.length() > 0);
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected boolean canUnsubscribe() {
        return true;
    }
}
