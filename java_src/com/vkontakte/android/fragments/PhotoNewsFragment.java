package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Context;
import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.newsfeed.NewsfeedGet;
import com.vkontakte.android.data.VKFromList;
/* loaded from: classes2.dex */
public class PhotoNewsFragment extends PostListFragment {
    private String from;

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setEmptyText(R.string.no_news_photos);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getReferer() {
        return "";
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getListReferrer() {
        return "";
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new NewsfeedGet(offset == 0 ? AppEventsConstants.EVENT_PARAM_VALUE_NO : this.from, count, -4).setCallback(new SimpleCallback<VKFromList<NewsEntry>>(this) { // from class: com.vkontakte.android.fragments.PhotoNewsFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKFromList<NewsEntry> news) {
                PhotoNewsFragment.this.from = news.from();
                PhotoNewsFragment.this.onDataLoaded(news, PhotoNewsFragment.this.from != null && PhotoNewsFragment.this.from.length() > 0);
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected boolean isPhotosMode() {
        return true;
    }
}
